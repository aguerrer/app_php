<!DOCTYPE html>
<html lang="es-CO">

	<head>

		<!-- Title -->
		
		<title><?php __title(); ?></title>

		<!-- Metas  -->

		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<meta content="This is an site made by Negma pro developer like personal portfolio" name="description">
		<meta name="author" content="Negma Pro"/>
		<meta content="Web Developer, Developer, Portfolio, Negma, Desarrollador Web, Nestor Guerrero" name="keywords">
		<meta content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" name="viewport">
		<meta content="http://cuberto.com/media/images/logo-for-social.png" property="og:image">
		<meta content="all" name="robots">
		<meta content="shadowlord444@gmail.com " name="publisher-email">
		<meta content="es_CO" property="og:locale">
		<meta content="website" property="og:type">
		<meta content="Negma Pro - Web Developer" property="og:title">
		<meta content="This is an site made by Negma pro developer like personal portfolio" property="og:description">
		<meta content="<?php echo URL; ?>" property="og:url">
		<meta content="NegmaPro" property="og:site_name">
	   	
	   	<!-- Links -->
	   	<link href="<?php echo 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']; ?>" rel="canonical">
	   	<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
	   	<link rel="stylesheet" href="<?php echo URL.'assets/css/negma.css'; ?>" type="text/css" />
	   	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	   	<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>
	   	<link href='http://fonts.googleapis.com/css?family=Dosis' rel='stylesheet' type='text/css'>
		
		<!-- Scripts -->

		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
		
		  


	</head>	

	<body>	


		<header id="home">
			
			<!-- Banner Home -->
			<?php add_widget('banner'); ?>

			<div class="container">

				<nav class="logo_home">
					<img width="200" height="250" src="<?php echo URL.'assets/img/home_logo.png' ?>" alt="Home logo" />
				</nav>

				<nav class="main_menu">
					<ul>
						<li><a href="#home">Inicio</a></li>
						<li><a href="#about">Acerca de mi</a></li>
						<li><a href="#portfolio">Portafolio</a></li>
						<li><a href="#contacto">Contacto</a></li>
					</ul>
				</nav>

			</div>
			
		</header>	

		<head>	
	

