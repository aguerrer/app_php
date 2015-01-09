<form method="POST" action="<?php echo URL.'insert_profile'; ?>" enctype="multipart/form-data" id="registrese">
	
	<div class="form-group">
		
		<label for="nombre">Nombres</label>
		<input class="form-control" type="text" name="nombre" id="nombre" required/>	

	</div>

	<div class="form-group">
		
		<label for="apellido">Apellidos</label>
		<input class="form-control" type="text" name="apellido" id="apellido" required/>	

	</div>

	<div class="form-group">
		
		<label for="edad">Edad</label>
		<input class="form-control" type="number" name="edad" id="edad" required/>

	</div>


	<div class="form-group">
		
		<label for="sexo">Sexo</label>
		<select class="form-control" name="sexo" id="sexo" required>
			<option disabled selected>Selcciona tu sexo</option>	
			<option value="masculino">Masculino</option>
			<option value="femenino">Femenino</option>

		</select>

	</div>

	<div class="form-group">
		
		<label for="email">Email</label>
		<input class="form-control" type="email" name="email" id="email" />

	</div>

	<div class="form-group">
		
		<label for="password">Contraseña</label>	
		<input class="form-control" id="password" type="password" name="pass" required/>

	</div>

	<div class="form-group">
		
		<label for="foto">Foto</label>
		<img class="file_image" src="#" />
		<input  type="file" name="foto"  accept="image/x-png, image/gif, image/jpeg" class="file" />

	</div>

	<div class="form-group">
		

		<label for="pais">Pais</label>
		<select class="form-control" name="pais" id="pais" required>
			<option disabled selected>Selcciona un pais</option>	
			<option value="colombia">Colombia</option>
			<option value="brasil">Brasil</option>	
			<option value="chile">Chile</option>
			<option value="argentina">Argentina</option>
			<option value="costa_rica">Costa rica</option>
			<option value="panama">Panama</option>
			<option value="paraguay">Paraguay</option>

		</select>



	</div>



	<div class="form-group">
		
		<label for="ciudad">Ciudad</label>
		<select class="form-control" name="ciudad" id="ciudad" required>
			<option disabled selected>Selcciona una ciudad</option>	
			
		</select>

	</div>

	<div class="form-group">
		

		<label for="type_doc">Tipo de documento</label>
		<select class="form-control" name="type_doc" id="type_doc" required>
				
			<option disabled selected>Selcciona un tipo de documento</option>	


		</select>
		

	</div>

	<div class="form-group">
		
		<label for="num_doc">Numero de documento</label>
		<input class="form-control" type="number" name="num_doc" id="num_doc" />	

	</div>


	<div class="form-group">
		
		<label for="direccion">Direccion</label>
		<input class="form-control" type="text" name="direccion" id="direccion" required/>


	</div>
	<div class="form-group">
		

			<label for="telefono">Telefono</label>
			<input class="form-control" type="text" name="telefono" id="telefono" required/>


	</div>
	<div class="form-group universidad">
		
		<label for="universidad">Universidad</label>
		

	</div>

	<div class="form-group">
		
		<label for="carrera">Carrera</label>
		<input class="form-control" type="text" name="carrera" id="carrera" required/>

	</div>

	<div class="form-group">
			
		<label for="acerca">Acerca de ti</label>
		<textarea class="form-control" name="acerca_ti" id="acerca" placeholder="Comenta algo acerca de ti"></textarea>

	</div>

	<div class="form-group">
			
		<label for="acerca">Intereses</label>
		<textarea class="form-control" name="intereses" id="intereses" placeholder="Intereses"></textarea>

	</div>

	<div class="form-group" id="idiomas">
		<label>Idioma(s)</label>
		<a onclick="add_lang(this,event)" href="#"><i class="fa fa-plus"></i> Añadir idioma</a>

		
	</div>

	<div class="form-group">
			
		<label for="tipo_prefil">Perfil</label>
		<select class="form-control" name="tipo" id="tipo_perfil" required>
			<option disabled selected>Selcciona un perfil</option>		
			<option value="viajero">Viajero</option>
			<option value="anfitrion">Anfitrion</option>
			<option value="anfitrion/viajero">Ambos</option>

		</select>


	</div>

	
	
	<input class="btn btn-primary" type="submit" value="Enviar" />


</form>




<script type="text/javascript" src="<?php echo URL.'assets/js/register.js'; ?>">


</script>	




