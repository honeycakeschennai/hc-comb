<?php

	require_once 'Honey.php';
	require_once __DIR__ . '/../dao/UserDao.php';
	require_once __DIR__ . '/../utils/Constants.php';
	require_once __DIR__ . '/../notifications/NotificationService.php';

	/**
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */
	class User extends Honey{

		private $caseId;
		private $method;
		private $inputDataMap;

		/**
		 * @param $caseId
		 * @param $method
		 * @param $inputDataMap
		 */
		function __construct($caseId, $method, $inputDataMap){
			parent::__construct();
			$this->log = Logger::getLogger(__CLASS__);
			$this->caseId = $caseId;
			$this->method = $method;
			$this->inputDataMap = $inputDataMap;
		}

		/**
		 * @override
		 * 
		 * exexuteAction method is used to get the execute the requested action based on the 
		 * HTTP method.
		 */
		public function executeAction(){
			$result = array();
			switch($this->method){
				case 'GET':
					$result = $this->getUser();
					break;
				case 'POST':
					$result = $this->createUser();
					break;
				case 'PUT':
					$result = $this->updateUser();
					break;
				default:
					break;
			}
			return $result;
		}

		/**
		 * getUser method is used to fetch the user based on the user ID by using DAO.
		 * 
		 * @return $response
		 */
		private function getUser(){
			$this->log->info(H_LINE);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$userDao = new UserDao();
			$response = $userDao->getUser($this->caseId);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $response;
		}

		/**
		 * createUser method is used to create a new user by using DAO.
		 * It calls generateOtp method for generating OTP.
		 * 
		 * @return $response
		 */
		private function createUser(){
			$this->log->info(H_LINE);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$userDao = new UserDao();
			$response = $userDao->createUser($this->inputDataMap);
			if($response['status'] == SUCCESS){
				$dataMap = $this->inputDataMap;
				$password = $dataMap['password'];
				$this->generateHashedPassword($response['userId'], $password);
				$this->generateOtp($response['userId'], EMAIL);
				$this->generateOtp($response['userId'], MOBILE);
			}
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $response;
		}

		/**
		 * hashPassword method is used to encrypt the user entered password.
		 * 
		 * @param userId
		 * @param password
		 */
		private function generateHashedPassword($userId, $password){
			$options = [
			    'cost' => 10,
			];
			$hashedPassword = password_hash($password, PASSWORD_BCRYPT, $options);
			$userDao = new UserDao();
			$userDao->savePassword($userId, $hashedPassword);
		}

		/**
		 * generateOtp method is used to generate a 6 digit OTP.
		 * It send the OTP to user also saves the OTP in DB for verfication.
		 * 
		 * @param userId
		 * @param otpFor
		 * @param deliveryTo
		 */
		private function generateOtp($userId, $otpFor){
			$otpValue = mt_rand(100000, 999999);
			$messageContent = 'Your OTP for Honeycakes signup is ' . $otpValue . '. Please do not share this with anyone.';
			$userDao = new UserDao();
			$userDao->saveOtp($userId, $otpFor, $otpValue);
			$userContactDetails = $this->getUserContactDetails($userId);
			// file_put_contents('testlog.log', print_r($userContactDetails, true));
			$mobile = $userContactDetails['resultData'][0]['mobile'];
			$email = $userContactDetails['resultData'][0]['email'];
			$notification = new NotificationService();
			if($otpFor == MOBILE){
				$notification->sendSms($userId, MSG_TYPE_OTP, $mobile, $messageContent);
			} else if($otpFor == EMAIL){
				$notification->sendEmail($userId, MSG_TYPE_OTP, $email, $messageContent);
			}
		}

		/**
		 * getUserContactDetails method is used to fetch user contact details - mobile & email.
		 * 
		 * @param userId
		 */
		private function getUserContactDetails($userId){
			$userDao = new UserDao();
			$contactDetails = $userDao->getUserContactDetails($userId);
			return $contactDetails;
		}

		/**
		 * verifyOtp method is used to verify the user entered OTP with that of the one 
		 * available in the DB.
		 * 
		 * @return response
		 */
		public function verifyOtp(){
			$this->log->info(H_LINE);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$dataMap = $this->inputDataMap;
			$userId = $dataMap['userId'];
			$userOtp = $dataMap['userOtp'];
			$otpFor = $dataMap['otpFor'];
			$userDao = new UserDao();
			$otpResponse = $userDao->getOtp($userId, $otpFor);
			$otp = $otpResponse['resultData'][0]['otp'];
			if($userOtp == $otp){
 				$this->updateStatusVerified($userId, $otpFor);
 				$response['status'] = SUCCESS;
 				if($otpFor == 'mobile'){
 					$response['message'] = MBL_OTP_SUCCESS;
 				} else {
 					$response['message'] = EML_OTP_SUCCESS;
 				}
			} else {
				$response['status'] = FAILURE;
				if($otpFor == 'mobile'){
 					$response['message'] = MBL_OTP_FAILURE;
 				} else {
 					$response['message'] = EML_OTP_FAILURE;
 				}
			}
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $response;
		}

		/**
		 * updateUserMobileStatusVerified method is used to update verfication status.
		 * 
		 * @param userId
		 * @param for
		 */
		private function updateStatusVerified($userId, $for){
			$this->log->info(H_LINE);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$userDao = new UserDao();
			$userDao->updateStatusVerified($userId, $for);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
		}

		/**
		 * updateUser method is used to update a user based on the user ID by using DAO.
		 * 
		 * @return $response;
		 */
		private function updateUser(){
			$this->log->info(H_LINE);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$userDao = new UserDao();
			$response = $userDao->updateUser($this->inputDataMap, $this->caseId);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $response;
		}

	}

?>