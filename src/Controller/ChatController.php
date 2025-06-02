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

class ChatController extends AbstractController
{
	public function deleteChatMessage( Request $request, EntityManagerInterface $entityManager )
    {
		$response = new JsonResponse();
		
        $messageId 	= $request->get('messageId');
		$message	= $entityManager->getRepository( ChatMessage::class )	// user sent messages
								    ->findOneById( $messageId );
		if( is_null( $message ) ){
			$response->setData( 'Message not found' );
			$response->setStatusCode( 404, "Chat message not found!" );

			return $response;
		}
	
		$entityManager->remove( $message );
        $entityManager->flush();

        return new Response( 1, Response::HTTP_OK );
    }

    public function deleteChatFile( Request $request, EntityManagerInterface $entityManager )
    {
		$response = new JsonResponse();
		
        $messageId 	= $request->get('messageId');
		$message	= $entityManager->getRepository( ChatFile::class )	// user sent messages
								    ->findOneById( $messageId );
		if( is_null( $message ) ){
			$response->setData( 'Message not found' );
			$response->setStatusCode( 404, "Chat file not found!" );

			return $response;
		}
	
		$entityManager->remove( $message );
        $entityManager->flush();

        return new Response( 1, Response::HTTP_OK );
    }

	// Get all user messages and files for a project
	public function getMessages( Request $request, EntityManagerInterface $entityManager )
    {
		// $websocketManager = new WebsocketManager();
		// $websocketManager->sendMessage( 'foo' );
		
		$response = new JsonResponse();

		$userId 	= $request->get('userId');
		$projectId	= $request->get('projectId');
		$project 	= $entityManager
            ->getRepository(Project::class)
			->findOneById( $projectId );

		$user = $entityManager
            ->getRepository(User::class)
			->findOneById( $userId );

        $messages01 = $entityManager->getRepository( ChatMessage::class )	// user sent messages
								    ->findBy( Array( 'user' => $user, 'project' => $project ) );					
        $messages02 = $entityManager->getRepository( ChatMessage::class )	// user received messages
								    ->findBy( Array( 'receiver' => $user, 'project' => $project ) );
        $messages03 = $entityManager->getRepository( ChatFile::class )		// user sent files
								    ->findBy( Array( 'user' => $user, 'project' => $project ) );
        $messages04 = $entityManager->getRepository( ChatFile::class )		// user received files
								    ->findBy( Array( 'receiver' => $user, 'project' => $project ) );
									
		// Create message array
		$messages   = array_merge( $messages01, $messages02, $messages03, $messages04 );
		$name 		= $user->getUserName();
		$userid 	= $user->getId();
		$my 		= Array();
		$cancelable = 2400; // 1 hour
		if( !count( $messages ) ){
			$response->setData( [] );
			$response->setStatusCode( 200, "No Chat messages" );
			return $response;
		}
		$todayTimestamp = strtotime( date("Y-m-d H:i:s")  );
		$todayDay 	= \date( 'Y-m-d', $todayTimestamp);
		
		//
		foreach( $messages as $k => $v ){	

			$isReceiver = ( $userid == $v->getReceiver()->getId() ) ? true : false;
			$side 		= $isReceiver ? 'right' : 'left';
			$name 		= $v->getUser()->getUserName();
			
			if( !method_exists( $v, 'getPath' ) ){			// Messages
				$text				= $v->getChatMessage();
				$dateCreated 		= $v->getDateCreated()->format( 'Y-m-d H:i:s' );

				// message info
				$timestamp 			= strtotime( $dateCreated );
				$day 				= \date( 'Y-m-d', $timestamp);	// message day
				$hour				= \date( 'H:i', $timestamp);
				$displayDate 		= ( $day == $todayDay ) ? $hour : $day . ', ' . $hour;
				$canbedeleted		= $todayTimestamp - $timestamp < $cancelable ? 1 : 0;
				$category	= $v->getChatMessageCategory()->getTitle();
				$isAReply	= in_array( $category, [ 'B', 'C' ], );
				$repliedMessage		= Array();
				if( $isAReply ){  // replied message info
					if( $category == 'B' ){
						$repliedArr		= $v->getChatMessageResponse();
						$replied 		= '';
						foreach( $repliedArr as $a => $b ){
							$replied 	= $b;
						}

						if( is_object( $replied ) ){
							$replied_message 	= $replied->getChatMessage();
							$replied_name 		= $replied->getUser()->getUserName();
							$replied_userId		= $replied->getUser()->getId();
							$repliedMessage[ 'name' ] 				= $replied_name;
							$repliedMessage[ 'userId' ] 			= $replied_userId;
							$repliedMessage[ 'replied_message' ] 	= $replied_message;
							$repliedMessage[ 'category' ] 			= $category;
							$repliedMessage[ 'messageId' ] 			= $replied->getId();
						}
					}
					else if ( $category == 'C' ){
						$repliedArr		= $v->getChatFileResponse();
						$replied 		= '';
						foreach( $repliedArr as $a => $b ){
							$replied 	= $b;
						}

						if( is_object( $replied ) ){
							// response message info
							$replied_name 		= $replied->getUser()->getUserName();
							$repliedMessage[ 'name' ] 				= $replied_name;
							$replied_userId							= $replied->getUser()->getId();
							$repliedMessage[ 'userId' ] 			= $replied_userId;
							$repliedMessage[ 'replied_fileSrc' ] 	= $replied->getPath();
							$repliedMessage[ 'replied_fileExt' ] 	= $replied->getExtension();
							$repliedMessage[ 'replied_fileName' ] 	= $replied->getName();
							$repliedMessage[ 'replied_fileSize' ] 	= $replied->getSize() / 1024 / 1024;
							$repliedMessage[ 'category' ] 			= $category;
							$repliedMessage[ 'messageId' ] 			= $replied->getId();
						}
					}
				}
				array_push( $my, Array( 
					'dateCreated' 			=> $dateCreated,
					'canbedeleted'			=> $v->getUser() == $user ? $canbedeleted : 0,
					'message' 				=> $text, 
					'side'					=> $side, 
					'timestamp'				=> $timestamp, 
					'day'					=> $day, 
					'hour'					=> $hour, 
					'displayDate'			=> $displayDate,
					'name'					=> $name,
					'type'					=> 'text',
					'messageId'				=> $v->getId(),
					'messageUserName'	 	=> $v->getUser()->getUserName(),
					'messageUserId'			=> $v->getUser()->getId(),
					'messageReceiverName' 	=> $v->getReceiver()->getUserName(),
					'messageReceiverId'		=> $v->getReceiver()->getId(),
					'viewed'				=> $v->getViewed(),
					'isReceiver'			=> $isReceiver,
					'repliedMessage'		=> $repliedMessage,
					'chatMode'				=> $v->getChatMode(),
				));
			}
			else{												// File
				$dateCreated 	= $v->getDateCreated();

				$dateCreated 	= $v->getDateCreated()->format( 'Y-m-d H:i:s' );
				$timestamp 		= strtotime( $dateCreated );
				$day 			= \date( 'Y-m-d', $timestamp);	// message day
				$hour			= \date( 'H:i', $timestamp);
				$displayDate 	= ( $day == $todayDay ) ? $hour : $day . ', ' . $hour;
				$canbedeleted	= $todayTimestamp - $timestamp < $cancelable ? 1 : 0;
				$category		= $v->getChatFileCategory()->getTitle();
				$isAReply		= in_array( $category, [ 'D', 'E' ], );
				$repliedFile	= Array();				

				if( $isAReply ){
					if( $category == 'D' ){
						$repliedArr		= $v->getChatMessageResponse();
						$replied 		= '';

						foreach( $repliedArr as $a => $b ){
							$replied 	= $b;
						}
// echo '-------------- Replied: ' . $replied;
						if( is_object( $replied ) ){
							$replied_message 	= $replied->getChatMessage();
							$replied_name 		= $replied->getUser()->getUserName();
							$replied_userId 		= $replied->getUser()->getId();
							$repliedFile[ 'name' ] 				= $replied_name;
							$repliedFile[ 'replied_message' ] 	= $replied_message;
							$repliedFile[ 'category' ] 			= $category;
							$repliedFile[ 'messageId' ] 		= $replied->getId();
						}
					}
					else if ( $category == 'E' ){
						$repliedArr		= $v->getChatFileResponse();
						$replied 		= '';

						foreach( $repliedArr as $a => $b ){
							$replied 	= $b;
						}

						if( is_object( $replied ) ){
							$replied_name 	= $replied->getUser()->getUserName();
							$replied_id 	= $replied->getUser()->getId();
							$repliedFile[ 'name' ] 				= $replied_name;
							$repliedFile[ 'userId' ] 			= $replied_userId;
							$repliedFile[ 'replied_fileSrc' ] 	= $replied->getPath();
							$repliedFile[ 'replied_fileExt' ] 	= $replied->getExtension();
							$repliedFile[ 'replied_fileName' ] 	= $replied->getName();
							$repliedFile[ 'replied_fileSize' ] 	= $replied->getSize() / 1024 / 1024;
							$repliedFile[ 'category' ] 			= $category;
							$repliedFile[ 'messageId' ] 		= $replied->getId();
						}
					}
				}

				array_push( $my, Array( 
					'dateCreated' 			=> $dateCreated,
					'canbedeleted'			=> $v->getUser() == $user ? $canbedeleted : 0,
					'fileName' 				=> $v->getName(),
					'side'					=> $side, 
					'timestamp'				=> $timestamp, 
					'day'					=> $day, 
					'hour'					=> $hour, 
					'displayDate'			=> $displayDate,
					'name'					=> $name,
					'size'					=> ( $v->getSize() / 1024 / 1024 ),
					'fileExtension'			=> $v->getExtension(),
					'path'					=> $v->getPath(),
					'type'					=> 'file',
					'lot'					=> $v->getLot(),
					'messageId'				=> $v->getId(),
					'messageUserName'	 	=> $v->getUser()->getUserName(),
					'messageUserId'			=> $v->getUser()->getId(),
					'messageReceiverName' 	=> $v->getReceiver()->getUserName(),
					'messageReceiverId'		=> $v->getReceiver()->getId(),
					'viewed'			=> $v->getViewed(),
					'isReceiver'		=> $isReceiver,
					'repliedFile'		=> $repliedFile,	// TODO: deal with multiple file replying a message
					'chatMode'			=> $v->getChatMode(),
				) );
			}
			
		}

		// Sort messages by dates from older to newer
		function dateCompare($element1, $element2) { // Comparison function  
			$datetime1 = $element1[ 'timestamp' ]; // Timestamp has index 3
			$datetime2 = $element2[ 'timestamp' ]; 
			return $datetime1 - $datetime2;
		}  
		usort( $my, 'App\Controller\dateCompare' ); // Sort the array  
		
		// return the right number of messages
		$messagesMaxNumber 		= 50;
		$messagesTotalNumber 	= count($my);
		$removeFrom 			= 0;
		$removeTo 				= $messagesTotalNumber > $messagesMaxNumber ? $messagesTotalNumber - $messagesMaxNumber : 0;
		
		array_splice( $my, $removeFrom, $removeTo );
		
		$response->setData( $my );
		$response->setStatusCode( 200, "Chat messages" );
		return $response;
    }

