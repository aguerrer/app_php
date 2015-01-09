<?php 

	require_once PATH."models/application.php";	
	use \application\ApplicationModel as a;
		


	$new_applications = a::get_new_application($_SESSION['user']['perfil']['id']);


	$new_applications = $new_applications[0];

	echo ($new_applications['count'] > 0) ? '<div class="count">'.$new_applications['count'].'</div>' : '';

 ?>