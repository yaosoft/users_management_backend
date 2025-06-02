<?php

namespace App\Controller;

use App\Entity\Project;
use App\Entity\ProjectCategory;
use App\Entity\ProjectType;
use App\Entity\ProjectDuration;
use App\Entity\ProjectFile;
use App\Entity\ChatMessage;
use App\Entity\ChatFile;
use App\Entity\ChatItemCategory;
use App\Entity\ProjectStatus;
use App\Entity\ProjectUserStatus;
use App\Entity\User;
use App\Entity\Invitation;
use App\Form\ProjectTypeForm;
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
use Symfony\Component\HttpFoundation\JsonResponse;

#[Route('/project')]
class ProjectController extends AbstractController
{
    public function index(EntityManagerInterface $entityManager): Response
    {
		$user 		= $this->getUser();
		$isadmin  	= $user->getIsadmin();
		$projects 	= '';
		if( !$isadmin ){	// an admin can see all projects
			$projects = $entityManager
            ->getRepository(Project::class)
            ->findByUser( $user );
		}
		else{
			$projects = $entityManager
            ->getRepository(Project::class)
			->findAll();	
		}
		
        return $this->render('Project/index.html.twig', [
            'projects' => $projects,
        ]);
    }

    public function new(Request $request, EntityManagerInterface $entityManager, SluggerInterface $slugger): Response
    {
        $project = new Project();
        $form = $this->createForm(ProjectTypeForm::class, $project);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
			
			// upload the File
			$projectFile = $form->get('path')->getData();

            // this condition is needed because the 'brochure' field is not required
            // so the PDF file must be processed only when a file is uploaded
            if ($projectFile) {
                $originalFilename = pathinfo($projectFile->getClientOriginalName(), PATHINFO_FILENAME);
                // this is needed to safely include the file name as part of the URL
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename.'-'.uniqid().'.'.$projectFile->guessExtension();

                // Move the file to the directory where project's files are stored
                try {
                    $projectFile->move(
                        'uploads/files/projects',
                        $newFilename
                    );
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                }

                // updates the 'brochureFilename' property to store the PDF file name
                // instead of its contents
                $project->setPath($newFilename);
            }

			$user = $this->getUser();
			$project->setUser( $user );
            $entityManager->persist($project);
            $entityManager->flush();

            return $this->redirectToRoute('app_project_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('Project/new.html.twig', [
            'project' => $project,
            'form' => $form,
        ]);
    }

    public function show(Request $request, Project $project, EntityManagerInterface $entityManager): Response
    {
		$user 			= $this->getUser();		// loged user
		$isadmin		= $user->getIsadmin();	// system admin
		$defaultAdminId = 8; // Todo: put the value in config file
		$defaultAdmin   = $entityManager->getRepository( User::class )	// user sent messages
								    ->findOneById( $defaultAdminId );
        $projectUser 	= $project->getUser();												// client
		$projectManager	= $project->getManager() ? $project->getManager() : $defaultAdmin;	// Project's manager
		$projectFile	= $project->getPath() ? $project->getPath() : '';
		$projectFileURL = $projectFile ? $request->getScheme() . '://' . $request->getHttpHost() . $request->getBasePath() . '/uploads/files/projects/' . $projectFile : '';  // Todo: 

		if( $user == $projectUser || $isadmin ){
			return $this->render('Project/show.html.twig', [
				'project' 			=> $project,
				'projectManager' 	=> $projectManager,
				'messageReceiver' 	=> $user == $projectManager ? $projectUser : $projectManager,
				'projectFileURL'	=> $projectFileURL,
			]);
		}
		else{
			return new Response('This project is not yours');
		}
    }

    public function edit(Request $request, Project $project, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ProjectType::class, $project);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
			$user = $this->getUser();
			$project->setUser( $user );
			$entityManager->persist($project);
            $entityManager->flush();

            return $this->redirectToRoute('app_project_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('Project/edit.html.twig', [
            'project' => $project,
            'form' => $form,
        ]);
    }

    public function delete(Request $request, Project $project, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$project->getId(), $request->request->get('_token'))) {
            $entityManager->remove($project);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_project_index', [], Response::HTTP_SEE_OTHER);
    }

    

	// Get project's categories API
	public function getCategory(Request $request, EntityManagerInterface $entityManager )
	{
		$projectCategories = $entityManager
            ->getRepository(ProjectCategory::class)
			->findAll();
		
		$response = new JsonResponse();
		$response->setData( $projectCategories );
		$response->setStatusCode( 200, "User created" );
		return $response;
	}

	// Get project's types API
	public function getType(Request $request, EntityManagerInterface $entityManager )
	{
		$projectTypes = $entityManager
            ->getRepository(ProjectType::class)
			->findAll();

		$response = new JsonResponse();
		$response->setData( $projectTypes );
		$response->setStatusCode( 200, "Types found" );
		return $response;
	}

	// Get project's durations API
	public function getDuration(Request $request, EntityManagerInterface $entityManager )
	{
		$projectDurations = $entityManager
            ->getRepository(ProjectDuration::class)
			->findAll();

		$response = new JsonResponse();
		$response->setData( $projectDurations );
		$response->setStatusCode( 200, "Durations found" );
		return $response;
	}

	// save a project
	public function saveProject( FileUploader $fileUploader, Request $request, EntityManagerInterface $entityManager )
    {
		$uploadeds  	= $request->files->get('files') != null ? $request->files->get('files') : [];

		$userId 		= $request->getPayload()->get( 'userId' );
		$categoryId 	= $request->getPayload()->get( 'category' );
		$title 			= $request->getPayload()->get( 'title' );
		$description 	= $request->getPayload()->get( 'description' );
		$typeId			= $request->getPayload()->get( 'type' );
		$budget 		= $request->getPayload()->get( 'budget' );
		$lengthId 		= $request->getPayload()->get( 'length' );
		$sendingDate 	= $request->getPayload()->get( 'sendingDate' );
		$projectId	 	= $request->getPayload()->get( 'projectId' );
		$filesToDelete	= $request->getPayload()->get( 'filesToDelete' );
		$toSave			= $request->getPayload()->get( 'toSave' ) == 'false' ? 0 : 1;

		// save the project
		$project = ( !$projectId || $projectId == null ) ? new Project : $entityManager
            ->getRepository(Project::class)->findOneById( $projectId );

		$user = $entityManager
            ->getRepository(User::class)->findOneById( $userId );
		$projectCategory = $entityManager
            ->getRepository(ProjectCategory::class)->findOneById( $categoryId );
		$projectType = $entityManager
            ->getRepository(ProjectType::class)->findOneById( $typeId );
		$duration = $entityManager
            ->getRepository(ProjectDuration::class)->findOneById( $lengthId );

		$project->setUser( $user );
		$project->setProjectCategory( $projectCategory );
		$project->setTitle( $title );
		$project->setDescription( $description );
		$project->setProjectType( $projectType );		
		$project->setBudget( $budget );	
		$project->setProjectDuration( $duration ); 
		$project->setDraft( $toSave );
		$entityManager->persist( $project ); 
		$entityManager->flush();

		// save project's invitations and user status on the project
		$invitation_Json 	= $request->getPayload()->get( 'invitations' );
		$invitations		= json_decode( $invitation_Json, true );

		foreach( $invitations as $k => $v ){
			if( $toSave == 0 ){	
				$invitation = '';
				if( !isset( $v[ 'id' ] ) ){
					$invitation = new Invitation;
					$invitation->setAttempts( 0 );
				}
				else{
					$invitation = $entityManager
					->getRepository(Invitation::class)->findOneById( $v[ 'id' ] );	
				}			
				
				$invitation->setReceiverEmail( $v[ 'email' ] );
				$invitation->setUser( $user );
				$invitation->setProject( $project );
				$invitation->setReceiverName( $v[ 'name' ] );
					

				$invitation->setStatus( 1 );
				$invitation->setDateSending( new \DateTime( $sendingDate ? $sendingDate : '' ) );

				$entityManager->persist( $invitation );
				$entityManager->flush();
			}
			
			// save status

			// check if entry already exists in ProjectUserStatus
			$statusId 		= $toSave == 1 ? 3 : 1 ; // Draft | Invitation registered 

			$projectStatus 	= $entityManager
			->getRepository( ProjectStatus::class )->findOneById( $statusId );
			
			$check = $entityManager->getRepository( ProjectUserStatus::class )		// user received files
								   ->findOneBy( Array( 
										'email' 		=> $v[ 'email' ], 
										'project' 		=> $project, 
										// 'projectStatus' => $projectStatus 
									) );

			$projectUserStatus = '';
			if( $check != null )
				$projectUserStatus = $check;
			else
				$projectUserStatus = new ProjectUserStatus();
			
			// check if the receiver email already exists
			$user = $entityManager->getRepository( User::class )		// user received files
								   ->findOneBy( Array( 'email' => $v[ 'email' ] ) );
			if( $user != null )
				$projectUserStatus->setUser( $user );

			$projectUserStatus->setEmail( $v[ 'email' ] );
			$projectUserStatus->setProject( $project );
			$projectUserStatus->setProjectStatus( $projectStatus );

			$entityManager->persist( $projectUserStatus );
			$entityManager->flush();
		}

		// save project's files
		foreach( $uploadeds as $k => $v ){
			$extension 	= $v->getClientOriginalExtension();
			$fileName 	= $v->getClientOriginalName();
			$size 		= $v->getSize();
			// Move the file
			$path  	= $fileUploader->upload( $v ); // Important: call this after $uploaded->getSize()
			$projectFile 	= new ProjectFile;
			$projectFile->setName( $fileName );	// Original name
			$projectFile->setSize( $size );
			$projectFile->setExtension( $extension );
			$projectFile->setProject( $project );
			
			// $projectFile->setDraft( $project );

			$projectFile->setPath( $path );
		
			$entityManager->persist( $projectFile );
			$entityManager->flush();
		}

		// delete files to be deleted
		$toDelete	= !empty( $filesToDelete ) ? explode( ',', $filesToDelete ) : [];
		foreach( $toDelete as $k => $v ){
			$file 	= $entityManager
            ->getRepository(ProjectFile::class)
			->findOneById( trim( $v ) );
			
            $entityManager->remove($file);
            $entityManager->flush();
		}

		// response
		$response = new JsonResponse();
		$response->setData( $project->id );
		$response->setStatusCode( 200, "Project Saved" );
		return $response;

    }

	// Get sent project API
	public function getSentProjects( Request $request, EntityManagerInterface $entityManager )
	{
		$response = new JsonResponse();
		
		$userId = $request->get('userId');
		$user 	= $entityManager
            ->getRepository(User::class)
			->findOneById( $userId );

		$projects = $entityManager
            ->getRepository(Project::class)
			->findby( Array( 'user' => $user, 'draft' => false ),  array( 'dateCreated' => 'DESC' ) );

		$resp = Array();

		foreach( $projects as $project  ){
			$obj = [ 
				'id' 		=> $project->id,
				'title' 	=> $project->getTitle(),
				'date' 		=> \date(  'Y-m-d', $project->getDateCreated()->getTimestamp() ),
				'category' 	=> $project->getProjectCategory() != null ? $project->getProjectCategory()->getTitle() : 'None',
				'status' 	=> 0,
			];
			$resp[] = $obj;
		}
		
		
		$response->setData( $resp );
		$response->setStatusCode( 200, "Projects found" );
		return $response;
	}

	// Get received project API
	public function getReceivedProjects( Request $request, EntityManagerInterface $entityManager )
	{
		$userId = $request->get('userId');
		$user 	= $entityManager
            ->getRepository(User::class)
			->findOneById( $userId );
// var_dump( $userId );
		$statusId01 = 4; // invitation sent 
		$projectStatus01 	= $entityManager
			->getRepository(ProjectStatus::class)->findOneById( $statusId01 );

		$statusId02 = 5; // project read
		$projectStatus02 	= $entityManager
			 ->getRepository(ProjectStatus::class)->findOneById( $statusId02 );

		$user_projects = $entityManager
            ->getRepository(ProjectUserStatus::class)
			->findby( Array( 'user' => $user, 'projectStatus' => [ $projectStatus01, $projectStatus02 ] ),  array( 'dateCreated' => 'DESC' ) );

		$resp = Array();

		foreach( $user_projects as $user_project ){
			$project = $user_project->getProject();
			$obj = [ 
				'id' 		=> $project->id,
				'title' 	=> $project->getTitle(),
				'date' 		=> \date(  'Y-m-d', $project->getDateCreated()->getTimestamp() ),
				'category' 	=> $project->getProjectCategory()->getTitle(),
				'status' 	=> $user_project->getProjectStatus()->id,
			];
			$resp[] = $obj;
		}
// var_dump( $resp );
		$response = new JsonResponse();
		$response->setData( $resp );
		$response->setStatusCode( 200, "Projects found" );
		return $response;
	}

	// Get saved project API
	public function getSavedProjects( Request $request, EntityManagerInterface $entityManager )
	{
		$userId = $request->get('userId');
		$user 	= $entityManager
            ->getRepository(User::class)
			->findOneById( $userId );

		$projects = $entityManager
            ->getRepository(Project::class)
			->findby( Array( 'user' => $user, 'draft' => true ), array( 'dateCreated' => 'DESC' ) );

		$resp = Array();

		foreach( $projects as $project  ){
			$obj = [ 
				'id' 		=> $project->id,
				'title' 	=> $project->getTitle(),
				'date' 		=> \date(  'Y-m-d', $project->getDateCreated()->getTimestamp() ),
				'category' 	=> $project->getProjectCategory()->getTitle(),
				'status' 	=> 0,
			];
			$resp[] = $obj;
		}
		
		$response = new JsonResponse();
		$response->setData( $resp );
		$response->setStatusCode( 200, "Draft Project found" );
		return $response;
	}

	// Get sent projects API
	public function getProject( Request $request, EntityManagerInterface $entityManager )
	{
		$projectId 		= $request->get( 'projectId' );
		// $projectStatus 	= $request->get( 'projectStatus' );
		$userId			= $request->get( 'userId' );
		$firstOpening	= false;
		$project = $entityManager
            ->getRepository( Project::class )
			->findOneById( $projectId );
		
		$user = $entityManager
            ->getRepository( User::class )
			->findOneById( $userId );
			
		$projectUserStatusObj = $entityManager
            ->getRepository(ProjectUserStatus::class)
			->findOneBy( Array( 'project' => $project, 'user' => $user ) );
		$projectStatus = $projectUserStatusObj->getProjectStatus()->id;

		$ownerId = $project->getUser()->getId();		// owner

		// update project's status from sent to read if necessary
		if( $projectStatus && $projectStatus != 5 && $userId != $ownerId ){	// 
			$projectStatus  = 5; 	// project read
			$firstOpening	= true;
			// send first project message
			
			
			// update the user's project status to read
			

			$status = $entityManager
			->getRepository(ProjectStatus::class)
			->findOneById( $projectStatus );

			$projectUserStatusObj->setProjectStatus( $status );

			$entityManager->persist($projectUserStatusObj); 
            $entityManager->flush();
		}

		$projectFile = $entityManager
            ->getRepository(ProjectFile::class)
			->findBy( Array( 'project' => $project ) );

		$files 			= Array();
		// $file 			= new \stdClass();

		foreach( $projectFile as $k => $v ){
			$path 			= $v->getPath();
			$extension  	= $v->getExtension();
			$size			= $v->getSize();
			$name			= $v->getName();
			$id				= $v->id;
			$dateCreated	= $v->getDateCreated();

			$file = new \stdClass();
			
			$file->id 			= $id;
			$file->path 		= $path;
			$file->extension 	= $extension;
			$file->size 		= $size;
			$file->name 		= $name;
			$file->dateCreated 	= \date( 'Y-m-d', $project->dateCreated->getTimestamp() );

			$files[] = $file;
		}
// var_dump( $files );
		$r = [ 
			'id' 				=> $project->id,
			'title' 			=> $project->getTitle(),
			'date' 				=> \date(  'Y-m-d', $project->dateCreated->getTimestamp() ),
			'today'				=> \date( 'Y-m-d' ),
			'categoryId' 		=> $project->projectCategory->id,
			'categoryTitle' 	=> $project->projectCategory->getTitle(),
			'categoryDescription' 	=> $project->projectCategory->getDescription(),
			'durationId'		=> $project->getProjectDuration()->id,
			'durationTitle'		=> $project->getProjectDuration()->getTitle(),
			'budget'			=> $project->getBudget(),
			'files' 			=> $files,
			'projectTypeId' 	=> $project->projectType->id,
			'projectTypeTitle' 	=> $project->projectType->getTitle(),
			'description' 		=> $project->getDescription(),
			'owner' 			=> $project->getUser()->getUserName(),
			'ownerId' 			=> $project->getUser()->getId(),
			'firstOpening'		=> $firstOpening,
			'projectStatus'		=> $projectStatus,
		];
		
		
		$response = new JsonResponse();
		$response->setData( $r );
		$response->setStatusCode( 200, "Project Found" );
		return $response;
	}	

	// Check if user is the project owner
	public function isOwner( Request $request, EntityManagerInterface $entityManager )
	{
		$response = new JsonResponse();

		$projectId 	= $request->get('projectId');
		$userId 	= $request->get('userId');

		$user = $entityManager
            ->getRepository(User::class)
			->findOneById( $userId );
		
		if( !$user ){
			$resp = false;
			$response->setData( $resp );
			$response->setStatusCode( 201, "User not found" );
			return $response;
		}

		$project = $entityManager
            ->getRepository( Project::class )
			->findOneById( $projectId );

		$resp = $project->getUser() == $user ? true : false;

		$response = new JsonResponse();
		$response->setData( $resp );
		$response->setStatusCode( 200, "User created" );
		return $response;
	}
	
	// get the project user status
	public function getStatus( Request $request, EntityManagerInterface $entityManager )
	{
		$projectId 	= $request->get('projectId');

		$projet = $entityManager
            ->getRepository( Project::class )
			->findOneById( $projectId );

		if( !$projet ){
			$resp = false;
			$response->setData( $resp );
			$response->setStatusCode( 201, "Project not found" );
			return $response;
		}

		$projetStatusId = 2; // sarted project
		$projectStatus = $entityManager
            ->getRepository( ProjectStatus::class )
			->findOneById( $projetStatusId );

		$status = $entityManager
            ->getRepository( ProjectUserStatus::class )
			->findBy( Array( 'project' => $projet, 'projectStatus' => $projectStatus  ) );

		// $resp = $status;

		$response = new JsonResponse();
		$response->setData( $status );
		$response->setStatusCode( 200, "Status" );
		return $response;
	}
	
	
	
	// update the user project status
	public function updateUserProjectStatus( Request $request, EntityManagerInterface $entityManager )
	{
		$userId 	= $request->get('userId');
		$email 		= $request->get('userEmail');

		$userProjets = $entityManager
            ->getRepository( ProjectUserStatus::class )
			->findByEmail( $email );

		$user = $entityManager
            ->getRepository(User::class)
			->findOneById( $userId );

		// $invitationViewedStatus = 5;
		// $status = $entityManager
        //    ->getRepository(ProjectStatus::class)
		//	->findOneById( $invitationViewedStatus );

		$response = new JsonResponse();

		if( count( $userProjets ) == 0 ){
			$resp = false;
			$response->setData( $resp );
			$response->setStatusCode( 201, "No project found" );
			return $response;
		}

		foreach( $userProjets as $userProjet ){
			$userProjet->setUser( $user );
			// $userProjet->setProjectStatus( $status );
			$entityManager->persist($userProjet);
            $entityManager->flush();
		}

		$response->setData( 1 );
		$response->setStatusCode( 200, "Status" );
		return $response;
	}
}
