<?php $perfil = $_SESSION['user']['perfil']; ?>

<?php if($params) : ?>

<div class="results"></div>	

<nav>
	<ul class="list_messages">
		

		<?php foreach($params as $msg ) : ?>	
			
			
			<li><a href="<?php echo $msg['id']; ?>" class="see_msg" title="<?php echo $msg['id_receptor']; ?>">
				
			<!-- if para validar si el que envio el mensaje es el mismo que lo envio -->

			
			<?php echo ($msg['foto'] != '') ? '<img alt="foto" height="50" src="'.URL.'assets/upload/users/'.$msg['foto'].'" />' : '<i class="fa fa-user"></i>'; ?>
			<?php echo $msg['nombre'].'   '.$msg['apellido']; ?></a>
				

			<?php 

			$rem = $msg['id_remitente'];
			$rec = $msg['id_receptor'];

			if($perfil['id'] == $msg['id_receptor']) : 

				$mensaje = json_decode($msg['mensajes_receptor']); 
				
				

				$msg['id_remitente'] = $rec;
				$msg['id_receptor']  = $rem;


				

			else : ?>	

			<?php 

				$mensaje = json_decode($msg['mensajes_remitente']); 
				

			
			
			 endif; ?>	

				<div class="msg">
					
					<form action="update_message" method="post">
		
						<input type="hidden" value="<?php echo $msg['id']; ?>" name="id" />
						<input type="hidden" name="id_remitente" value="<?php echo $msg['id_remitente']; ?>">
						<input type="hidden" name="id_receptor" value="<?php echo $msg['id_receptor']; ?>">	
			
				
						<div class="log" role="log">
						
							<ul>
					
								
								<?php foreach($mensaje as $k => $msg_) : ?>

								<li>

									<?php if($msg_->user_id == $perfil['id']): ?>

										<?php echo ($perfil['foto'] != '') ? 
										'<a href="'.URL.'perfil/'.$perfil['id'].'"><img height="50" alt="foto" src="'.URL.'assets/upload/users/'.$perfil['foto'].'" />	
										 </a>' : 
										'<a href="'.URL.'perfil/'.$perfil['id'].'"> <i class="fa fa-user"></i>
										'.$perfil['nombre'].'   '.$perfil['apellido'].'</a>'; ?>
										
										

									<?php else : ?>

										<?php echo ($msg['foto'] != '') ? 
										'<a href="'.URL.'perfil/'.$msg['id_perfil'].'">
										<img height="50" alt="foto" src="'.URL.'assets/upload/users/'.$msg['foto'].'" />'.$msg['nombre'].'   '.$msg['apellido'].'</a>' : 
										'<a href="'.URL.'perfil/'.$msg['id_perfil'].'"><i class="fa fa-user"></i>'.$msg['nombre'].'   '.$msg['apellido'].'</a>'; ?>



									<?php endif; ?>	
									
									<span class="fecha">
										 <?php echo $msg_->fecha; ?>
									</span>
									<!-- <span class="remove_msg"><i class="fa fa-minus"></i></span> -->
									<div class="msg_text">
										<?php echo $msg_->msg; ?>
									</div>
								</li>	

							<?php endforeach; ?>
								
							</ul>

						</div>

						<div class="msg_textarea">
							


							<input class="ultima_fecha"  type="hidden" name="ultima_fecha" value="">
							<input class="fecha_next"  type="hidden" name="fecha" value="">
							<textarea  class="form-control msg_next" name="msg" id="msg" placeholder="Escribe tu mensaje aqui" required></textarea>
							<input type="submit" value="Enviar" class="btn btn-primary"  />

							<?php 
								
								$is_anfi_via = ($_SESSION['user']['tipo'] == 'anfitrion/viajero' AND $msg['tipo'] == 'viajero') ? true : false;
								$is_via_via = ($_SESSION['user']['tipo'] == 'viajero' AND $msg['tipo'] == 'viajero') ? true : false;


								if(is_null( $msg['id_peticion']) AND $_SESSION['user']['tipo'] != 'anfitrion' AND $is_anfi_via == false AND 
									$is_via_via == false )   :

									if($perfil['id'] == $msg['id_receptor']) : ?>
							
										<a class="btn btn-info" 
										href="<?php echo URL.'peticion_form/rec/'.$msg['id_remitente'].'/rem/'.$msg['id_receptor']; ?>">Couch</a>

									<?php else:  ?>			

									<a class="btn btn-info" 
									href="<?php echo URL.'peticion_form/rec/'.$msg['id_receptor'].'/rem/'.$msg['id_remitente']; ?>">Couch</a>

									<?php 


									endif;

								endif;
							 ?>

						</div>
					

					</form>

				</div>

			</li>	

		<?php endforeach; ?>
	</ul>
