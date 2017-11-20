<?php
	
	require_once __DIR__ . '/../db/DBConnector.php';
	require_once __DIR__ . '/../db/DBWrapper.php';
	require_once __DIR__ . '/../utils/TableNameConstants.php';

	/**
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */
	class OrderDao extends DBConnector {

		private $db;
		private $tableName = ORDERS;

		function __construct(){
			parent::__construct();
			$this->log = Logger::getLogger(__CLASS__);
			$this->db = new DBWrapper($this->dbc);
		}

		/**
		 * createOrder method is used to create order based on the user ID, and Vendor code.
		 * 
		 * @return $response
		 */
		public function createOrder($inputDataMap){
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$dbDataMap = array();
			$dbDataMap['user_id'] = $inputDataMap['userId'];
			$dbDataMap['vendor_code'] = $inputDataMap['vendorCode'];
			$dbDataMap['deliver_to'] = $inputDataMap['addressText'];
			$dbDataMap['total_amount'] = $inputDataMap['totalAmount'];
			$dbDataMap['order_message'] = $inputDataMap['messageText'];
			// $dbDataMap['delivery_date'] = $inputDataMap['deliveryDate'];
			// $dbDataMap['delivery_time'] = $inputDataMap['deliveryTime'];
			$dbDataMap['status'] = ORDER_PLACED;
			$db = $this->db;
			$resultMap = $db->insertOperation($this->tableName, $dbDataMap);
			$this->closeConnection();
			$result['status'] = $resultMap['status'];
			if($resultMap['status'] == SUCCESS){
				$result['orderNumber'] = $resultMap['last_insert_id'];
				$result['affectedRows'] = $resultMap['affected_rows'];
			} else {
				$result['errorDetails'] = $resultMap['error_details'];
				$result['affectedRows'] = $resultMap['affected_rows'];
			}
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $result;
		}

		public function saveOrderItems($orderNumber, $orderItems){
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$db = $this->db;
			foreach ($orderItems as $item){
				$dbDataMap = array();
				$dbDataMap['order_id'] = $orderNumber;
				$dbDataMap['item_code'] = $item['itemCode'];
				$dbDataMap['qty'] = $item['qty'];
				$dbDataMap['price'] = $item['price'];
				$db->insertOperation(ORDER_ITEMS, $dbDataMap);
			}
			$this->closeConnection();
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
		}

		/**
		 * getVendorCode method is used to get vendor code based on the given location code.
		 * 
		 * @param locationCode
		 * @return $vendorCode
		 */
		public function getVendorCode($locationCode){
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$db = $this->db;
			$query = 'SELECT delivery_vendor FROM ' . LOCATIONS . ' WHERE location_code="' . $locationCode . '"';
			$resultMap = $db->selectOperation($query);
			$this->closeConnection();
			$vendorCode = $resultMap['result_data'][0]['delivery_vendor'];
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $vendorCode;
		}
		
	}
	
?>