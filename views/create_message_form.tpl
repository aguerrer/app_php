<?php $perfil = $_SESSION['user']['perfil']; ?>

<form action="<?php echo URL.'new_message'; ?>" method="post" id="new_message">
	
	<div class="form-group">
		
		<input type="hidden" name="id_remitente" value="<?php echo $_SESSION['user']['perfil']['id']; ?>" />	
		<?php echo ($params['data_msg'][0]['foto'] !='') ? 
		'<a href="'.URL.'profile/'.$params['data_msg'][0]['id'].'"><img 
			src="'.URL.'assets/upload/users/'.$params['data_msg'][0]['foto'].'" 
			alt="Foto remitente" height="50" /> '.$params['data_msg'][0]['nombre'].'  '.$params['data_msg'][0]['apellido'] .'</a>' :
		'<a href="'.URL.'profile/'.$params['data_msg'][0]['id'].'"><i class="fa fa-user"></i>'.$params['data_msg'][0]['nombre'].'  '.$params['data_msg'][0]['apellido'] .' </a>';

		?>
	</div>	

	<div class="form-group">
		
		<input type="hidden" name="id_receptor"  value="<?php echo $params['id']; ?>" />
	
	</div>		
	
	<div class="form-group last">
		<input type="hidden" value="<?php echo $perfil['id']; ?>" name="user_id"  />
		<input type="hidden" value="" name="fecha" id="fecha" />
		<input type="hidden" value="" name="ultima_fecha" id="ultima_fecha" />
		<label for="msg">Mensaje</label>
		<textarea class="form-control" name="msg" id="msg" ></textarea>		


	</div>		

	<!-- <input type="submit" value="Enviar" class="btn btn-primary"/> -->


</form>

<script type="text/javascript">
	
	! function ($){




		$('#msg').keydown(function(e){

			


		    if (e.keyCode == 13) {
		        
		    	if($(this).val()) {

        			
			        $(this).parent().parent().submit();
			        return false;

	        	}
	        	else {

	        		alert("El mensaje no puede ser vacio");  		

	        	}


		     }

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

           
		

			$('#fecha').val(now);
			$('#ultima_fecha').val(now);
		

		});	


	}(window.jQuery);
		

</script>