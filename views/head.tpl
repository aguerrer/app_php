<!DOCTYPE html>
<html lang="es">

	<head>
	
		<!-- Title -->
		
		<title><?php __title(); ?></title>

		<!-- Metas  -->

		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<meta content="Red ilumno - Couch" name="description">
		<meta name="author" content="Color al cuadrado"/>
		<meta content="construccion" name="keywords">
		<meta content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0" name="viewport">
		<meta content="http://cuberto.com/media/images/logo-for-social.png" property="og:image">
		<meta content="all" name="robots">
		<meta content="info@coloralcuadrado.com " name="publisher-email">

	   	
	   	<!-- Links -->

	   	<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />	
	   	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	   	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css"/>
		<link href="<?php echo URL; ?>assets/css/color.css" rel="stylesheet" type="text/css" />	
		
		<!-- Scripts -->

		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
		
		  


	</head>	

	<body>	


		<header>
			
			<section id="head">
				<div class="left">
					<a href="<?php echo URL;?>">
						<div class="logo"></div>
					</a>
					<div class="line"></div>
					<div class="social">
						<div class="social_text">Síguenos en:</div>
						<div>
							<a href="#" target="_blank">
								<i class="fa fa-facebook"></i>
							</a>
						</div>
						<div>
							<a href="#" target="_blank">
								<i class="fa fa-twitter"></i>
							</a>
						</div>
						<div>
							<a href="#" target="_blank">
								<i class="fa fa-youtube"></i>
							</a>
						</div>
					</div>	
				</div>
				<div class="rigth">
					<?php add_widget('login'); ?>
				</div>
			</section>
			<section id="menu">
				<div id="navcontainer">
					<ul>
						<li><a href="#">¿Qué es Mundo Ilumno?</a></li>
						<li><a href="<?php echo URL.'buscar'; ?>">Planea tu viaje</a></li>
						<li><a href="#">Actividad</a></li>
						<li><a href="#">Eventos</a></li>
						<!-- <li><a href="<?php //echo URL.'calificar_form/id/'; ?>">Calificar</a></li> -->
					</ul>
				</div>
			</section>

		</header>	