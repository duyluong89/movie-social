<?php
use Fuel\Core\Controller_Rest;
class Controller_V1_Notification extends Controller_Rest{
	
	/****
	 * UriL: /notification
	 * Desc: Getting what’s new
	 * **/
	public function get_new(){
		$returnData = array();
		
		return  $this->response($returnData,200);
	}
	
	/**
	 * Uri: movie/[movie_id]/notify
	 * Desc: Pushing illegal contents notification by movie_id
	 * 
	 * **/
	public function post_movie(){
		$returnData = array();
		
		return  $this->response($returnData,200);
	}
	
	/**
	 * Uri:user/[user_id]/notify
	 * Desc: Pushing illegal contents notification by user_id
	 *
	 * **/
	public function post_user(){
		$returnData = array();
	
		return  $this->response($returnData,200);
	}
}