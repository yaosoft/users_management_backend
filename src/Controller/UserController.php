<?php

namespace App\Controller;

use App\Entity\Project;
use App\Entity\User;
use App\Entity\ProjectStatus;
use App\Entity\ProjectUserStatus;
use App\Entity\ContactsList;
use App\Entity\Contact;
use App\Entity\Profile;
use App\Entity\Occupation;
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
use FOS\UserBundle\Model\UserManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;

use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Bundle\SecurityBundle\Security;

use Symfony\Bridge\Twig\Mime\BodyRenderer;
use Symfony\Component\Mailer\Transport;
use Symfony\Component\Mailer\Mailer;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Twig\Environment;
use Twig\Loader\FilesystemLoader;

class UserController extends AbstractController
{
	private $fos_manager;
	private $passwordHasher;
	
    // constructor
    public function __construct(UserManagerInterface $fos_manager, UserPasswordHasherInterface $passwordHasher)  {
        $this->fos_manager = $fos_manager;
		$this->passwordHasher = $passwordHasher;
    }

	// Registration API
	public function registration(Request $request)
	{
		$email 		= $request->getPayload()->get('email');
		$username 	= $email;
		$password 	= $request->getPayload()->get('password');

		$email_exist 	= $this->fos_manager->findUserByEmail($email);
		// $username_exist = $this->fos_manager->findUserByUsername($username);

		if( $email_exist != Null /* || $username_exist */ ){
			$response = new JsonResponse();
			$response->setData( "Username " . $username . " already created");
			$response->setStatusCode(201, "User already exists");
			return $response;
		}

		$user = $this->fos_manager->createUser();
		$user->setUsername($username);
		$user->setEmail($email);
		// $user->setLocked(false); 
		$user->setEnabled(true); 
		$user->setPlainPassword($password);
		$this->fos_manager->updateUser($user, true);

		$response = new JsonResponse();
		$response->setData( $user->getId() );
		$response->setStatusCode( 200, "User created" );
		return $response;
	}
	
	// Login API

	public function login(Request $request, Security $security)
	{
		
		$email 		= $request->getPayload()->get('email');
		$username 	= $email;
		$plaintextPassword 	= $request->getPayload()->get('password');
 
		$user 	= $this->fos_manager->findUserByEmail($email);
		// $username_exist = $this->fos_manager->findUserByUsername($username);
		$response = new JsonResponse();
		if( $user == Null /* || $username_exist */ ){
			$response->setData( "Username " . $username . " not existing");
			$response->setStatusCode(201, "User not exists");
			return $response;
		}
		
		// get the password error if any
		$isPasswordValid = $this->passwordHasher->isPasswordValid( $user, $plaintextPassword );
		if( $isPasswordValid === true ){
			// $security->login($user);
			$response->setData( $user->getId() );
			$response->setStatusCode( 200, "User is loged in" );
		}
		else{
			$response->setData( "Bad password" );
			$response->setStatusCode( 201, "Bad password" );
		}
		
		return $response;
	}
	
	public function logout(Request $request, Security $security)
	{
		
		$id 	= $request->getPayload()->get('email');
		$user 	= $this->fos_manager->findUserById( $id );
		$response = new JsonResponse();
		if( $user == Null /* || $username_exist */ ){
			$response->setData( "Username " . $username . " not existing");
			$response->setStatusCode(201, "User not exists");
			return $response;
		}
		
		$response->setData( "Username " . $username . " loged out");
		$response->setStatusCode(200, "User loged out");
		$security->logout($user);
		
		return $response;
	}

	// Get existing contacts
	public function getExistingContact(Request $request, EntityManagerInterface $entityManager )
	{

		$statusId = 4; //project viewed

		$projectStatus 	= $entityManager
		->getRepository( ProjectStatus::class )
		->findOneById( $statusId );

		$projectUserStatus = $entityManager
		->getRepository( ProjectUserStatus::class )	
		->findBy( 
			Array(
				'projectStatus' => $projectStatus 
			) 
		);

		$userList = Array();
		$emailList =  Array();
		foreach( $projectUserStatus as $project ){
			$user 		= $project->getUser();
			$name 		= $user->getUsername();
			$email 		= $user->getEmail();
			if( !in_array( $email, $emailList ) ){
				$emailList[] 	= $email;
				$userList[] = [ 'name' => $name, 'email' => $email ];
			}
		}

		$response = new JsonResponse();
		$response->setData( $userList );
		$response->setStatusCode( 200, "Durations found" );

		return $response;
	
	}

