<?php
/*
路由例子：r=blogControllerName/FunctionName
r=blogArticle/showAll
*/
include_once('../model/User.php');

$route = isset($_GET['r']) ? $_GET['r']:NULL;

session_start();
$userModel = new User();

$_SESSION['admin']=$userModel->returnUser(1);

if (!isset($_SESSION['isLogin'])) {
	$_SESSION['isLogin']=false;
}

if (!isset($_SESSION['isAdminLogin'])) {
	$_SESSION['isAdminLogin'] = false;
}

if($route){

	$partials = explode("/", $route);
	if(count($partials)!=2){
		die('invalid route');
	}
	
	#访问权限判断
	if(str_split($partials[0],5)[0]=='admin' && str_split($partials[0],5)[1]!='Login'){
		if(!$_SESSION['isAdminLogin']){
			header('Location:/index.php?r=adminLogin/login_page');
		}
		$user = $_SESSION['user'];
		if($user['u_role']==1){
			die('权限不足');
		}
	}

	$filename = $partials[0];

	$class_name = ucfirst($filename)."Controller";

	$function_name = $partials[1];

	#路由映射控制器
	if(!file_exists('../controller/'.$class_name.'.php')){
		die('error route1');
	}
	include('../controller/'.$class_name.'.php');

	if(!class_exists($class_name)){
		die('error route2');
	}

	$controller = new $class_name();
	if(!method_exists($controller, $function_name)){
		die('error route3');
	}

	$controller->$function_name();
}else{

	include('../controller/BlogArticleController.php');

	$blogArticleController = new BlogArticleController();

	$blogArticleController->showAll();
}