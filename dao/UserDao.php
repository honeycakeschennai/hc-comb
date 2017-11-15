<?php
	
	require_once __DIR__ . '/../db/DBConnector.php';
	require_once __DIR__ . '/../db/DBWrapper.php';
	require_once __DIR__ . '/../utils/TableNameConstants.php';

	/**
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */
	class UserDao extends DBConnector {

		private $db;
		private $tableName = USERS;

		function __construct(){
			parent::__construct();
			$this->log = Logger::getLogger(__CLASS__);
			$this->db = new DBWrapper($this->dbc);
		}

		/**
		 * getUser method is used to fetch the user based on the user ID.
		 * 
		 * @param userId
		 * @return $response
		 */
		public function getUser($userId){
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$query = "SELECT * FROM $this->tableName WHERE user_id='$userId'";
			$db = $this->db;
			$resultMap = $db->selectOperation($query);
			$this->closeConnection();
			$result['rowCount'] = $resultMap['rowCount'];
			for($iterator = 0; $iterator < $resultMap['rowCount']; $iterator++){
				$result['resultData'][$iterator]['firstName'] = $resultMap['result_data'][$iterator]['first_name'];
				$result['resultData'][$iterator]['lastName'] = $resultMap['result_data'][$iterator]['last_name'];
				$result['resultData'][$iterator]['email'] = $resultMap['result_data'][$iterator]['email'];
				$result['resultData'][$iterator]['mobile'] = $resultMap['result_data'][$iterator]['mobile'];
				$result['resultData'][$iterator]['dob'] = $resultMap['result_data'][$iterator]['date_of_birth'];
			}
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $result;
		}

		/**
		 * createUser method is used to create a new user.
		 * it saves the password, generates OTP for email and mobile 
		 * 
		 * @param inputDataMap
		 * @return $response
		 */
		public function createUser($inputDataMap){			
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$dbDataMap = array();
			$dbDataMap['first_name'] = $inputDataMap['firstName'];
			$dbDataMap['last_name'] = $inputDataMap['lastName'];
			$dbDataMap['email'] = $inputDataMap['email'];
			$dbDataMap['mobile'] = $inputDataMap['mobile'];
			$dbDataMap['date_of_birth'] = $inputDataMap['dob'];
			$db = $this->db;
			$resultMap = $db->insertOperation($this->tableName, $dbDataMap);
			$this->closeConnection();
			$result['status'] = $resultMap['status'];
			if($resultMap['status'] == SUCCESS){
				$result['userId'] = $resultMap['last_insert_id'];
				$result['affectedRows'] = $resultMap['affected_rows'];
				//$this->savePassword($result['userId'], $inputDataMap['password']);
			} else {
				$result['errorDetails'] = $resultMap['error_details'];
				$result['affectedRows'] = $resultMap['affected_rows'];
			}
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $result;
		}

		/**
		 * savePassword method is used to add userId and password to user_credentials table.
		 * It adds the password for the current user who is signing up.
		 * 
		 * @param userId
		 * @param password
		 */
		public function savePassword($userId, $password){
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$dbDataMap = array();
			$dbDataMap['user_id'] = $userId;
			$dbDataMap['password'] = $password;
			$db = $this->db;
			$resultMap = $db->noEscapeInsertOperation(USER_CREDENTIALS, $dbDataMap);
			$this->log->debug(QUERY_RESULT . NEW_LINE . print_r($resultMap, true));	
			$this->closeConnection();
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
		}

		/**
		 * saveOtp method is used to save OTP to otp table.
		 * 
		 * @param userId
		 * @param otpFor
		 * @param otpValue
		 */
		public function saveOtp($userId, $otpFor, $otpValue){
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$dbDataMap = array();
			$dbDataMap['user_id'] = $userId;
			$dbDataMap['otp_for'] = $otpFor;
			$dbDataMap['otp_value'] = $otpValue;
			$db = $this->db;
			$resultMap = $db->insertOperation(OTP, $dbDataMap);
			$this->log->debug(QUERY_RESULT . NEW_LINE . print_r($resultMap, true));	
			$this->closeConnection();
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
		}

		/**
		 * updateUser method is used to update a user based on the user ID.
		 * 
		 * @return $response
		 */
		public function updateUser($inputDataMap, $userId){
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$dbDataMap = array();
			$dbDataMap['first_name'] = $inputDataMap['firstName'];
			$dbDataMap['last_name'] = $inputDataMap['lastName'];
			$dbDataMap['email'] = $inputDataMap['email'];
			$dbDataMap['mobile'] = $inputDataMap['mobile'];
			$dbDataMap['date_of_birth'] = $inputDataMap['dob'];

			$conditionMap = array();
			$conditionMap['user_id'] = $userId;
			$db = $this->db;
			$resultMap = $db->updateOperation($this->tableName, $dbDataMap, $conditionMap);
			$this->closeConnection();
			$result['status'] = $resultMap['status'];
			$result['affectedRows'] = $resultMap['affected_rows'];
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $result;
		}
		
	}
	
?>