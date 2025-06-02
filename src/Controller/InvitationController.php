<?php

namespace App\Controller;

use App\Entity\Project;
use App\Entity\User;
use App\Form\ProjectType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\String\Slugger\SluggerInterface;
use App\Service\Uploader\FileUploader;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Mime\Email;
use Symfony\Component\Mailer\MailerInterface as SymfonyMailerInterface;
use Symfony\Component\Mime\Address;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Entity\Invitation;
use App\Entity\ProjectStatus;
use App\Entity\ProjectUserStatus;

#[Route('/invitation')]
class InvitationController extends AbstractController
{

	public function getAllSentInvitations( Request $request, EntityManagerInterface $entityManager )
    {
		$userId			= $request->get( 'userId' );
		$user 			= $entityManager->getRepository( User::class )->findOneById( $userId );
		$status 		= 1; // invitation sent
		$invitations 	= $entityManager->getRepository( Invitation::class )->findby( Array( 'user' => $user, 'status' => $status ) );

		$response = new JsonResponse();
		$response->setData( $invitations );
		$response->setStatusCode( 200, "Invitations list" );
		return $response;
    }
	
	// Get sent project API
	public function getProjectSentInvitations( Request $request, EntityManagerInterface $entityManager )
	{
		$userId = $request->get('userId');
		$projectId = $request->get('projectId');
		$project = $entityManager
            ->getRepository(Project::class)
			->findOneById( $projectId );
		$user = $entityManager
            ->getRepository(User::class)
			->findOneById( $userId );

		$invitations = $entityManager
            ->getRepository(Invitation::class)
			->findby( Array( 'project' => $project, 'user' => $user ) );
		
		$resp = Array();
		
		foreach( $invitations as $invitation ){

			$obj 		= [ 
				'id' 			=> $invitation->id,
				'projectTitle' 	=> $project->title,
				'dateSending' 	=> \date(  'Y-m-d', $invitation->dateCreated->getTimestamp() ),
				'status' 		=> $invitation->status,
				'receiverEmail' => $invitation->receiverEmail,
				'receiverName'  => $invitation->receiverName,
				'attempts'  	=> $invitation->attempts,
				
			];
			$resp[] = $obj;
		}

		$response = new JsonResponse();
		$response->setData( $resp );
		$response->setStatusCode( 200, "User invitation" );
		return $response;
	}

	// Get sent project API
	public function invitationResend( Request $request, EntityManagerInterface $entityManager ){
		
		$response = new JsonResponse();
		
		$projectId		= $request->get( 'projectId' );
		$email 			= $request->get( 'email' );
		
		$project = $entityManager->getRepository( Project::class )->findOneById( $projectId );
		
		// Update user's project status to Invitation registered ( to be send )
		$projectUserStatus 	= $entityManager->getRepository( ProjectUserStatus::class )->findOneby( Array( 'project' => $project, 'email' => $email ) );
		if( is_null( $projectUserStatus ) ) {
			$response->setData( false );
			$response->setStatusCode( 404, "Project or email not find" );
			return $response;	
		}
		
		$statusId = 1;   // invitation registered ( to be send by the cron job ) 
		$status = $entityManager->getRepository( ProjectStatus::class )->findOneById( $statusId );
		$projectUserStatus->setProjectStatus( $status );
		$entityManager->persist( $projectUserStatus ); 
		$entityManager->flush();
		
		// Update the invitation attempts and status
		$invitation = $entityManager->getRepository( Invitation::class )->findOneby( Array( 'project' => $project, 'receiverEmail' => $email ) );
		if( is_null( $invitation ) ) {
			$response->setData( false );
			$response->setStatusCode( 404, "Invitation not find" );
			return $response;	
		}
		$attempts = $invitation->getAttempts() + 1;   // 
		$invitation->setAttempts( $attempts ); 
		$invitation->setStatus( $statusId ); // to do: set an object
		$entityManager->persist( $invitation ); 
		$entityManager->flush();
		
		$response->setData( true );
		$response->setStatusCode( 200, "Project's user status updated" );
		return $response;	
		
	}
}
