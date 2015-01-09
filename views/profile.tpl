<?php 

	$viajero    = (isset($params['viajero']))   ? $params['viajero']   : false;
	$anfitrion  = (isset($params['anfitrion'])) ? $params['anfitrion'] : false;
		
	unset($params['anfitrion']);
	unset($params['viajero']);


	$perfil = $params;
	// echo '<pre>';
	// var_dump($anfitrion['fotos_ciudad_casa']);
	// echo '</pre>';
 ?>





	<section id="img_profile">

			<div class="info_perfil">
				<div class="foto">
					<?php echo ($perfil['foto'] != '') 
					? '<img alt="Imagen perfil" src="'.URL.'/assets/upload/users/'.$perfil['foto'].'">' 
					: '<i class="fa fa-user"></i>'; ?>
				</div>
				<div class="content_info">
					<div class="info">
						<div class="nombre">
						<?php echo $perfil['nombre'].' '.$perfil['apellido']; ?>
						</div>	
						<div class="edad_ciudad">
							<?php echo $perfil['edad'];?> - <?php echo $perfil['ciudad'].", ".$perfil['pais'];?>
						</div>
					</div>
					
					<div class="ranking">
						Buen Anfitrión <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
					</div>
					
					<a href="<?php echo URL.'referencias' ?>">
						<div class="mensajes">
							Mis <br> referencias
						</div>
					</a>

					<a href="<?php echo URL.'peticiones' ?>">
						<div class="peticiones">
							Me <img src="<?php echo URL ?>assets/img/peticiones.png" alt="">interesa
						</div>
					</a>
					
					<a href="<?php echo URL.'crear_mensaje/id/'.$perfil['id']; ?>">	
						<div class="mensajes">
							<img src="<?php echo URL ?>assets/img/mensajes.png" alt=""> &nbsp;Mensaje&nbsp; 
						</div>
					</a>	
					
				</div>
		</div> 	 

	</section>
	
	<section id="basic_info">
		<div class="info_perfil">
			<article class="contenedor left">
				<div class="titulo">Acerca de mí:</div>
				<div class="contenido"><?php echo $perfil['acerca_ti']; ?></div>
			</article>
			<article class="contenedor right">
				<div class="titulo">Información general:</div>
				<div class="contenido">
					<ul>
						<li class="li_titulo"><i class="fa fa-circle"></i>Universidad:</li>
						<li class="li_content"><?php echo $perfil['universidad']; ?></li>
						<li class="li_titulo"><i class="fa fa-circle"></i>Género:</li>
						<li class="li_content"><?php echo $perfil['sexo']; ?></li> 
						<li class="li_titulo"><i class="fa fa-circle"></i>Visitas al perfil:</li>
						<li class="li_content"></li>
					</ul>

				</div>
			</article>
			<article class="contenedor left">
				<div class="titulo">Mis intereses:</div>
				<div class="contenido"><?php echo $perfil['intereses']; ?></div>
			</article>

			<?php if($viajero) : ?>
			<article class="contenedor right content_idioma">
				<div class="titulo">Idiomas:</div>
				<div class="contenido">
					
	
						<div class="viajero">
							
								
								<?php 
								
								$idiomas = json_decode($perfil['idiomas']);

									foreach($idiomas as $key => $value) :

										echo '<div class="idioma"><span>'.str_replace('u00f1', 'ñ', $key).'</span><br> Nivel: '.str_replace('u00f1', 'ñ', $value).'</div>';	

									endforeach;	

								 ?>	
							
							
						</div>

					
				</div>
			</article>
			<?php endif; ?>
		</div>
	</section>
	<?php if($viajero != false) : ?>
	<section id="rol_viajero">
		<div class="info_perfil">
			<article class="contenedor full">
				<div class="left">
					<div class="box titulo">
						Como viajero
					</div>
					<div class="box pregunta">
						<div class="preg">
							¿ Ingiere bebidas alcohólicas ?
						</div> 
						<div class="resp">
							<?php echo $viajero['bebes'];?>
						</div>
					</div>
					<div class="box pregunta">
						<div class="preg">
							Viajo con compañia
						</div> 
						<div class="resp">
							Si
						</div>
					</div>
					<div class="box pregunta">
						<div class="preg">
							Número de acompañantes
						</div>  
						<div class="resp">
							2
						</div>
					</div>
					<div class="box descripcion">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean faucibus turpis at quam placerat, et ultricies nunc egestas. Nulla vitae placerat erat, nec dictum tellus. Duis suscipit blandit est, ac pulvinar ex facilisis nec. Nunc congue ipsum a est tristique, non pellentesque sem tempus. In blandit nisl 
					</div>
				</div>
				<div class="rigth">
					<div class="box">
						<div class="img"><img src="<?php echo URL?>assets/img/icon1.png" alt=""></div>
						<div class="text">
							<div class="preg">
								Busco un espacio con:
							</div>
							<div class="resp">
								<?php echo $viajero['busco_anfi'];?>
							</div>
						</div>
					</div>
					<div class="box">
						<div class="img"><img src="<?php echo URL?>assets/img/icon2.png" alt=""></div>
						<div class="text">
							<div class="preg">
								Prefiero que mi anfitrión viva con:
							</div>
							<div class="resp">
								<?php echo $viajero['prefe_anfi'];?>
							</div>
						</div>
					</div>
					<div class="box">
						<div class="img"><img src="<?php echo URL?>assets/img/icon3.png" alt=""></div>
						<div class="text">
							<div class="preg">
								Prefiero un espacio cerca a:
							</div>
							<div class="resp">
								<?php //echo $viajero[''];?>
								Zona estudiantil
							</div>
						</div>
					</div>
					<div class="box">
						<div class="img"><img src="<?php echo URL?>assets/img/icon4.png" alt=""></div>
						<div class="text">
							<div class="preg">
								Busco un espacio que me ofrezca:
							</div>
							<div class="resp">
								<?php //echo $viajero[''];?>
								Cocina
							</div>
						</div>
					</div>
				</div>


			</article>
		</div>
	</section>