	// Create / edit contacts List
	public function contactsListEdit(Request $request, EntityManagerInterface $entityManager )
	{
		$response = new JsonResponse();

		$title 			= $request->getPayload()->get( 'title' );
		$description 	= $request->getPayload()->get( 'description' );
		$userId			= $request->getPayload()->get( 'userId' );

		$contactsListId = $request->getPayload()->get( 'contactsListId' );

		$user = $entityManager
            ->getRepository(User::class)->findOneById( $userId );

		$contactsList 	= '';
		if( !$contactsListId )
			$contactsList 	= new ContactsList;
		else
			$contactsList 	= $entityManager
            ->getRepository(ContactsList::class)->findOneById( $contactsListId );

		$contactsList->setTitle( $title );
		$contactsList->setDescription( $description );
		$contactsList->setUser( $user );

		$check = $entityManager
            ->getRepository(ContactsList::class)->findByTitle( $title );

		if( !$contactsListId && count( $check ) ){
			$response->setData( false );
			$response->setStatusCode( 210, "This contact list already exist" );
			return $response;
		}

		$entityManager->persist( $contactsList ); 
		$entityManager->flush();

		$response->setData( $contactsList );
		$response->setStatusCode( 200, "Contact list saved" );

		return $response;
	}

	// Get all contacts Lists for a user
	public function contactsListsGet(Request $request, EntityManagerInterface $entityManager )
	{
		$response = new JsonResponse();

		$userId = $request->get('userId');
		$user = $entityManager
        ->getRepository(User::class)
		->findById( $userId );

		$contactsLists = $entityManager
        ->getRepository(ContactsList::class)
		->findBy( Array( 'user' => $user ) );

		$response->setData( $contactsLists );
		$response->setStatusCode( 200, "Contacts list saved" );

		return $response;
	}


	// Get a contacts List
	public function contactsListGet(Request $request, EntityManagerInterface $entityManager )
	{
		$response = new JsonResponse();
		$contactsListId = $request->get('contactsListId');

		$contactsList = $entityManager
        ->getRepository( ContactsList::class )
		->findOneById( $contactsListId );

		if( $contactsList == null ){
			$response->setData( false );
			$response->setStatusCode( 200, "No contacts list found" );

			return $response;
		}

		$response->setData( $contactsList );
		$response->setStatusCode( 200, "Contacts list found" );

		return $response;
	}
	
	// save contacts
	public function contactsSave(Request $request, EntityManagerInterface $entityManager )
	{
		$response = new JsonResponse();
		
		$contacts =  $request->getPayload()->all();
		// $contacts =  $request->getPayload()->get( 'title' );
		// $name 	=  $request->getPayload()->get( 'name' );
		// $name 	=  $request->getPayload()->get( 'email' );
		// $id		=  $request->getPayload()->get( 'id' );

		foreach( $contacts as $data ){

			$name 			= $data[ 'name' ];
			$email 			= $data[ 'email' ];
			$contactId 		= isset( $data[ 'id' ] ) ? $data[ 'id' ] : '' ;
			$contactsListId = $data[ 'contactsListId' ];
			
			$type = $contactId ? 'modif' : 'new';
			$contact = '';
			if( $type == 'modif' ){
				$contact = $entityManager
				->getRepository( Contact::class )
				->findOneById( $contactId );
			}
			else{
				$contact = new Contact;
			}

			$contactsList = $entityManager
			->getRepository( ContactsList::class )
			->findOneById( $contactsListId );
			
			$contact->setName( $name );
			$contact->setEmail( $email );
			$contact->setDescription( '' );
			$contact->setContactsList( $contactsList );
			
			$entityManager->persist( $contact ); 
			$entityManager->flush();
		}

		// Delete inexisting ( deleted )
		$allContacts = $entityManager
			->getRepository( Contact::class )
			->findAll();

		foreach( $allContacts as $contact ){
			$found = false;
			$contactId = $contact->id;

			$type = $contactId ? 'modif' : 'new';

			foreach( $contacts as $data ){
				if( isset( $data[ 'id' ] ) && $contactId == $data[ 'id' ] ) 
					$found = true;
				if( !isset( $data[ 'id' ] ) )
					$found = true;
			}
			
			if( $found === false ){	// delete the contact		
				// $contact->removeContactsList( $contact->$contactsList)
				// $contactsList =  $contact->getContactsList();

// echo 'contact ' . $contact->getId();

				// $contactsList->removeContactsListContact( $contact );
				// $entityManager->remove( $contactsList ); 
				// $entityManager->flush();
				
				$entityManager->remove( $contact );
				$entityManager->flush();
			}
		}

		$response->setData( true );
		$response->setStatusCode( 200, "Contacts saved" );

		return $response;

	}
	
