<?php
use Fuel\Core\Controller_Rest;
class Controller_Movie extends Controller_Rest{
	protected $format = 'json';
	
	/***
	 * Uri: movie/new
	 * Desc: add new movie
	 * 
	 * */
	public function post_new(){
		return $this->response(array(),200);
	}
	
	/***
	 * Uri: movie/[movie ID]/delete
	 * Desc: delete movie by Moive_id
	 * 
	 * */
	public function post_delete(){
		return $this->response(array(), 200);
	}
	
	/***
	 * Uri: movie/[movie_id]
	 * Desc: get movie by movie_id
	 * 
	 * */
	public function get_movie(){
		$returnData = array(
				'title'=>'',
				'detail'=>'',
				'collaborator'=>'',
				'movie_id'=>'',
				'movie'=>'' //url
		);
		return $this->response($returnData,200);
	}
	
	/****
	 * Uri: movie/[movie_id]/like
	 * Desc: like by movie_id
	 * */
	public function post_like(){
		return $this->response(array(),200);
	}
	
	/****
	 * Uri: movie/[movie_id]/unlike
	* Desc: unlike by movie_id
	* */
	public function post_unlike(){
		return $this->response(array(),200);
	}
	
	/***
	 * Uri: movie/[movie_id]/share
	 * Desc: share movie by follower
	 * */
	public function post_share(){
		return $this->response(array(),200);
	}
	
	/***
	 * Uri: movie/[movie_id]/unshare
	* Desc: unshare movie by follower
	* */
	public function post_unshare(){
		return $this->response(array(),200);
	}
	
	/***
	 * Uri: movie/[movie_id]/comment
	 * Desc: put comment by movie_id
	 * Params: comment
	 * Return: comment_id
	 * */
	public function post_comment(){
		$returnData = array("comment_id"=>1);
		return $this->response($returnData,200);
	}
	
	/***
	 * Uri: Movie/[movie_id]/comment
	 * Desc: get comment by movie_id
	 * Params: offset, limit
	 * Return Array data comment: Array of
		- id (userID)
		- pic (user icon)
		- created_at
		- comment

	 * */
	public function get_comment(){
		$returnData = array(
				'listComment'=>array(array(
						'id'=>1,
						'pic'=>'',
						'created_at'=>'',
						'comment'=>''		
						),
						array(
								'id'=>2,
								'pic'=>'',
								'created_at'=>'',
								'comment'=>''
						)
						
				)
		);
	return $this->response($returnData,200);	
	}
	
}