	// save chat message
    public function saveChatMessage(Request $request, EntityManagerInterface $entityManager)
    {
		
		// Create a message object
		$message 		= new ChatMessage();
		// Get posted data
		$messageTxt 		= $request->getPayload()->get( 'message_text' );
		$receiverId			= $request->getPayload()->get( 'receiver_id' );
		$projectId			= $request->getPayload()->get( 'project_id' );
		$replied_msg_id		= $request->getPayload()->get( 'replied_msg_id' );
		$replied_file_id	= $request->getPayload()->get( 'replied_file_id' );
		$userId				= $request->getPayload()->get( 'userId' );
		$chatMode			= $request->getPayload()->get( 'chatMode' );

		$user = $entityManager
            ->getRepository(User::class)
			->findOneById( $userId );

		// Other message data
		$viewed	 = false;
		// $user 	= $this->getUser();
		// Get entities objects
		$receiver 	= $entityManager->getRepository( User::class )->findOneById( $receiverId );
		$project 	= $entityManager->getRepository( Project::class )->findOneById( $projectId );
		// Set message object
		$message->setReceiver( $receiver );
		$message->setProject( $project );
		$message->setChatMessage( $messageTxt );
		$message->setViewed( $viewed );
		$message->setUser( $user );
		$message->setChatMode( $chatMode );
		$rep = '';
		$chatItemCategory = $entityManager->getRepository( ChatItemCategory::class );

		if( $replied_msg_id ){
			$replied_msg = $entityManager->getRepository( ChatMessage::class )->findOneById( $replied_msg_id );
			$message->addChatMessageResponse( Array( $replied_msg ) );	// Array() is required here
			$category = $chatItemCategory->findOneByTitle( 'B' );
			$message->setChatMessageCategory( $category );
		}
		else if( $replied_file_id ){
			$replied_file = $entityManager->getRepository( ChatFile::class )->findOneById( $replied_file_id );
			$message->addChatFileResponse( Array( $replied_file ) );
			$category = $chatItemCategory->findOneByTitle( 'C' );
			$message->setChatMessageCategory( $category );
		}
		else{
			$category = $chatItemCategory->findOneByTitle( 'A' );
			$message->setChatMessageCategory( $category );
		}
// var_dump( $rep->getChatMessageResponse()->getMessage() );
// die;
		$entityManager->persist( $message );

        $entityManager->flush();
		
		return new Response( $message->id, Response::HTTP_OK );

    }
	
