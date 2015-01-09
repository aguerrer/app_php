<?php 

	require_once 'config/init.php';

	if (isset($_SESSION['user']) && $_SESSION['user'] != 'admin' ) :

			__view('home_profile:layout');
	
		else :	

			__view('home:layout');
	

	endif; 

	
?>






