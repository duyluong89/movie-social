<?php
return array(
	'_root_'  => 'welcome/index',  // The default route
	'_404_'   => 'welcome/404',    // The main 404 route
	
	'hello(/:name)?' => array('welcome/hello', 'name' => 'hello'),
	'v1/signup'=>'v1/user/signup',
	'v1/login'=>'v1/user/login',
	'v1/setting/push'=>'v1/setting/push',
	'v1/user/:user_id/follow' =>'v1/user/follow',
	'v1/user/:user_id/unfollow' =>'v1/user/unfollow',
	'v1/me/profile'=>'v1/user/profile',
	'v1/:user_id/profile'=>'v1/user/profile',
	'v1/:user_id/following'=>'v1/user/following',
	'v1/:user_id/follower'=>'v1/user/follower',
	'v1/movie/new'=>'v1/movie/new',
	'v1/movie/:movie_id/delete'=>'v1/movie/delete',
	'v1/movie/:movie_id'	=>'v1/movie/movie',
	'v1/movie/:movie_id/like'=>'v1/movie/like',
	'v1/movie/:movie_id/unlike'=>'v1/movie/unlike',
	'v1/movie/:movie_id/share'=>'v1/movie/share',
	'v1/movie/:movie_id/unshare'=>'v1/movie/unshare',
	'v1/movie/:movie_id/comment'=>'v1/movie/comment',
	'v1/comment/:comment_id/delete'=>'v1/comment/delete',
	'v1/timeline'=>'v1/timeline/timeline',
	'v1/timeline/:tag'=>'v1/timeline/tag',
	'v1/movie/search'	=>'v1/movie/search',
	
);