	// save file
	public function saveChatFile( FileUploader $fileUploader, Request $request, EntityManagerInterface $entityManager )
    {
		$uploadeds  		= $request->files->get('files');
		$projectId			= $request->getPayload()->get( 'project_id' );
		$userId				= $request->getPayload()->get( 'userId' );
		$receiverId			= $request->getPayload()->get( 'receiver_id' );
		$chatMode			= $request->getPayload()->get( 'chatMode' );
		$replied_msg_id 	= $request->get('replied_msg_id');
		$replied_file_id	= $request->get('replied_file_id');
		
		$user = $entityManager
            ->getRepository(User::class)
			->findOneById( $userId );
		$project 	= $entityManager->getRepository( Project::class )->findOneById( $projectId );
		$receiver 	= $entityManager->getRepository( User::class )->findOneById( $receiverId );
		
		$uploaded	= $uploadeds[0];
		$extension 	= $uploaded->getClientOriginalExtension();
		$fileName 	= $uploaded->getClientOriginalName();
		$size 		= $uploaded->getSize();
		$lot		= rand(1111111111,9999999999);
		
// save product's files
		foreach( $uploadeds as $k => $v ){
			$extension 	= $v->getClientOriginalExtension();
			$fileName 	= $v->getClientOriginalName();
			$size 		= $v->getSize();

			// Move the file
			$path  	= $fileUploader->upload( $v ); 	// Important: dont call before $uploaded->getSize()

			$file 	= new ChatFile();

			$file->setName( $fileName );	// Original name
			$file->setSize( $size );
			$file->setExtension( $extension );
			$file->setPath( $path );
			$file->setLot( $lot );
			$file->setChatMode( $chatMode );
			$file->setViewed( false );
			$file->setReceiver( $receiver );
			$file->setProject( $project );
			$file->setUser( $user );
			$chatItemCategory = $entityManager->getRepository( ChatItemCategory::class );
			if( $replied_msg_id ){
				$replied_msg = $entityManager->getRepository( ChatMessage::class )->findOneById( $replied_msg_id );
				$file->addChatMessageResponse( Array( $replied_msg ) );
				$category = $chatItemCategory->findOneByTitle( 'D' );
				$file->setChatFileCategory( $category );
			}
			else if( $replied_file_id ){
				$replied_file = $entityManager->getRepository( ChatFile::class )->findOneById( $replied_file_id );
				$file->addChatFileResponse(  Array( $replied_file ) );
				$category = $chatItemCategory->findOneByTitle( 'E' );
				$file->setChatFileCategory( $category );
			}
			else{
				$category = $chatItemCategory->findOneByTitle( 'A' );
				$file->setChatFileCategory( $category );
			}

			$entityManager->persist( $file );
			$entityManager->flush();
		}
		
		
		
		
		return new Response( 1, Response::HTTP_OK );

    }
	
