<?php

	require_once 'Honey.php';
	require_once __DIR__ . '/../dao/OrderDao.php';
	require_once __DIR__ . '/../utils/Constants.php';
	require_once __DIR__ . '/../notifications/NotificationService.php';

	/**
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */
	class Order extends Honey{

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
					//$result = $this->getUser();
					break;
				case 'POST':
					$result = $this->createOrder();
					break;
				default:
					break;
			}
			return $result;
		}

		/**
		 * createOrder method is used to create an order by using DAO.
		 * 
		 * @return $response
		 */
		private function createOrder(){
			$this->log->info(H_LINE);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$orderDao = new OrderDao();
			$dataMap = $this->inputDataMap;
			$dataMap['vendorCode'] = $this->getVendorCode($dataMap['locationSelect']);
			$response = $orderDao->createOrder($dataMap);
			if($response['status'] == SUCCESS){
				$dataMap = $this->inputDataMap;
				$orderItems = $dataMap['orderItems'];
				$this->saveOrderItems($response['orderNumber'], $orderItems);
			}
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $response;
		}

		/**
		 * saveOrderItems method is used to save order items using DAO.
		 * 
		 * @param orderNumber
		 * @param orderItems
		 */
		private function saveOrderItems($orderNumber, $orderItems){
			$this->log->info(H_LINE);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$orderDao = new OrderDao();
			$response = $orderDao->saveOrderItems($orderNumber, $orderItems);
			if($response['status'] == SUCCESS){

			}
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
		}


		/**
		 * getVendorCode method is used to get vendor code based on the location code.
		 * 
		 * @param locationCode
		 * @return vendorCode
		 */
		private function getVendorCode($locationCode){
			$this->log->info(H_LINE);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$orderDao = new OrderDao();
			$vendorCode = $orderDao->getVendorCode($locationCode);
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $vendorCode;
		}

	}

?>