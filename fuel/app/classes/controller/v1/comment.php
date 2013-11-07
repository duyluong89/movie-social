<?php
use Fuel\Core\Controller_Rest;
class Controller_V1_Comment extends Controller_Rest{
	/******
	 * Uri: comment/[comment_id]/delete
	 * Desc: delete comment by comment_id
	 * 
	 * */
	public function post_delete(){
		return $this->response(array(),200);
	}
}