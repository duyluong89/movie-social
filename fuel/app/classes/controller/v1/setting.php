<?php
use Fuel\Core\Controller;
class Controller_V1_Setting extends Controller{
	
	/**
	 * Uri: /setting/push
	 * Receive data status(on/of)
	 * Return true/false
	 * Status 200
	 * */
	public function post_push(){
	
		$returnData = array('status'=>true);
		return $this->response($returnData,200);
	}
}