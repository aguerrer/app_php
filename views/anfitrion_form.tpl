<div class="page-header">
  <h1>Añadir perfil <small>anfitrion</small></h1>
</div>


<form method="post" action="add_anfitrion" enctype="multipart/form-data">
			
	<input type="hidden" value="<?php echo $_SESSION['user']['perfil']['id']; ?>" name="id_perfil">	
	
	
	
	<div class="form-group">
		<label for="fumadores">Recibo fumadores</label>
		<select class="form-control" name="fumadores" required>
			<option disabled selected>Selcciona una opcion</option>	
			<option value="si">Si</option>
			<option value="no">No</option>
			
		</select>
	</div>


	<div class="form-group">
		<label for="ninos">Mi casa es apta para niños</label>
		<select class="form-control" name="ninos" required>
			<option disabled selected>Selcciona una opcion</option>	
			<option value="si">Si</option>
			<option value="no">No</option>
			
		</select>
	</div>

	<div class="form-group">
		<label for="mascotas">Mi casa es apta para mascotas</label>
		<select class="form-control" name="mascotas" required>
			<option disabled selected>Selcciona una opcion</option>	
			<option value="si">Si</option>
			<option value="no">No</option>
		</select>
	</div>
	<div class="form-group">
		<label for="vivo_con">Vivo con</label>
		<select class="form-control" name="vivo_con" required>
			<option value="padres">Padres</option>
			<option value="amigos">Amigos</option>
			<option value="solo">Solo</option>
		</select>
	</div>
	
	<div class="form-group">
		<label>El espacio que ofresco es :</label>
		<span class="input-group-addon">
			<input type="radio" name="espacio_ofer" value="1_habitacion"/>
			  1 habitacion
		</span><br/>
		<span class="input-group-addon">
			<input type="radio" name="espacio_ofer" value="+1_habitacion"/>
			 +1 habitacion
		</span><br/>
		<span class="input-group-addon">
			<input type="radio" name="espacio_ofer" value="habitacion_bano_priv"/> 
			Habitacion con baño privado
		</span><br/>
		<span class="input-group-addon">
			<input type="radio" name="espacio_ofer" value="habitacion_bano_comp"/>
			 Habitacion con baño compartido
		</span><br/>
		<span class="input-group-addon">
			<input type="radio" name="espacio_ofer" value="habitacion_comp"/> 
			Habitacion compartida
		</span>
	</div>

	<div class="form-group">
		<label>En mi espacio puede hacer uso de : </label>
		<span class="input-group-addon">
			<input type="checkbox" name="espacio_uso[]" value="cocina"/> 
			Cocina
		</span><br/>
		<span class="input-group-addon">
			<input type="checkbox" name="espacio_uso[]" value="ropa_cama"/> 
			Ropa de cama
		</span><br/>
		<span class="input-group-addon">
			<input type="checkbox" name="espacio_uso[]" value="servicio_lavanderia"/> 
			Servicio de lavanderia
		</span><br/>
		<span class="input-group-addon"><input type="checkbox" name="espacio_uso[]" value="internet"/> 
			Internet
		</span><br/>
		<span class="input-group-addon">
			<input type="checkbox" name="espacio_uso[]" value="television"/> 
			Television
		</span><br/>
	</div>

	<div class="form-group">
		<label>Mi casa esta cerca a: </label>
		<span class="input-group-addon">
			<input type="checkbox" value="zona_estudiantil" name="cerca_a[]" /> 
			Zona estudiantil
		</span><br/>
		<span class="input-group-addon">
			<input type="checkbox" name="cerca_a[]" value="universidades" /> 
			Universidades
		</span><br/>
		<span class="input-group-addon">
			<input type="checkbox" name="cerca_a[]" value="centro_comerciales" /> 
			Centro comerciales
		</span><br/>	
		<span class="input-group-addon">
			<input type="checkbox" name="cerca_a[]" value="medios_transporte" /> 
			Medios de transporte 
		</span><br/>
		<span class="input-group-addon">
			<input type="checkbox" name="cerca_a[]" value="sector_financiero" /> 
			Sector financiero
		</span><br/>
		<span class="input-group-addon">
			<input type="checkbox" name="cerca_a[]" value="zonas_recreativas" /> 
			Zonas recreativas
		</span><br/>
		<span class="input-group-addon">
			<input type="checkbox" name="cerca_a[]" value="fuera_de_ciudad" /> 
			Fuera de la ciudad
		</span><br/>
		<span class="input-group-addon">
			<input type="checkbox" name="cerca_a[]" value="centro_ciudad" /> 
			Centro de la ciudad
		</span>
	</div>
		

	<div class="form-group">
		
		<label for="fotos_anfitrion">Fotos de tu casa y tu ciudad</label>
		<input type="file" onchange="handleFileSelect(this.files, this)" name="fotos[]" multiple />
		<output id="list"></output>


	</div>
		


	<input class="btn btn-primary" type="submit" value="Actualizar datos anfitrion" />	

</form>


<script type="text/javascript">
	
	function handleFileSelect(files) {
    // var files = evt.target.files; // FileList object
    console.log(files);
    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = files[i]; i++) {

      // Only process image files.
      if (!f.type.match('image.*')) {
        continue;
      }

      var reader = new FileReader();

      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
          // Render thumbnail.
          var span = document.createElement('span');
          span.innerHTML = ['<img height="200" class="thumb" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
          document.getElementById('list').insertBefore(span, null);
        };
      })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
    }
  }




	

</script>