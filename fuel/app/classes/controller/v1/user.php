<?php

use Fuel\Core\Controller_Rest;
class Controller_V1_User extends Controller_Rest{
	protected $format = 'json';
	public function before()
	{
		parent::before();
	
	}
	
	/**
	 * Uri: /signup
	 * Receive data name, locale, mail, password, device_id, version, model, maker , os
	 * Return Id, token
	 * Status 200
	 * */
	public function post_signup(){
		
		$returnData = array(
				'id'=>1,
				'token'=>''
		);
		
		return $this->response($returnData,200);
	}
	
	/**
	 * Uri: /login
	 * Receive data Email,password
	 * Return Id, Token
	 * Status 200
	 * */
	public function post_login(){
		$returnData = array(
				'id'=>1,
				'token'=>''
		);
		return $this->response($returnData,200);
	}
	
	
	/**
	 * Uri: user/[user_id]/follow
	 * Description: follow friends by Id
	 * Return status true
	 * Status 200
	 * */
	public function post_follow(){
		$user_id = $this->param('user_id');
		return $this->response(array($user_id),200);
	}
	/**
	 * Uri: user/[user_id]/unfollow
	 * Description: unfollow friends by Id
	 * Return status true
	 * Status 200
	 * */
	public function post_unfollow(){
		return $this->response(array(),200);
	}
	
	/**
	 * Uri: me/profile
	 * Desc: update user profile 
	 * Params: Name, profile, pic(multi-part attachment)
	 * Return N/a
	 * */
	public function post_profile(){
		
		return $this->response(array(),200);
	}
	
	/**
	 * Uri: [user_id]/profile
	 * Desc: get profile by user_Id
	 * 
	 * */
	public function get_profile(){
		$returnData = array(
				'user_id'=>1,
				'name'=>'thomas',
				'profile'=>'',
				'pic'=>'',
				'videos'=>2,
				'followings'=>'',
				'followers'=>'',
				'movies'=>array(),
				
		);
		
		return $this->response($returnData,200);
	}
	
	/***
	 * Uri: [user_id]/following
	 * Desc: get list of following by user
	 * return List following
	 * */
	public function get_following(){
		$returnData = array(
				'following'=>array(
						array(
								'user_id'=>1,
								'name'=>'thomas',
								'profile'=>'',
								'pic'=>''
						),
						array(
								'user_id'=>2,
								'name'=>'master',
								'profile'=>'',
								'pic'=>''
						),
			),
		);
		return $this->response($returnData,200);
	}
	
	/***
	 * Uri: [user_id]/follower
	 * Desc: get list follower by user_id
	 * Params: offset, limit
	 * Return data, status 200
	 * */
	public function get_follower(){
		$returnData = array(
				'followers'=>array(
						array(
								'user_id'=>1,
								'name'=>'thomas',
								'profile'=>'',
								'pic'=>''
						),
						array(
								'user_id'=>2,
								'name'=>'master',
								'profile'=>'',
								'pic'=>''
						),
			),
		);
		return $this->response($returnData,200);
	}
	
	/****
	 * Uri: /user/search
	 * Desc: search user
	 * Params: query
	 * Return: array user
	 * */
	public function get_search(){
		$returnData = array(
				'listUser'=>array(
						array(
								'user_id'=>1,
								'name'=>'',
								'profile'=>'',
								'pic'=>''
						),
						array(
								'user_id'=>2,
								'name'=>'',
								'profile'=>'',
								'pic'=>''
						),
			)
		);
		return $this->response($returnData,200);
	}
	
	/*******
	 * Uri: me/friends/facebook
	 * Desc: Seraching users by FB connection
	 * params: fb_id, fb_token
	 * Return: User
	 * ***/
	public function get_facebook(){
		$returnData = array('user1');
		return $this->response($returnData,200);
	}
	
	/*******
	 * Uri: me/friends/twitter
	* Desc: Seraching users by FB connection
	* params: tw_id, tw_token
	* Return: User
	* ***/
	public function get_twitter(){
		$returnData = array('user1');
		return $this->response($returnData,200);
	}
	
	/*****
	 * Uri: user/hot
	* Desc: Hot user Algorithm needed
	* Return: array user hot
	*
	* **/
	public function get_hot(){
		$returnData = array('userhot');
	
		return $this->response($returnData,200);
	}
	
	
}