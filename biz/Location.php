<?php

	require_once 'Honey.php';
	require_once __DIR__ . '/../dao/LocationDao.php';

	/**
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */
	class Location extends Honey{

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
					$result = $this->getLocationsList();
					break;
				default:
					break;
			}
			return $result;
		}

		/**
		 * getLocationsList method is used to fetch all the cakes list by using DAO.
		 * 
		 * @return $response;
		 */
		private function getLocationsList(){
			$this->log->info(H_LINE);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$locationDao = new LocationDao();
			$response = $locationDao->getLocationsList();
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $response;
		}

	}

?>