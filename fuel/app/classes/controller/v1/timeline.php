<?php
use Fuel\Core\Controller_Rest;
class Controller_V1_Timeline extends Controller_Rest{
	
	/***
	 * Uri:timeline
	 * Desc: home timeline mixture of: friends movie, friends shared movie
	 * my movie, my share movie
	 * */
	function get_timeline(){
		$returnData = array(
				'timeline'=>array(array(
						'movie'=>1,
						'created_at'=>'',
						'detail'=>'',
						'pic'=>'',
						'name'=>'',
						'title'=>'',
						'like'=>'',
						'comments'=>1,
						'shares'=>1,
						'friendshares'=>1
				),
						array(
						'movie'=>1,
						'created_at'=>'',
						'detail'=>'',
						'pic'=>'',
						'name'=>'',
						'title'=>'',
						'like'=>'',
						'comments'=>1,
						'shares'=>1,
						'friendshares'=>1
				),
		
				)
		);
		return $this->response($returnData,200);
	}
	
	/***
	 * Uri: timeline/[tag]
	 * Desc: Timelines, searched by Tag (not friendship)
	 * */
	public function get_tag(){
		$returnData = array(
				'movies'=>array('movie1','movie2')
		);
		return $this->response($returnData,200);
	}
}