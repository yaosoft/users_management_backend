<?php

	error_reporting(E_ALL);
	ini_set('display_errors', 1);
	ini_set("SMTP", "mail.diamta.com");
	ini_set('smtp_port', 587);
	ini_set("sendmail_from", "jane@workinvitation.com");
	ini_set("auth_username", "jane@workinvitation.com");
	ini_set("auth_password", "liBesStraum030");


	$dbhost 	= 'localhost';
	
	// $dbname 	= 'diamta_projects'; 	// 'projects_db';
	// $dbusername = 'diamta_admin'; 	// 'diamtaprojects';
	// $dbpassword = '%!vjkYviaDuQ'; 	// '!aA111111';

	$dbname 	= 'projects_db'; 	// 'projects_db';
	$dbusername = 'diamtaprojects'; // 'diamtaprojects';
	$dbpassword = '!aA111111'; 		// '!aA111111';

	// Get invitations to send
	$table01 	= 'invitation';
	$table02	= 'project';
	$table03	= 'users';
	$table04	= 'project_user_status';
	$status		= 1;	// invitation registered
	$todayTimestamp = strtotime( date("Y-m-d H:i:s") );
	$todayDay 		= \date( 'Y-m-d H:i:s', $todayTimestamp);
	
	$project_user_id = '';

	$conn = new PDO( "mysql:host=$dbhost;dbname=$dbname", $dbusername, $dbpassword );
	$conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	
	try {	// Get All not sent

		$query = "SELECT id, receiver_email, receiver_name, attempts, project_id 
		FROM $table01 WHERE status = :status AND date_sending <= :now";
		$stmt = $conn->prepare( $query );
		$stmt->execute( array( 
			'status' 	=> $status, 
			'now' 		=> $todayDay
		));

		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$result01 = $stmt->fetchAll();
				
		$ln01 = count( $result01 );
echo 'ln01 --- ' . $ln01;

		// 
		if( !count( $result01 ) )
			goto break_free_of_try01; // goto is ok ;)
		
		$project_id 	= $result01[ $ln01 -1 ][ 'project_id' ];


		// get the project details
		$query02 = "SELECT title, date_created, description, budget, user_id 
		FROM $table02 WHERE id = :project_id";
		$stmt = $conn->prepare( $query02 );
		$stmt->execute( array( 
			'project_id' 	=> $project_id
		));

		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$result02 = $stmt->fetchAll();

		if( !count( $result02 ) )
			goto break_free_of_try01; // goto is ok ;)

		// send the project and update the project database
		$ln02 = count( $result02 );
		
		$project_title	= $result02[ $ln02 -1 ][ 'title' ];
		$project_date	= $result02[ $ln02 -1 ][ 'date_created' ];
		$project_description	= $result02[ $ln02 -1 ][ 'description' ];
		$project_budget 		= $result02[ $ln02 -1 ][ 'budget' ]; 
		$project_user_id		= $result02[ $ln02 -1 ][ 'user_id' ];


		foreach( $result01 as $res ){
			$invitation_id 	= $res[ 'id' ];
			$receiver_name 	= $res[ 'receiver_name' ];
			$receiver_email	= $res[ 'receiver_email' ];
			$attempts 		= $res[ 'attempts' ];

			// check if email exist
			$emailExist = isEmailExist( $receiver_email, $dbhost, $dbname, $dbusername, $dbpassword );

			// send email
			sendMail( $receiver_email, $receiver_name, $project_title, $project_id, $project_date, $project_budget, $project_description, $emailExist );

			// update guest invitation
			updateInvitation( $table01, $invitation_id, $attempts, $dbhost, $dbname, $dbusername, $dbpassword );
			
			// update guest status
			updateStatus( $table04, $receiver_email, $project_id, $dbhost, $dbname, $dbusername, $dbpassword );
		}
		// $conn = null;

	}
	catch( PDOException $e ) {
		echo "Error: " . $e->getMessage();
	}

	break_free_of_try01:

	// send mail to the worker
	function sendMail( $email, $user_name, $project_title, $project_id, $project_date, $project_budget, $project_description, $emailExist ){
		$link 		= "https://diamta.com/projects/public/index.php/project/view/?projectId=" .  $project_id . "&projectStatus=4&userId=" . $emailExist;
		
		$subject 	= "You have received an invitation for work!";

		$text01			= "Hello";
		$project_link 	= $emailExist ? $link : "https://diamta.com/projects/public/index.php/registration/?email=" . $email . "&project_id=" . $project_id;
		
		$message 		= "<!DOCTYPE html><html><style>body {font-family: Arial, Helvetica, sans-serif;}</style><body><p><a href='https://www.diamta.com/?email=[email]&title=[title]' style='color:#ff5335;text-decoration:none;text-transform:none;' target='_blank'><img src='https://diamta.com/img/logo053.png' title='" . $subject . "' alt='Logo Diamta'> </a><br></p><h2>You have a new message</h2><p style='line-height: 30px;'>" . $text01 . ",<br> </p><p style='line-height: 30px; white-space: pre-wrap;'>\"\"</p><p>Please visite the link below to reply. <br><br><a href ='" . $project_link . "'>" . $project_title . "</a></p><p><br>The team</p></body></html>"; // html body';
		
		$headers  = "From: projects@diamta.com\r\n";
		$headers .= "MIME-Version: 1.0\r\n";
		$headers .= "Content-Type: text/html; charset=UTF-8\r\n";
		
		$responce = mail( $email, $subject, $message, $headers ); //  mail( to,subject,message,headers,parameters );
		 echo $message;
	}

	// send mail to project owner
	// get the owner details
	$query03 	= "SELECT username, email FROM $table03 WHERE id = :project_user_id";
	$stmt 		= $conn->prepare( $query03 );
	$stmt->execute( array( 
		'project_user_id' 	=> $project_user_id
	));

	$stmt->setFetchMode(PDO::FETCH_ASSOC);
	$result03 = $stmt->fetchAll();
	$ln03 = count( $result03 );

	function sendMail02( $email, $user_name, $project_id, $project_date, $project_budget, $project_description ){
		$project_link 	= 'https://diamta.com/projects/public/index.php/project/sent/' . $project_id;
		$subject 		= 'Your invitation have been send for work!';

		$text01			= 'Hello';

		$message 		= "<!DOCTYPE html><html><style>body {font-family: Arial, Helvetica, sans-serif;}</style><body><p><a href='https://www.diamta.com/?email=[email]&title=[title]' style='color:#ff5335;text-decoration:none;text-transform:none;' target='_blank'><img src='https://diamta.com/img/logo053.png' title='" . $subject . "' alt='Logo Diamta'> </a><br></p><h2>Your invitation have been send for work!</h2><p style='line-height: 30px;'>" . $text01 . ",<br> </p><p style='line-height: 30px; white-space: pre-wrap;'>\"\"</p><p>Please visite the link below to reply. <br><br><a href ='" . $project_link . "'>" . $project_link . "</a></p><p><br>The team</p></body></html>"; // html body';
		
		$headers  = "From: projects@diamta.com\r\n";
		$headers .= "MIME-Version: 1.0\r\n";
		$headers .= "Content-Type: text/html; charset=UTF-8\r\n";
		
		//$responce = mail( $email, $subject, $message, $headers ); //  mail( to,subject,message,headers,parameters );
		 echo $message;
	}
	
	if( count( $result03 ) ){
		$email		= $result03[ $ln03 -1 ][ 'email' ];
		$user_name	= $result03[ $ln03 -1 ][ 'username' ];
		sendMail02( $email, $user_name, $project_id, $project_date, $project_budget, $project_description );
	}

	// update status in invitation table all table after alert sent to not send repetively
	function updateInvitation( $table, $invitation_id, $attempts, $dbhost, $dbname, $dbusername, $dbpassword  ){
		$status 	= 4;		// invitation sent
		$attempts  += 1;
		// 
		try {
			$conn = new PDO( "mysql:host=$dbhost;dbname=$dbname", $dbusername, $dbpassword );
			$query = "UPDATE $table SET status = :status, attempts = :attempts 
			WHERE id = :invitation_id";
			$stmt  = $conn->prepare( $query );
			$stmt->execute( array( 
				'status' 		=> $status,
				'attempts'		=> $attempts,
				'invitation_id'	=> $invitation_id
			));
		} 
		catch( PDOException $e ) {
			echo "Error: " . $e->getMessage();
		}
		$conn = null;
	}
	
	// update status in user status table all table after alert sent to not send repetively
	function updateStatus( $table, $email, $project_id, $dbhost, $dbname, $dbusername, $dbpassword ){ 
		$status 	= 4;		// invitation sent
		//
		try {
			$conn = new PDO( "mysql:host=$dbhost;dbname=$dbname", $dbusername, $dbpassword );
			$query = "UPDATE $table SET status_id = :status 
			WHERE email = :email AND project_id = :project_id";
			$stmt  = $conn->prepare( $query );
			$stmt->execute( array( 
				'project_id' 	=> $project_id,
				'email'			=> $email,
				'status'		=> $status,
			));
		} 
		catch( PDOException $e ) {
			echo "Error: " . $e->getMessage();
		}
		$conn = null;
	}
	
	// return userId if email exist
	function isEmailExist( $receiver_email, $dbhost, $dbname, $dbusername, $dbpassword ){ 
		$conn = new PDO( "mysql:host=$dbhost;dbname=$dbname", $dbusername, $dbpassword );
		$conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
		$table	= 'users'; //
		try {	// Get All not sent

			$query = "SELECT id 
			FROM $table WHERE email = :email";
			$stmt = $conn->prepare( $query );
			$stmt->execute( array( 
				'email' 	=> $receiver_email, 
			));

			$stmt->setFetchMode(PDO::FETCH_ASSOC);
			$result = $stmt->fetchAll();
			
			$ln = count( $result );
			
			return $ln > 0 ?  $result[0]['id'] : false;
		}
		catch( PDOException $e ) {
			echo "Error: " . $e->getMessage();
		}
	}
?>