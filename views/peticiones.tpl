<?php if($params != false) : ?>

<div class="results"></div>

<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

	<?php $i = 1; ?>

	<?php foreach($params as $key => $estado) : ?>
		
		<div class="panel panel-default">

			<div id="headingOne" role="tab" class="panel-heading">
	      		<h4 class="panel-title">
	        		<a aria-controls="collapseOne" aria-expanded="false" href="#collapse<?php echo $i; ?>" data-parent="#accordion" data-toggle="collapse" class="collapsed">
	         		<?php  echo $key; ?>	
	        		</a>
	      		</h4>
        	</div>

        	<div aria-labelledby="headingTwo" role="tabpanel" class="panel-collapse collapse" id="collapse<?php echo $i; ?>" aria-expanded="false" style="height: 0px;">
	          
	          	<ul>
				


				<?php foreach ($estado as $solicitud)  : ?>
						
						<li>
	
							<a href="<?php echo URL.'perfil/id/'.$solicitud['id_receptor']; ?>">
								<?php echo ($solicitud['foto'] == '') ? '<i class="fa fa-user"></i>'
								: '<img src="'.URL.'assets/upload/users/'.$solicitud['foto'].'" />'; ?>
														
								<?php echo $solicitud['nombre'].' '.$solicitud['apellido']; ?>	

							</a>

						<?php switch ($solicitud['estado']) { 


								 case 'enviada':


									if( $solicitud['id_remitente'] != $_SESSION['user']['perfil']['id']) : ?>	

									
									<span>Fecha llegada : <?php echo $solicitud['fecha_llegada']; ?></span><br/>
									<span>Fecha salida	 : <?php echo $solicitud['fecha_salida']; ?></span><br/>


									<span>Dias :  <?php echo dias($solicitud['fecha_llegada'],$solicitud['fecha_salida']); ?> </span><br/>

									<p><?php echo $solicitud['msg_anfi'] ?></p>
									

									<a class="btn btn-success accept" href="<?php echo URL.'confirmar_peticion/id/'.$solicitud['id'].'/estado/aceptado'; ?>">Aceptar</a>

									<a class="btn btn-danger decline" href="<?php echo URL.'confirmar_peticion/id/'.$solicitud['id'].'/estado/rechazada'; ?>">Rechazar</a>
									
								
									

							<?php  endif; break; ?>

							<?php case 'aceptado' : ?>

							<!-- Mostar formulario del remitente no a calificado -->

							<?php if( $solicitud['id_remitente'] != $_SESSION['user']['perfil']['id']) :
							?>

								
								<a class="btn btn-success" href="<?php echo URL.'confirmar_estadia/id/'.$solicitud['id'].'/estado/estadia_confirmada'; ?>"
								>Confirmar estadia</a>
								<a class="btn btn-danger" href="<?php echo URL.'confirmar_estadia/id/'.$solicitud['id'].'/estado/estadia_rechazada'; ?>"
									>Rechazar estadia</a>

								<!-- <a href="#" class="btn btn-warning calificar">Calificar</a> -->

								

							<?php else : ?>

						
							<span>En espera de confirmacion </span>

							<?php endif; break; ?>


						

							
						<?php } ?>
							
						</li>


				<?php endforeach; ?>	

				</ul>

        	</div>

		</div>	
	
	<?php $i++; endforeach; ?>
	
</div>

<script type="text/javascript">
	
	// $('.accept').click(function(e){

	// 	e.preventDefault();
		
	// 	$('form').fadeOut('fast');	

	// 	$(this).parent().children('form').fadeIn('slow');
		

	// });

	// $('.calificar').click(function(e){

	// 	e.preventDefault();
		
	// 	$('form').fadeOut('fast');	

	// 	$(this).parent().children('form').fadeIn('slow');
		

	// });

	


</script>



<?php else : ?>

<div class="alert alert-danger" role="alert">No tiene peticiones pendientes</div>

<?php endif; ?>