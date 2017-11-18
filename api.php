<?php
	
	require_once 'auth/Authenticator.php';
	require_once 'auth/Token.php';
	require_once 'utils/Constants.php';
	require_once 'utils/CaseConstants.php';

	require_once 'biz/User.php';
	require_once 'biz/Location.php';
	require_once 'biz/Item.php';
	require_once 'biz/UserAddress.php';
	
	/**
	 * Honeycakes REST API - handles all HTTP requests and responses.
	 * 
	 * @author Ramu Ramasamy
	 * @version 1.0
	 */

	/** Default time zone set to India */
	date_default_timezone_set('Asia/Calcutta');

	/** Gets the method type */
	$method = $_SERVER['REQUEST_METHOD'];

	$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));

	/** Gets the JSON input from HTTP request and converts it to an associative array */
	$data = json_decode(file_get_contents('php://input'), true);

	/** 
	 * $case holds the ID value that is passed as the second param in the URL. Default value
	 * for $case is -1
	 */
	$case = $request[0];
	$caseId = -1;
	if(count($request) > 1){
		$caseId = $request[1];
	}

	/** token from URL */
	$token = '';

	if($case == CASE_LOGIN){
		$response = loginUser();
	} else {
		if(isset($_GET['token'])){
			$token = $_GET['token'];
		}
	}

	/** checks if the token is valid. If the token is valid then the case is executed */
	if( $token != '' && isTokenValid($token) ){
		/** determines the case and executes the corresponding method */
		switch ($case) {
			case CASE_VALIDATE_TOKEN:
			  	$response = validateToken();
			  	break;
		  	case CASE_USER: // this case is for user credential changes and fetch user informations after logingin
			  	$response = executeUserCase();
			  	break;
			case CASE_VERIFY_OTP: // this case is for user credential changes
			  	$response = verifyUserOtp();
			  	break;
		  	case CASE_CAKES:
			  	$response = executeCakeCase();
			  	break;
			case CASE_LOCATION:
				$response = executeLocationCase();
				break;
			case CASE_ITEMS:
				$response = executeItemCase();
				break;
			case CASE_ADDRESS:
				$response = executeAddressCase();
				break;
		}
	} else if($case == CASE_USER){
		//this case is for user signup
		$response = executeUserCase();
	} else if($case == CASE_VERIFY_OTP){
		//this case is for user signup
		$response = verifyUserOtp();
	} else if($case != CASE_LOGIN){
		$response = array();
		$response['status'] = UNAUTH_ACCESS;
		$cause = getTokenInvalidCause($token);
		if($cause == UNAUTH_1){
			$message = UNAUTH_CAUSE_1;
			setHttpStatus(401);
		} else {
			$message = UNAUTH_CAUSE_2;
			setHttpStatus(408);
		}
		$response['message'] = $message;
	}

	/** API Response - JSON */
	header("Access-Control-Allow-Origin: *");
	header('Content-Type: application/json');
	echo json_encode($response);


	/** 
	* setHttpStatus method is used to set the http status code  
	* 
	* @param statusCode 
	*/
	function setHttpStatus($statusCode) {
		http_response_code($statusCode);
	}

	/**
	 * isTokenValid method checks if the token is valid.
	 * 
	 * @param token
	 * @return isValid
	 */
	function isTokenValid($token){
		$tokenObj = new Token();
		$isValid = ($tokenObj->checkTokenValidity($token))['isTokenValid'];
		return $isValid;
	}

	/**
	 * getTokenInvalidCause method finds the reason what made the token ivalid.
	 * 
	 * @param token
	 * @return isValid
	 */
	function getTokenInvalidCause($token){
		$tokenObj = new Token();
		$cause = ($tokenObj->checkTokenValidity($token))['cause'];
		return $cause;
	}

	/**
	 * validateToken method checks if the token is valid by calling isTokenValid method.
	 * 
	 * @return response
	 */
	function validateToken(){
		$isValid = isTokenValid($_GET['token']);
		if($isValid){
			return array('status' => VALID);
		}
	}

	/**
	 * getUserId method fetches userId based on the token given.
	 * 
	 * @param token
	 * @return isValid
	 */
	function getUserId($token){
		$tokenObj = new Token();
		$userId = $tokenObj->getUserId($token);
		return $userId;
	}
	
	/**
	 * loginUser method establishes a new session for the user by generating a token.
	 * 
	 * @return response	
	 */
	function loginUser(){
		global $method, $data;
		$response = array();
		if($method == 'POST'){
			$auth = new Authenticator($data['email'], $data['password']);
			if($auth->checkIfUserExists()){
				if($auth->isPasswordMatching()){
					$userId = $auth->getUserId();
					$tokenObj = new Token();
					$response = $tokenObj->generateToken($userId);
					$tokenObj->closeConnection(); //closes all the established connections
				} else {
					$response['status'] = FAILURE;
					$response['message'] = INCORRECT_PASSWORD;
				}
			} else {
				$response['status'] = FAILURE;
				$response['message'] = USER_DOES_NOT_EXIST;
			}
		} else {
			$response['status'] = FAILURE;
			$response['message'] = INVALID_REQUEST;
		}
		return $response;
	}

	/** 
	 * executeUserCase method instantiates User object and executes the action. 
	 * 
	 * @return $response
	 */
	function executeUserCase(){
		global $method, $data, $caseId;
		$user = new User($caseId, $method, $data);
	  	$response = $user->executeAction();
		// file_put_contents("testlog.log", "\n".print_r($response, true), FILE_APPEND | LOCK_EX);
		return $response;
	}

	/** 
	 * verifyUserOtp method instantiates User object and verifies the OTP. 
	 * this method works only on POST request
	 *  
	 * @return $response
	 */
	function verifyUserOtp(){
		global $method, $data, $caseId;
		if($method == POST){
			$user = new User($caseId, $method, $data);
		  	$response = $user->verifyOtp();
			return $response;
		}
	}

	/** 
	 * executeLocationCase method instantiates Location object and executes the action. 
	 * 
	 * @return $response
	 */
	function executeLocationCase(){
		global $method, $data, $caseId;
		$location = new Location($caseId, $method, $data);
		$response = $location->executeAction();
		return $response;
	}

	/** 
	 * executeItemCase method instantiates Item object and executes the action. 
	 * This method gets the location data from the request params. List of items will be 
	 * fetched based on the location. 
	 * 
	 * @return $response
	 */
	function executeItemCase(){
		global $method, $data, $caseId;
		$data['locationCode'] = $_GET['lnCode'];
		$item = new Item($caseId, $method, $data);
		$response = $item->executeAction();
		return $response;
	}
	 
	/** 
	 * executeAddressCase method passes the token obtained to fetch the address details.   
	 * 
	 * @return $response
	 */
	function executeAddressCase(){
		global $method, $data, $caseId;
		$data['token'] = $_GET['token'];
		$userAddress = new UserAddress($caseId, $method, $data);
		$response = $userAddress->executeAction();
		return $response;
	}
?>