	// get contacts list contact
	public function contactsGet( Request $request, EntityManagerInterface $entityManager ) {
		
		$response = new JsonResponse();
		
		$contactsListId = $request->get('contactsListId');

		$contactsList = $entityManager
        ->getRepository( ContactsList::class )
		->findOneById( $contactsListId );

		$contacts = $entityManager
			->getRepository( Contact::class )
			->findByContactsList( $contactsListId );

		$response->setData( $contacts );
		$response->setStatusCode( 200, "Contacts" );

		return $response;
	}

	// get a user profile
	public function profileGet( Request $request, EntityManagerInterface $entityManager ) {
		
		$response = new JsonResponse();

		$userId = $request->get('userId');

		$user = $entityManager
        ->getRepository(User::class)
		->findById( $userId );

		$profile = $entityManager
        ->getRepository( Profile::class )
		->findOneByUser( $user );

		$response->setData( $profile );
		$response->setStatusCode( 200, "Profile" );

		return $response;

	}

	// save a user's profile
	public function profileSave( FileUploader $fileUploader, Request $request, EntityManagerInterface $entityManager ) {
		
		$response = new JsonResponse();

		$userId 		=  $request->getPayload()->get( 'userId' );
		$fullname 		=  $request->getPayload()->get( 'fullname' );
		$email 			=  $request->getPayload()->get( 'email' );
		$biography 		=  $request->getPayload()->get( 'biography' );
		$country 		=  $request->getPayload()->get( 'country' );
		$state 			=  $request->getPayload()->get( 'state' );
		$city 			=  $request->getPayload()->get( 'city' );
		$phone 			=  $request->getPayload()->get( 'phone' );
		$occupationId	=  $request->getPayload()->get( 'occupation' );
		
		$user = $entityManager
        ->getRepository(User::class)
		->findOneById( $userId );
		
		$profile = $entityManager
        ->getRepository( Profile::class )
		->findOneByUser( $user );
		
		$occupation = null;
		if( $occupationId )
			$occupation = $entityManager
			->getRepository( Occupation::class )
			->findOneById( $occupationId );
		
		if( $profile == null )
			$profile = new Profile;
		
		// update User
		if( $email != $user->getEmail() ){ 	// email has been changed
			$check = $entityManager
			->getRepository(User::class)
			->findOneByEmail( $email );
			
			if( $check == null){			// check if email exixt in the system
				$user->setEmail( $email );
				$user->setUsername( $email );
				$entityManager->persist( $user ); 
				$entityManager->flush();				
			}
		}

		// update Profile
		$profile->setFullname( $fullname );
		$profile->setBiography( $biography );
		$profile->setPhone( $phone );
		$profile->setCountry( $country );
		$profile->setCity( $city );
		$profile->setState( $state );
		$profile->setOccupation( $occupation );
		$profile->setUser( $user );
		// save profile's file
		$uploadeds  	= $request->files->get('files') != null ? $request->files->get('files') : [];
		$path = '';
		$size = '';
		$fileDirectory = 'uploads/files/profile';	//
		foreach( $uploadeds as $k => $v ){
			$extension 	= $v->getClientOriginalExtension();
			$fileName 	= $v->getClientOriginalName();
			$size 		= $v->getSize();
			// Move the file
			$path  		= $fileUploader->upload( $v, $fileDirectory ); // Important: call this after $uploaded->getSize()
		}
		$profile->setPicture( $path );
		$profile->setPictureSize( $size );
		$entityManager->persist( $profile ); 
		$entityManager->flush();
		
		$response->setData( $email );
		$response->setStatusCode( 200, "Profile saved" );

		return $response;
	}	
	
