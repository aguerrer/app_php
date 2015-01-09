<?php 

	require_once PATH."models/message.php";	
	use \message\MessageModel as m;
		


	$new_messages = m::get_new_message($_SESSION['user']['perfil']['id']);


	$new_messages = $new_messages[0];

	echo ($new_messages['count'] > 0) ? '<div class="count">'.$new_messages['count'].'</div>' : '';

 ?>