	// Set all project messages as read
	public function updateMessagesRead( Request $request, EntityManagerInterface $entityManager ): Response
    {
		$response = new JsonResponse();
		$userId		= $request->getPayload()->get( 'user_id' );
		$projectId	= $request->getPayload()->get( 'projectId' );
		$messagesId = $request->getPayload()->get( 'messagesId' );
		
		if( !$messagesId ){
			$response->setData( 'No messages id received' );
			$response->setStatusCode( 404, "Message not found" );
		}
		
		$messagesIds = explode( '-', $messagesId );

		// 
		foreach( $messagesIds as $messageIdAndType ){
			$data 			= explode( '*', $messageIdAndType );
			$messageType 	= $data[ 0 ];
			$messageId 		= $data[ 1 ];
			$message		= '';
			if( $messageType == 'text' ){
				$message = $entityManager
				->getRepository( ChatMessage::class )
				->findOneById( $messageId );				
			}
			else if( $messageType == 'file' ){
				$message = $entityManager
				->getRepository( ChatFile::class )
				->findOneById( $messageId );
			}
			
			$message->setViewed( true );
			$entityManager->persist( $message );
			$entityManager->flush();
		}
		return new Response( 1, Response::HTTP_OK );
	}
	
	// All project owner unread message
	public function getProjectUnreadMessages( Request $request, EntityManagerInterface $entityManager ): Response
    {
	}
	
