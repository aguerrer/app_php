<div class="page-header">
  <h1>Añadir perfil <small>viajero</small></h1>
</div>

<form method="post" action="add_viajero" enctype="multipart/form-data">
			
	
		<input type="hidden" value="<?php echo $_SESSION['user']['perfil']['id']; ?>" name="id_perfil">	
				    	
		<div class="form-group">
			<label for="fumas">Fumas</label>
			<select class="form-control"name="fumas">
				<option disabled selected>Selcciona si fumas</option>
				<option value="si">Si</option>
				<option value="no">No</option>
			</select>
		</div>


		<div class="form-group">
			<label for="bebes">Bebes</label>
			<select class="form-control"name="bebes">
				<option disabled selected>Selcciona si bebes</option>	
				<option value="si">Si</option>
				<option value="no">No</option>
			</select>
		</div>



	<div class="form-group">
		<label for="mascotas">Llevo mascota</label>
		<select class="form-control"name="mascotas">
			<option disabled selected>Selcciona si tienes mascotas</option>
			<option value="si">Si</option>
			<option value="no">No</option>
		</select>
	</div>


	<div class="form-group">
		<label for="alergias">Alergias y enfermedades</label>
		<input class="form-control" type="text" name="alergias_enfermedades" required/>
	</div>


	<div class="form-group">
		<label for="busco_anfi">Busco Anfitrion con espacio</label>
		<select class="form-control" name="busco_anfi" required>
			<option disabled selected>Selcciona una opcion</option>
			<option value="compartido">Compartido</option>
			<option value="privado">Privado</option>
		</select>
	</div>
	<div class="form-group">
		<label for="prefe_anfi">Preferencias anfitrion</label>
	
		<select class="form-control" name="prefe_anfi">
			<option disabled selected>Selcciona una opcion</option>	
			<option value="1">Con familia</option>
			<option value="2">Con amigos</option>
			<option value="3">Solo</option>
		</select>
	</div>

	
	

	<div class="form-group">	
			
	 <input class="btn btn-primary" type="submit" value="Actualizar datos viajero" />	

</form>



