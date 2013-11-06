<?php

use Fuel\Core\Input;
use Fuel\Core\Controller_Rest;
use Fuel\Core\Router;
use Fuel\Core\Debug;
class Controller_User extends Controller_Rest{
	protected $format = 'json';
	public function before()
	{
		parent::before();
	
	}
	function get_follow(){
		//$user_id = Router::get('user',array('userid'));
		return $this->response(array(
            'foo' => 1,
            'baz' => array(
                1, 50, 219
            ),
            'empty' => null
        ),200);
		
	}
}