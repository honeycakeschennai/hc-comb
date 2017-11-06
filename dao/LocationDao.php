<?php
	
	require_once __DIR__ . '/../db/DBConnector.php';
	require_once __DIR__ . '/../db/DBWrapper.php';
	require_once __DIR__ . '/../utils/TableNameConstants.php';

	/**
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */
	class LocationDao extends DBConnector {

		private $db;
		private $tableName = LOCATIONS;

		function __construct(){
			parent::__construct();
			$this->log = Logger::getLogger(__CLASS__);
			$this->db = new DBWrapper($this->dbc);
		}

		/**
		 * getLocationsList method is used to fetch all the locations.
		 * 
		 * @return $response;
		 */
		public function getLocationsList(){
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			//SELECT * FROM locations
			$query = "SELECT * FROM $this->tableName";
			$db = $this->db;
			$resultMap = $db->selectOperation($query);
			$this->closeConnection();		
			$result['rowCount'] = $resultMap['rowCount'];
			for($iterator = 0; $iterator < $resultMap['rowCount']; $iterator++){
				$result['resultData'][$iterator]['locationCode'] = $resultMap['result_data'][$iterator]['location_code'];
				$result['resultData'][$iterator]['locationName'] = $resultMap['result_data'][$iterator]['location_name'];
			}
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $result;
		}
		
	}
	
?>