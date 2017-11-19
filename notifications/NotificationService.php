<?php
	
	require_once __DIR__ . '/../db/DBConnector.php';
	require_once __DIR__ . '/../db/DBWrapper.php';
	require_once __DIR__ . '/../config/NotificationConfig.php';
	require_once __DIR__ . '/../utils/TableNameConstants.php';

	/**
	 * NotificationService class is responsible for generating notifications - SMS, EMail & Push 
	 * Notifications.
	 * 
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */
	class NotificationService extends DBConnector {

		private $db;

		function __construct(){
			parent::__construct();
			$this->db = new DBWrapper($this->dbc);
		}

		/**
		 * sendSms method sends SMS using external SMS API.
		 * 
		 * @param userId
		 * @param messageType
		 * @param mobileNumber
		 * @param messageContent
		 */
		function sendSms($userId, $messageType, $mobileNumber, $messageContent){
			//sms sending part
			$this->saveNotificationDataToDb($userId, $messageType, $mobileNumber, $messageContent);
		}

		/**
		 * sendSms method sends Email using PHP Mailer.
		 * 
		 * @param userId
		 * @param messageType
		 * @param mobileNumber
		 * @param messageContent
		 */
		function sendEmail($userId, $messageType, $email, $messageContent){
			//php mailer part
			$this->saveNotificationDataToDb($userId, $messageType, $email, $messageContent);
		}

		/**
		 * saveNotificationDataToDb method saves the notification data to DB.
		 * 
		 * @param userId
		 * @param messageType
		 * @param mobileNumber
		 * @param messageContent
		 */
		function saveNotificationDataToDb($userId, $messageType, $deliveryTo, $messageContent){
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$dbDataMap = array();
			$dbDataMap['user_id'] = $userId;
			$dbDataMap['message_type'] = $messageType;
			$dbDataMap['delivery_to'] = $deliveryTo;
			$dbDataMap['message_content'] = $messageContent;
			$db = $this->db;
			$resultMap = $db->insertOperation(NOTIFICATIONS, $dbDataMap);
			$this->log->debug(QUERY_RESULT . NEW_LINE . print_r($resultMap, true));	
			$this->closeConnection();
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
		}

	}

?>