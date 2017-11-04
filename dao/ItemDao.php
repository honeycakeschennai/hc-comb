<?php
	
	require_once __DIR__ . '/../db/DBConnector.php';
	require_once __DIR__ . '/../db/DBWrapper.php';
	require_once __DIR__ . '/../utils/TableNameConstants.php';
	require_once __DIR__ . '/../utils/TableColumnConstants.php';

	/**
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */
	class ItemDao extends DBConnector {

		private $db;
		private $tableName = ITEMS;

		function __construct(){
			parent::__construct();
			$this->log = Logger::getLogger(__CLASS__);
			$this->db = new DBWrapper($this->dbc);
		}

		/**
		 * getAllItems method is used to fetch all items.
		 * 
		 * @return $response;
		 */
		public function getItems($data){
			$this->log->info(__FUNCTION__ . SPACE . METHOD_STARTS);
			$query = 'SELECT * FROM ' . VENDOR_ITEMS . ' WHERE location_code="' . $data['locationCode'] . '"';
			$db = $this->db;
			$resultMap = $db->selectOperation($query);
			$this->closeConnection();		
			$result['rowCount'] = $resultMap['rowCount'];
			for($iterator = 0; $iterator < $resultMap['rowCount']; $iterator++){
				$result['resultData'][$iterator]['itemCode'] = $resultMap['result_data'][$iterator]['item_code'];
				$result['resultData'][$iterator]['status'] = $resultMap['result_data'][$iterator]['status'];
				$result['resultData'][$iterator]['itemName'] = $resultMap['result_data'][$iterator]['item_name'];
				$result['resultData'][$iterator]['itemCategory'] = $resultMap['result_data'][$iterator]['item_category'];
				$result['resultData'][$iterator]['itemPrice'] = $resultMap['result_data'][$iterator]['item_price'];
				$result['resultData'][$iterator]['qtySlab'] = $resultMap['result_data'][$iterator]['qty_slab'];
			}
			$this->log->info(__FUNCTION__ . SPACE . METHOD_ENDS);
			return $result;
		}
		
	}
	
?>