	// All user unread messages
	public function getUserUnreadMessages( Request $request, EntityManagerInterface $entityManager ): Response
    {
		$response = new JsonResponse();
        $userId 	= $request->get('userId');
		$user = $entityManager
				->getRepository( User::class )
				->findOneById( $userId );

		$viewed = false;

		// get all user's text messages
		$userTextMessages = $entityManager->getRepository( ChatMessage::class )	// user sent messages
										 ->findBy( Array( 'receiver' => $user, 'viewed' => $viewed ) );
									
		// get all user's file messages
		$userFileMessages = $entityManager->getRepository( ChatFile::class )	// user sent messages
										 ->findBy( Array( 'receiver' => $user, 'viewed' => $viewed ) );
		
		$userUnreads = array_merge( $userTextMessages, $userFileMessages );
		
		$userUnreadMessages = [];
		$messageData		= Array();
		foreach( $userUnreads as $message ){
			$data =  Array();
			// message's sender
			$sender 				= $message->getUser();
			$senderId 				= $sender->getId();
			$project				= $message->getProject();
			$owner 					= $project->getUser();
			$isOwner 				= $owner->getId() == $userId ? true : false;
			$messageId 				= $message->getId();
			$senderName 			= $sender->getUserName();
			$messageFileName 		= '';
			$messageText	 		= '';
			if( !method_exists( $message, 'getPath' ) ){ // text message
				$messageText = $message->getChatMessage();
			}
			else{
				$messageFileName = $message->getName();
			}
			
			$dateCreated 		= $message->getDateCreated()->format( 'Y-m-d H:i:s' );
			$timestamp 			= strtotime( $dateCreated );
			$todayTimestamp 	= strtotime( date("Y-m-d H:i:s")  );
			$day 				= \date( 'Y-m-d', $timestamp);	// message day
			$hour				= \date( 'H:i', $timestamp);
			$todayDay 			= \date( 'Y-m-d', $todayTimestamp);
			$displayDate 		= ( $day == $todayDay ) ? $hour : $day . ', ' . $hour;
			
			$data[ 'senderId' ] 		= $senderId;
			$data[ 'senderName' ] 		= $senderName;
			$data[ 'isOwner' ] 			= $isOwner;			
			$data[ 'messageId' ] 		= $messageId;
			$data[ 'messageFileName' ] 	= $messageFileName;
			$data[ 'messageText' ] 		= $messageText;
			$data[ 'project' ] 			= $project;
			$data[ 'hour' ] 			= $hour;
			$data[ 'day' ] 				= $day;
			$data[ 'displayDate' ] 		= $displayDate;
			$data[ 'timestamp' ] 		= $timestamp;
			
			array_push( $messageData, $data );
		}

		$total = count( $messageData );

		// response
		
				// Sort messages by dates from newer to older
		function dateCompare($element1, $element2) { // Comparison function  
			$datetime1 = $element1[ 'timestamp' ]; // Timestamp has index 3
			$datetime2 = $element2[ 'timestamp' ]; 
			return $datetime2 - $datetime1;
		} 
		usort( $messageData, 'App\Controller\dateCompare' ); // Sort the array
		
		$unreadMessagesMaxNumber 	= 11;
		$unreadMessagesTotalNumber 	= count($messageData);
		
		$removeFrom 			= $unreadMessagesTotalNumber > $unreadMessagesMaxNumber ? $unreadMessagesMaxNumber : $unreadMessagesTotalNumber;
		$removeTo 				= $unreadMessagesTotalNumber;
		
		array_splice( $messageData, $removeFrom, $removeTo );

		$response->setData( $messageData );  
		$response->setStatusCode( 200, 'Unread messages' );

		return $response;
		
	}
	
}