</nav>

<?php else : ?>

<div class="alert alert-danger" role="alert">No tiene mensajes</div>


<?php endif; ?>


<script type="text/javascript">
	
	! function($){

		$('.see_msg').click(function(e){

			e.preventDefault();
			
			$('.msg').fadeOut('slow');
			$(this).parent().children('.msg').fadeIn('slow');

			var id  = $(this).attr('href');
			var rec = $(this).attr('title');

			$.ajax({
				url: '<?php echo URL."leer_mensaje" ?>',
				cache: false,
				type: 'POST',
				data: {id :id, rec: rec},
				success: function(html){
					$('.results').html(html);
				}
			}); 

		});


		// $('.msg_next').keyup(function(e){

		// 	if(!$(this).val()){

		// 		$('input[type="submit"]').removeAttr('disabled');

		// 	}	

		// });


		// $('.msg_next').keydown(function(event) {
		    	
		// 	var val = $.trim($('#comment').val());


		//     if (event.keyCode == 13) {
		//         $(this).parent().parent().submit();
		//         return false;
		//      }
		// });

		$('.msg_next').keydown(function(e){

			


		  

			var dt = new Date();

			if(dt.getMonth() == 13) {

				var mounth = 1;	

			}else {

				var mounth = dt.getMonth() + 1;		

			}	

			var now = dt.getFullYear() + "-"
            + mounth  + "-" 
            + dt.getDate()+ "  "  
            + dt.getHours() + ":"  
            + dt.getMinutes() + ":" 
            + dt.getSeconds();

           
            var t = $(this).parent().children('.fecha_next');
            var k = $(this).parent().children('.ultima_fecha');
		

			$(t).val(now);	
			$(k).val(now);	

		  if (e.keyCode == 13) {
	        
	    	if($(this).val()) {

    			
		        $(this).parent().parent().submit();
		        return false;

        	}
        	else {

        		alert("El mensaje no puede ser vacio");  		

        	}


	     }
		

		});	


		// $('.update_message').submit(function(e){

		// 	e.preventDefault();

		// 	var text = $.trim($(this).children('.msg_textarea').children('.msg_next').val());

		// 	if(text  != "") {

		// 	var dt = new Date();

		// 	if(dt.getMonth() == 13) {

		// 		var mounth = 1;	

		// 	}else {

		// 		var mounth = dt.getMonth() + 1;		

		// 	}	

		// 	var now = dt.getFullYear() + "-"
  //           + mounth  + "-" 
  //           + dt.getDate()+ "  "  
  //           + dt.getHours() + ":"  
  //           + dt.getMinutes() + ":" 
  //           + dt.getSeconds();

  //           var t = $(this).children('.msg_textarea').children('.fecha_next');
  //           var k = $(this).children('.msg_textarea').children('.ultima_fecha');
			
		// 	$(t).val(now);	
		// 	$(k).val(now);	


		// 	var node = $(this).children('.log');

		// 	var form = $( this ).serialize();	

		// 	 $(this).children('.msg_textarea').children('.msg_next').val('');
		
			
		// 	// $(this).children('.msg_textarea').children('.msg_next').attr('name', 'msg['+next+'][msg]');			
		// 	// $(this).children('.msg_textarea').children('.user_id_next').attr('name', 'msg['+next+'][user_id]');			

		// 	// $.ajax({
		// 	// 	url: '<?php echo URL."update_message" ?>',
		// 	// 	cache: false,
		// 	// 	type: 'POST',
		// 	// 	data: form,
		// 	// 	success: function(html){
		// 	// 	$(node).html(html).fadeIn(100, 'fold');
		// 	// 	$(node).animate({ scrollTop: $(node)[0].scrollHeight}, 1000);
		// 	// 	}
		// 	// }); 

		// 	$(this).submit();

		// 	}
		// 	else {

		// 		console.log('esta vacio');

		// 	} 


		// });


	}(window.jQuery);
</script>