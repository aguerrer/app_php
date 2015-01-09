

<form action="<?php echo URL.'enviar_couch' ?>" method="post">
	
		
		<input type="hidden" name="id_remitente" value="<?php echo $params['rem'] ?>" />
		<input type="hidden" name="id_receptor"  value="<?php echo $params['rec'] ?>" />
		

		<div class="form-group">
			
			<label for="">Fecha llegada</label>	
			<input type="text" class="datepicker form-control" name="fecha_llegada" placeholder="DD/MM/AA" required />

		</div>
		

		<div class="form-group">
			
			<label for="">Fecha salida</label>
			<input type="text" class="datepicker form-control" name="fecha_salida" placeholder="DD/MM/AA" required />	

		</div>

		<div class="form-group">
			
			<input type="number" class="form-control" name="num_viaj" placeholder="Número de viajeros" required />

		</div>

		<div class="form-group">
			
			<textarea class="form-control" name="msg_anfi" placeholder="Mensaje para el anfitiron" required></textarea>

		</div>

		<input type="submit" value="Enviar peticion" class="btn btn-primary" />

</form>

<script type="text/javascript">
	
	! function($){


		$( ".datepicker" ).datepicker({

			dateFormat: "yy-mm-dd"

		});


	}(window.jQuery);

</script>
