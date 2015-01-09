<?php  if($params != false) : $calificacion = $params[0]; ?>

		<?php if($calificacion['id_remitente'] == $_SESSION['user']['perfil']['id']) : 



			  if($calificacion['calificacion_remitente'] != 0) :

			  	echo '<span>Este usuario ya ha sido calificado</span>';

			  else :	
				?>
			 <form  method="post" action="<?php echo URL.'calificar'; ?>" > 

				<input type="hidden" name="id" value="<?php echo $calificacion['id']; ?>"  />
				
				<div class="form-group">
					
					<textarea class="form-control" name="comentario_remitente" required></textarea>

				</div>							
				
				<div class="form-group">
					
					<span class="input-group-addon"><input  type="checkbox" name="calificacion_remitente" value="1">
					<i class="fa fa-star"></i>
					</span>
					<span class="input-group-addon"><input type="checkbox" name="calificacion_remitente" value="2">
					<i class="fa fa-star"></i>
					</span>
					<span class="input-group-addon"><input type="checkbox" name="calificacion_remitente" value="3">
					<i class="fa fa-star"></i>
					</span>
					<span class="input-group-addon"><input type="checkbox" name="calificacion_remitente" value="4">
					<i class="fa fa-star"></i>
					</span>
					<span class="input-group-addon"><input type="checkbox" name="calificacion_remitente" value="5">
					<i class="fa fa-star"></i>
					</span>
				</div>

				<input type="submit" class="btn btn-primary" value="Enviar">


			</form> 	
				
			

		<?php 	
				endif;
				
			else : 



			  if($calificacion['calificacion_receptor'] != 0) :

			  	echo '<span>Este usuario ya ha sido calificado</span>';

			  else :
		?>



			<form  method="post" action="<?php echo URL.'calificar'; ?>" > 

				<input type="hidden" name="id" value="<?php echo $calificacion['id']; ?>"  />
				
				<div class="form-group">
					
					<textarea class="form-control" name="comentario_receptor" required></textarea>

				</div>							
				
				<div class="form-group">
					
					<span class="input-group-addon"><input  type="checkbox" name="calificacion_receptor" value="1">
					<i class="fa fa-star"></i>
					</span>
					<span class="input-group-addon"><input type="checkbox" name="calificacion_receptor" value="2">
					<i class="fa fa-star"></i>
					</span>
					<span class="input-group-addon"><input type="checkbox" name="calificacion_receptor" value="3">
					<i class="fa fa-star"></i>
					</span>
					<span class="input-group-addon"><input type="checkbox" name="calificacion_receptor" value="4">
					<i class="fa fa-star"></i>
					</span>
					<span class="input-group-addon"><input type="checkbox" name="calificacion_receptor" value="5">
					<i class="fa fa-star"></i>
					</span>
				</div>

				<input type="submit" class="btn btn-primary" value="Enviar">


			</form> 	


		<?php 

				endif; 

			endif;	

		?>

<script type="text/javascript">
	
	$(':checkbox').on('change',function(){
	 var th = $(this), name = th.prop('name'); 
	 if(th.is(':checked')){
	     $(':checkbox[name="'  + name + '"]').not($(this)).prop('checked',false);   
	  }
	});

	$('input[type="submit"]').click(function(e){

		e.preventDefault();

		var form = $(this).parent().children('.form-group').children('.input-group-addon').children('input[type="checkbox"]');

		console.log($(form).is(':checked'));
		
        if($(form).is(':checked')) {  
            
        	if($(this).parent().children('.form-group').children('textarea').val()) {

        		$(this).parent().submit();	

        	}
        	else {

        		alert("Debe hacer un comentario");  		

        	}

        	

        	

        } else {  
            alert("Debe seleccionar una opcion");  
        }  
    

	});

	
</script>


<?php else : ?>

	<span>No tiene permitido calificar a este usuario</span>

<?php endif; ?>	