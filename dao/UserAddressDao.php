<?php
	
	require_once __DIR__ . '/../db/DBConnector.php';
	require_once __DIR__ . '/../db/DBWrapper.php';
	require_once __DIR__ . '/../utils/TableNameConstants.php';
	require_once __DIR__ . '/../auth/Token.php';

	/**
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */
	class UserAddressDao extends DBConnector {

		private $db;

		function __construct(){
			parent::__construct();
			$this->log = Logger::getLogger(__CLASS__);
			$this->db = new DBWrapper($this->dbc);
		}

		/**
		 * getAddress method is used to fetch adress of a particular user.
		 * 
		 * @return $response;
		 */
		public function getAddress($token){
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$tokenObj = new Token();
			$userId = $tokenObj->getUserId($token['token']);
			//SELECT * FROM user_address WHERE user_id='1'
			$query = 'SELECT * FROM ' . USER_ADDRESS . ' WHERE user_id="' . $userId . '"';
			$db = $this->db;
			$resultMap = $db->selectOperation($query);
			$this->closeConnection();		
			$result['rowCount'] = $resultMap['rowCount'];
			for($iterator = 0; $iterator < $resultMap['rowCount']; $iterator++){
				$result['resultData'][$iterator]['home'] = $resultMap['result_data'][$iterator]['home'];
				$result['resultData'][$iterator]['office'] = $resultMap['result_data'][$iterator]['office'];
				$result['resultData'][$iterator]['other'] = $resultMap['result_data'][$iterator]['other'];
			}
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $result;
		}
		
	}
	
?>