	// save a user's profile
	public function passwordSave( Request $request, EntityManagerInterface $entityManager ) {

		$response 	= new JsonResponse();

		$currentPassword 	= $request->getPayload()->get( 'currentPassword' );
		$newPassword 		= $request->getPayload()->get( 'newPassword' );
		$userId 			= $request->getPayload()->get( 'userId' );

		$user = $entityManager
        ->getRepository(User::class)
		->findOneById( $userId );
		
		// get the password error if any
		$isPasswordValid = $this->passwordHasher->isPasswordValid( $user, $currentPassword );
		if( $isPasswordValid === true ){
			
			$user->setPlainPassword($newPassword);
			$this->fos_manager->updateUser($user, true);
			
			$response->setData( $user->getId() );
			$response->setStatusCode( 200, "User password updates" );
		}
		else{
			$response->setData( "Bad password" );
			$response->setStatusCode( 201, "Bad password" );
		}
		
		return $response;
	}
	
	// get the user password
	public function passwordGet( Request $request, EntityManagerInterface $entityManager ) {

		$response = new JsonResponse();
		$userId = $request->get('userId');
		$user = $entityManager
        ->getRepository(User::class)
		->findOneById( $userId );

		$password = $user->getPassword();

		$response->setData( $password );
		$response->setStatusCode( 200, "Password saved" );

		return $response;
	}
	
	// Password Forgot Code
	public function passwordForgot ( Request $request, EntityManagerInterface $entityManager ) {

		$response = new JsonResponse();
		
		$email =   $request->get('email');
		$code  =   $request->get('code');

		// check email
		$user = $entityManager
			->getRepository(User::class)
			->findOneByEmail( $email );
			
		if( $user == null){
			$response->setData( false );
			$response->setStatusCode( 200, "Email not found" );

			// return response;	
		}
		
		
		// $digits = 5;

		// send reset code
		$smtp_email 	= 'info@diamta.com';
		$smtp_pass		= 'liBesStraum030';
		$server 		= 'mail.diamta.com';
		$port			= '587';
		// Generate connection configuration
		$dsn = "smtp://" . $smtp_email . ":" . $smtp_pass . "@" . $server . ":" . $port;
		$transport = Transport::fromDsn($dsn);
		$customMailer = new Mailer($transport);

		// Generates the email
		$email_content = ( new TemplatedEmail() )
			->from( new Address( 'jane@workinvitation.com' ) )
			->to( $email )
			->subject( 'Your password\'s reset code' )
			->htmlTemplate( 'emails/ressetPasswordEmail.html.twig',)
			->context( array (
				'code' 	=> $code,
			));


		// IMPORTANT: as you are using a customized mailer instance, you have to make the following
		// configuration as indicated in https://github.com/symfony/symfony/issues/35990.
		$loader = new FilesystemLoader('../templates/');
		$twigEnv = new Environment($loader);
		$twigBodyRenderer = new BodyRenderer($twigEnv);
		$twigBodyRenderer->render($email_content);

		// Sends the email
		$customMailer->send($email_content);

		$response->setData( $user->getId() );
		$response->setStatusCode( 200, "Code sent" );

		return $response;
	}
	
	// Password replace
	public function passwordUpdate ( Request $request, EntityManagerInterface $entityManager ) {
		
		$response = new JsonResponse();

		$userId 	=   $request->get('userId');
		$password  	=   $request->get('password');
		
		$user = $entityManager
			->getRepository(User::class)
			->findOneById( $userId );
		
		$user->setPlainPassword($password);
		$this->fos_manager->updateUser($user, true);


		$response->setData( $user->getId() );
		$response->setStatusCode( 200, "Pasword updated" );

		return $response;
	
	}

	// User's password check
	public function passwordChecker ( Request $request, EntityManagerInterface $entityManager ) {

		$response = new JsonResponse();

		$userId 	=   $request->get('userId');
		$password  	=   $request->get('password');
		
		$user = $entityManager
			->getRepository(User::class)
			->findOneById( $userId );
		
		$isPasswordValid = $this->passwordHasher->isPasswordValid( $user, $password );
		if( $isPasswordValid === true ){
			// $security->login($user);
			$response->setData( $user->getId() );
			$response->setStatusCode( 200, "Password is valid" );
		}
		else{
			$response->setData( "Bad password" );
			$response->setStatusCode( 201, "Bad password" );
		}

		return $response;
	
	}

	// list all occupations
	public function profileOccupationsGet ( Request $request, EntityManagerInterface $entityManager ) {

		$response = new JsonResponse();
		
		$occupations = $entityManager
			->getRepository(Occupation::class)
			->findAll();
		
		$response->setData( $occupations );
		$response->setStatusCode( 200, "Occupations found" );

		return $response;
	}
}