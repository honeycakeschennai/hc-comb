<?php
	
	require_once __DIR__ . '/../db/DBConnector.php';
	require_once __DIR__ . '/../db/DBWrapper.php';
	require_once __DIR__ . '/../utils/TableNameConstants.php';

	/**
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */
	class ItemDao extends DBConnector {

		private $db;

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
			//SELECT items_view.item_code, items_view.item_name, items_view.item_category, items_view.item_price, items_view.qty_slab, items_view.vendor_code, items_view.location_code, items_view.status FROM vendor_items_view items_view, locations loc WHERE loc.delivery_vendor=items_view.vendor_code AND loc.location_code='LN005'
			$query = 'SELECT items_view.item_code, items_view.item_name, items_view.item_category, items_view.item_price, items_view.qty_slab, items_view.vendor_code, items_view.location_code, items_view.status FROM ' . VENDOR_ITEMS_VIEW . ' items_view, ' . LOCATIONS . ' loc WHERE loc.delivery_vendor=items_view.vendor_code AND loc.location_code="' . $data['locationCode'] . '"';
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