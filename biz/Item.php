<?php

	require_once 'Honey.php';
	require_once __DIR__ . '/../dao/ItemDao.php';

	/**
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */
	class Item extends Honey{

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
					$result = $this->getItems();
					break;
				default:
					break;
			}
			return $result;
		}

		/**
		 * getItems method is used to fetch all the items list by using DAO.
		 * 
		 * @return $response;
		 */
		private function getItems(){
			$this->log->info(H_LINE);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$itemDao = new ItemDao();
			$response = $itemDao->getItems($this->inputDataMap);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $response;
		}

	}

?>