<?php endif; ?>
	<?php if($anfitrion != false): ?>	
	<section id="rol_anfitrion">
		<div class="info_perfil">
			<article class="contenedor full">
				<div class="left">
					<div class="box titulo">
						Como Anfitrión
					</div>
					<div class="box pregunta">
						<div class="preg">
							Recibo fumadores
						</div> 
						<div class="resp">
							<?php echo $anfitrion['fumadores'];?>
						</div>
					</div>
					<div class="box pregunta">
						<div class="preg">
							Mi casa es apta para niños
						</div> 
						<div class="resp">
							<?php echo $anfitrion['ninos'];?>
						</div>
					</div>
					<div class="box pregunta">
						<div class="preg">
							Mi casa es apta para mascotas
						</div>  
						<div class="resp">
							<?php echo ucfirst($anfitrion['mascotas']);?>
						</div>
					</div>
					
					<div class="box">
						<div class="img"><img src="<?php echo URL?>assets/img/icon11.png" alt=""></div>
						<div class="text">
							<div class="preg">
								El espacio que ofrezco es:
							</div>
							<div class="resp">
								<?php echo $anfitrion['espacio_ofer'];?>
							</div>
						</div>
					</div>
					<div class="box">
						<div class="img"><img src="<?php echo URL?>assets/img/icon22.png" alt=""></div>
						<div class="text">
							<div class="preg">
								Prefiero que mi anfitrión viva con:
							</div>
							<div class="resp">
								<?php echo ucfirst($anfitrion['vivo_con']);?>
							</div>
						</div>
					</div>
					<div class="box">
						<div class="img"><img src="<?php echo URL?>assets/img/icon33.png" alt=""></div>
						<div class="text">
							<div class="preg">
								Prefiero un espacio cerca a:
							</div>
							<div class="resp">
								<?php //echo $anfitrion[''];?>
								Zona estudiantil
							</div>
						</div>
					</div>
					<div class="box">
						<div class="img"><img src="<?php echo URL?>assets/img/icon44.png" alt=""></div>
						<div class="text">
							<div class="preg">
								Busco un espacio que me ofrezca:
							</div>
							<div class="resp">
								<?php //echo $anfitrion[''];?>
								Cocina
							</div>
						</div>
					</div>
				</div>
				<div class="rigth">
					
					<div class="titulo_galeria">
						Fotos de mi casa: (<?php echo count(json_decode($anfitrion['fotos_ciudad_casa'])) ?>)
					</div>

					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					 
					  <!-- Wrapper for slides -->
					  <div class="carousel-inner" role="listbox">

					    <?php if($anfitrion['fotos_ciudad_casa'] != '[""]') : ?>
													
						<?php $fotos = json_decode($anfitrion['fotos_ciudad_casa']); ?>
						
				
							<?php $i = 1 ;foreach($fotos as $foto) : 
								$active = ($i == 1) ? 'active' : '';
							?>	
								

								<div class="item <?php echo $active; ?>">
							      <img src="<?php echo URL.'assets/upload/users/anfitrion/'.$anfitrion['id_perfil'].'/'.$foto; ?>" alt="Foto galeria">
							     
							    </div>

							<?php $i++; endforeach; ?>
							

						<?php endif ;?>

					  </div>

					  <!-- Controls -->
					  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					  	<img src="<?php echo URL;?>assets/img/prev.png" alt="prev">
					  </a>
					  <div class="separar"></div>
					  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					    <img src="<?php echo URL;?>assets/img/next.png" alt="next">
					  </a>
					</div>
					


				</div>
			</article>
			<article id="te_interesa">
						
						<div class="text">
							¿Te interesa este anfitrión?
						</div>

						<a href="<?php echo URL.'peticiones' ?>">
							<div class="peticiones">
								Me <img src="<?php echo URL ?>assets/img/peticiones.png" alt="">interesa
							</div>
						</a>
						
						<a href="<?php echo URL.'mensajes' ?>">	
							<div class="mensajes">
								<img src="<?php echo URL ?>assets/img/mensajes.png" alt=""> &nbsp;Mensaje&nbsp; 
							</div>
						</a>	
	
			</article>
		</div>
	</section>
	<?php endif; ?>	

	
<span class="boton-top"><img src="<?php echo URL ?>assets/img/subir.png" alt="Subir"></span>









