

<div class="page-header">
  <h1>Actualizar  <small>perfil</small></h1>
</div>

<?php if($_SESSION['user']['tipo'] == 'anfitrion') : ?>

	<a href="<?php echo URL.'deseo_viajero'; ?>" class="btn btn-primary">Deseo ser tambien viajero</a>

<?php elseif($_SESSION['user']['tipo'] == 'viajero') : ?>	
		
	<a href="<?php echo URL.'deseo_anfitrion'; ?>" class="btn btn-primary">Deseo ser tambien anfitrion</a>

<?php endif; ?>

<div role="tabpanel">

	<ul id="forms" class="nav nav-tabs" role="tablist">
		
		  <li role="profile_form" class="active">
		  	<a href="#profile_form" aria-controls="profile_form" role="tab" data-toggle="tab">Datos basicos</a>
		  </li>

		  <?php if(isset($params['viajero'])) : ?>
			  <li role="viajero_form">
			  	<a href="#viajero_form" aria-controls="viajero_form" role="tab" data-toggle="tab">Datos viajero</a>
			  	<?php $viajero = $params['viajero']; ?>
			  </li>
		 <?php endif; ?>

		  <?php if(isset($params['anfitrion'])) : ?>
			  <li role="anfitrion_form">
			  	<a href="#anfitrion_form" aria-controls="anfitrion_form" role="tab" data-toggle="tab">Datos anfitrion</a>
			  	<?php $anfitrion = $params['anfitrion']; ?>
			  </li>
		 <?php endif; ?>


	</ul>

	<div class="tab-content">

	    <div role="tabpanel" class="tab-pane active" id="profile_form">
	    	
			<form method="post" action="<?php echo URL.'update_profile' ?>" enctype="multipart/form-data">
				
				<input type="hidden" value="<?php echo $params['id']; ?>" name="id" />
				<input type="hidden" value="<?php echo $params['id_usuario']; ?>" name="id_usuario" />


				<div class="form-group">
		
					<label for="nombre">Nombres</label>
					<input value="<?php echo $params['nombre']; ?>" class="form-control" type="text" name="nombre" id="nombre" required/>	

				</div>

				<div class="form-group">
					
					<label for="apellido">Apellidos</label>
					<input value="<?php echo $params['apellido']; ?>" class="form-control" type="text" name="apellido" id="apellido" required/>	

				</div>

				<div class="form-group">
					
					<label for="edad">Edad</label>
					<input value="<?php echo $params['edad']; ?>"class="form-control" type="number" name="edad" id="edad" required/>

				</div>


				<div class="form-group">
					
					<label for="sexo">Sexo</label>
					<select class="form-control" name="sexo" id="sexo" required>
						
						
						<option <?php echo ($params['sexo'] == 'masculino') ?  'selected' : '';?> value="masculino">Masculino</option>
						<option <?php echo ($params['sexo'] == 'femenino') ?  'selected' : '';?> value="femenino">Femenino</option>

					</select>

				</div>

				<div class="form-group">
					
					<label for="email">Email</label>
					<input value="<?php echo $_SESSION['user']['nombre_usuario']; ?>" class="form-control" type="email" name="email" id="email" />

				</div>

				<div class="form-group">
					
					<label for="password">Contraseña</label>	
					<input class="form-control" id="password" type="password" name="pass"/>

				</div>

				<div class="form-group">
					
					<label for="foto">Foto</label>

					<?php if($params['foto'] != '') : ?>
					
					<input type="hidden" name="foto" value="<?php echo $params['foto'];?>" />
					<img class="file_image"  height="200" alt="Foto perfil" 
					src="<?php echo URL.'assets/upload/users/'.$params['foto']; ?> "  />
					<a class="change_foto" href="#"><i class="fa fa-pencil-square-o"></i> Editar Foto</a>


					<?php else : ?>

						<img class="file_image" src="#" />
						<input  type="file" name="foto"  accept="image/x-png, image/gif, image/jpeg" class="file" />


					<?php endif; ?>
				

				</div>

				<div class="form-group">
					

					<label for="pais">Pais</label>
					<select class="form-control" name="pais" id="pais" required>
							
						<option <?php echo ($params['pais'] == 'colombia') ? 'selected' : '';?> value="colombia">Colombia</option>
						<option <?php echo ($params['pais'] == 'brasil') ? 'selected' : '';?> value="brasil">Brasil</option>	
						<option <?php echo ($params['pais'] == 'chile') ? 'selected' : '';?> value="chile">Chile</option>
						<option <?php echo ($params['pais'] == 'argentina') ? 'selected' : '';?> value="argentina">Argentina</option>
						<option <?php echo ($params['pais'] == 'costa_rica') ? 'selected' : '';?> value="costa_rica">Costa rica</option>
						<option <?php echo ($params['pais'] == 'panama') ? 'selected' : '';?> value="panama">Panama</option>
						<option <?php echo ($params['pais'] == 'paraguay') ? 'selected' : '';?> value="paraguay">Paraguay</option>

					</select>



				</div>



				<div class="form-group">
					
					<label for="ciudad">Ciudad</label>
					<select class="form-control" name="ciudad" id="ciudad" required>
						
						
					</select>

				</div>

				<div class="form-group">
					

					<label for="type_doc">Tipo de documento</label>
					<select class="form-control" name="type_doc" id="type_doc" required>
							
						


					</select>
					

				</div>

				<div class="form-group">
					
					<label for="num_doc">Numero de documento</label>
					<input class="form-control" value="<?php echo $params['num_doc']; ?>" type="number" name="num_doc" id="num_doc" />	

				</div>


				<div class="form-group">
					
					<label for="direccion">Direccion</label>
					<input value="<?php echo $params['direccion']; ?>" class="form-control" type="text" name="direccion" id="direccion" required/>


				</div>
				<div class="form-group">
					

						<label for="telefono">Telefono</label>
						<input value="<?php echo $params['telefono']; ?>" class="form-control" type="text" name="telefono" id="telefono" required/>


				</div>
				<div class="form-group universidad">
					
					<label for="universidad">Universidad</label>
					

				</div>

				<div class="form-group">
					
					<label for="carrera">Carrera</label>
					<input value="<?php echo $params['carrera']; ?>" class="form-control" type="text" name="carrera" id="carrera" required/>

				</div>

				<div class="form-group" id="idiomas">
					<label>Idioma(s)</label>
					<a class="add_lang" href="#"><i class="fa fa-plus"></i> Añadir idioma</a>
					<?php $i = 1; foreach(json_decode($params['idiomas']) as $k => $v) : ?>
					
						<div class="input-group more_lang" title="<?php echo $i; ?>">
							<input class="form-control" type="text" name="idiomas[<?php echo $i; ?>][nombre]" placeholder="Idioma" value="<?php echo $k; ?>" required/>
			   				 <select class="form-control" name="idiomas[<?php echo $i; ?>][nivel]">
			   				 	<option <?php echo ($v == 'bajo') ? 'selected' : ''; ?> value="bajo">Bajo</option>
								<option <?php echo ($v == 'medio') ? 'selected' : ''; ?> value="medio">Medio</option>
								<option <?php echo ($v == 'alto') ? 'selected' : ''; ?> value="alto">Alto</option>
							</select>
							<a href="#" onclick="remove_lang(this,event)"><i class="fa fa-minus"></i> Quitar</a>
						</div>
						

					<?php $i++; endforeach; ?>

				</div>

				<div class="form-group">
						
					<label for="acerca">Acerca de ti</label>
					<textarea class="form-control" name="acerca_ti" id="acerca" placeholder="Comenta algo acerca de ti"> <?php echo $params['acerca_ti']; ?></textarea>

				</div>

	

				
				
				<input class="btn btn-primary" type="submit" value="Actualizar datos basicos" />	


			</form>


	    </div>
	    
		<!-- Viajero -->

	    <div role="tabpanel" class="tab-pane" id="viajero_form">
	    	
			<h3>Viajero</h3>

			<?php if(isset($viajero)) : ?>

	    	<form method="post" action="update_viajero" enctype="multipart/form-data">
			
	
			<input type="hidden" value="<?php echo $viajero['id_perfil']; ?>" name="id_perfil">	
					    	
			<div class="form-group">
				<label for="fumas">Fumas</label>
				<select class="form-control"name="fumas">
					<option <?php echo ($viajero['fumas'] == 'si') ? 'selected' : '';?>value="si">Si</option>
					<option <?php echo ($viajero['fumas'] == 'no') ? 'selected' : '';?>value="no">No</option>
				</select>
			</div>


			<div class="form-group">
				<label for="bebes">Bebes</label>
				<select class="form-control"name="bebes">
					<option <?php echo ($viajero['bebes'] == 'si') ? 'selected' : '';?>value="si">Si</option>
					<option <?php echo ($viajero['bebes'] == 'no') ? 'selected' : '';?>value="no">No</option>
				</select>
			</div>



		<div class="form-group">
			<label for="mascotas">Llevo mascota</label>
			<select class="form-control"name="mascotas">

				<option <?php echo ($viajero['mascotas'] == 'si') ? 'selected' : '';?> value="si">Si</option>
				<option <?php echo ($viajero['mascotas'] == 'no') ? 'selected' : '';?> value="no">No</option>
			</select>
		</div>


		<div class="form-group">
			<label for="alergias">Alergias y enfermedades</label>
			<input value="<?php echo $viajero['alergias_enfermedades']; ?>" class="form-control" type="text" name="alergias_enfermedades" required/>
		</div>

		
		<div class="form-group">
			<label for="busco_anfi">Busco Anfitrion con espacio</label>
			<select class="form-control" name="busco_anfi" required>
				
				<option <?php echo ($viajero['busco_anfi'] == 'compartido') ? 'selected' : '';?> value="compartido">Compartido</option>
				<option <?php echo ($viajero['busco_anfi'] == 'privado') ? 'selected' : '';?> value="privado">Privado</option>
			</select>
		</div>
		<div class="form-group">
			<label for="prefe_anfi">Preferencias anfitrion</label>
		
			<select class="form-control" name="prefe_anfi">
					
				<option <?php echo ($viajero['prefe_anfi'] == 'Con familia') ? 'selected' : '';?> value="1">Con familia</option>
				<option <?php echo ($viajero['prefe_anfi'] == 'Con amigos') ? 'selected' : '';?> value="2">Con amigos</option>
				<option <?php echo ($viajero['prefe_anfi'] == 'Solo') ? 'selected' : '';?> value="3">Solo</option>
			</select>
		</div>


		<?php if($_SESSION['user']['tipo'] == 'anfitrion/viajero') : ?>
					
				<div class="form-group">
					<input type="hidden" value="<?php echo $params['id_usuario']; ?>" name="id_usuario" />	
					<div class="check input-group">
						<span class="input-group-addon"> 
							<input type="checkbox" value="1" name="dejar_viajero">
						</span>
						<input type="text" placeholder="Dejar de ser viajero" readonly="" class="form-control">
					</div>
				</div>
			<?php endif; ?>
				
				<input class="btn btn-primary" type="submit" value="Actualizar datos viajero" />	

	    	</form>	

	    <?php endif; ?>

	    </div>

		<!-- Anfitrion -->

	    <div role="tabpanel" class="tab-pane" id="anfitrion_form">
	    		
			<h3>Anfitrion</h3>

			<?php if(isset($anfitrion)) : ?>

	    	<form method="post" action="update_anfitrion" enctype="multipart/form-data">
			
			<input type="hidden" value="<?php echo $anfitrion['id_perfil'] ?>" name="id_perfil" />

		
			
			<div class="form-group">
				<label for="fumadores">Recibo fumadores</label>
				<select class="form-control" name="fumadores" required>
					<option <?php echo ($anfitrion['fumadores'] == 'si') ? 'selected' : '';?> value="si">Si</option>
					<option <?php echo ($anfitrion['fumadores'] == 'no') ? 'selected' : '';?> value="no">No</option>
					
				</select>
			</div>


			<div class="form-group">
				<label for="ninos">Mi casa es apta para niños</label>
				<select class="form-control" name="ninos" required>
					<option <?php echo ($anfitrion['ninos'] == 'si') ? 'selected' : '';?> value="si">Si</option>
					<option <?php echo ($anfitrion['ninos'] == 'no') ? 'selected' : '';?> value="no">No</option>

				</select>
			</div>

			<div class="form-group">
				<label for="mascotas">Mi casa es apta para mascotas</label>
				<select class="form-control" name="mascotas" required>
					
					<option <?php echo ($anfitrion['mascotas'] == 'si') ? 'selected' : '';?> value="si">Si</option>
					<option <?php echo ($anfitrion['mascotas'] == 'no') ? 'selected' : '';?> value="no">No</option>
				</select>
			</div>
			<div class="form-group">
				<label for="vivo_con">Vivo con</label>
				<select class="form-control" name="vivo_con" required>
					<option <?php echo ($anfitrion['vivo_con'] == 'Padres') ? 'selected' : '';?> value="padres">Padres</option>
					<option <?php echo ($anfitrion['vivo_con'] == 'Amigos') ? 'selected' : '';?> value="amigos">Amigos</option>
					<option <?php echo ($anfitrion['vivo_con'] == 'Solo') ? 'selected' : '';?> value="solo">Solo</option>
				</select>
			</div>

			<div class="form-group">
				<label>El espacio que ofresco es :</label>
				<span class="input-group-addon">
					<input <?php echo ($anfitrion['espacio_ofer'] == '1_habitacion') ? 'checked' : '';?> type="radio" name="espacio_ofer" value="1_habitacion"/>
					  1 habitacion
				</span><br/>
				<span class="input-group-addon">
					<input <?php echo ($anfitrion['espacio_ofer'] == '+1_habitacion') ? 'checked' : '';?> type="radio" name="espacio_ofer" value="+1_habitacion"/>
					 +1 habitacion
				</span><br/>
				<span class="input-group-addon">
					<input <?php echo ($anfitrion['espacio_ofer'] == 'habitacion_bano_priv') ? 'checked' : '';?> type="radio" name="espacio_ofer" value="habitacion_bano_priv"/> 
					Habitacion con baño privado
				</span><br/>
				<span class="input-group-addon">
					<input <?php echo ($anfitrion['espacio_ofer'] == 'habitacion_bano_comp') ? 'checked' : '';?> type="radio" name="espacio_ofer" value="habitacion_bano_comp"/>
					 Habitacion con baño compartido
				</span><br/>
				<span class="input-group-addon">
					<input <?php echo ($anfitrion['espacio_ofer'] == 'habitacion_comp') ? 'checked' : '';?> type="radio" name="espacio_ofer" value="habitacion_comp"/> 
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
				
				<?php if($anfitrion['fotos_ciudad_casa'] != '[""]') : ?>
				
				<?php $fotos = json_decode($anfitrion['fotos_ciudad_casa']); ?>
				
				<a class="add_fotos_anfi"><i class="fa fa-plus"></i> Añadir mas imagenes</a>			
	
				<ul id="sortable1">
				<?php foreach($fotos as $foto) : ?>	
	
					<li>

					<input type="hidden" name="fotos[]" value="<?php echo $foto ?>">
					<img src="<?php echo URL.'assets/upload/users/anfitrion/'.$anfitrion['id_perfil'].'/'.$foto; ?>" alt="Foto galeria" />
		
					<a class="remove_img_fotos"> <i class="fa fa-times"></i></a>

					</li>

				<?php endforeach; ?>
				</ul>

			<?php else : ?>

			<input type="file" onchange="handleFileSelect1(this.files, this)" name="fotos[]" multiple />
			<output id="list1"></output>

			<?php endif; ?>

			</div>
				
			<?php if($_SESSION['user']['tipo'] == 'anfitrion/viajero') : ?>
					
				<div class="form-group">
					<input type="hidden" value="<?php echo $params['id_usuario']; ?>" name="id_usuario" />	
					<div class="check input-group">
						<span class="input-group-addon"> 
							<input type="checkbox" value="1" name="dejar_anfitrion">
						</span>
						<input type="text" placeholder="Dejar de ser anfitrion" readonly="" class="form-control">
					</div>
				</div>
			<?php endif; ?>
		
			<input class="btn btn-primary" type="submit" value="Actualizar datos anfitrion" />	

		</form>

		<?php endif; ?>

	    </div>
	    
  	</div>

</div>
<script type="text/javascript">
	
 	function readURL(input, rut) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            console.log(rut);
            reader.onload = function (e) {
                	

                $(rut)
                    .attr('src', e.target.result)
                    .width(150)
                    .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
	}

	function remove_lang(nip, e)
	{

		 e.preventDefault();


		 $(nip).parent().remove();

	}


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

  function handleFileSelect1(files) {
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
          document.getElementById('list1').insertBefore(span, null);
        };
      })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);
    }
  }
</script>
<script type="text/javascript">
	
	!function ($){

	$ ( "#sortable" ).sortable();	
	$ ( "#sortable1" ).sortable();	

	$('.add_lang').click(function(e){

		e.preventDefault();

		var counter = $(this).parent().children('.more_lang:last-child').attr('title'); 	


		if ( isNaN(counter)) {

			counter =  parseInt(counter);								

			counter =   1;

		}else {


			counter =  parseInt(counter);

			
			counter = counter + 1;

		}

		$('#idiomas').append('<div class="input-group more_lang" title="'+counter+'"><input class="form-control" type="text"' 
		+'name="idiomas['+counter+'][nombre] placeholder="Idioma" required/>'
		+'<select class="form-control" name="idiomas['+counter+'][nivel]"><option value="bajo">Bajo</option>'
		+'<option value="medio">Medio</option><option value="alto">Alto</option></select><a href="#" onclick="remove_lang(this,event)">'
		+'<i class="fa fa-minus"></i> Quitar</a></div>');

	});


	var paises = {};
	
	var uni = {

		'argentina'   : ['Universidad Siglo 21'],
		'colombia'    : [

			'Corporación Universitaria del Caribe', 
			'Fundación Universitaria del Área Andina', 
			'Institución Universitaria Politécnico Grancolombiano' 
		],
		'panama'      : ['Universidad del Istmo'],
		'paraguay'    : ['Universidad Americana'],
		'brasil'      : ['Universida de Veiga de Almeida'],
		'chile'       : ['Instituto Profesional Providencia'],
		'costa_rica'  : ['Universidad en Ciencias Administrativas San Marcos']
	};	

	paises['argentina'] = [

			'Buenos Aires',
			'La Plata',
			'Córdoba',
			'Santa Fe de la Vera Cruz',
			'Mendoza',
			'San Miguel de Tucumán',
			'Paraná',
			'Salta',
			'Posadas',
			'Resistencia',
			'Corrientes',
			'Santiago del Estero',
			'San Salvador de Yujuy',
			'San Juan',
			'Viedma',
			'Fromosa',
			'Neuquén',
			'Rawson',
			'San Luis',
			'San Fernando del Valle de Catamarca',
			'La Rioja',
			'Santa Rosa',
			'Río Gallego',
			'Ushuaia',



		];

		paises['colombia'] = [

			'Leticia',
			'Medellín',
			'Arauca',
			'Barranquilla',
			'Cartagena',
			'Tunja',
			'Manizales',
			'Florencia',
			'Yopal',
			'Popayán',
			'Valledupar',
			'Quibdó',
			'Montería',
			'Bogotá',
			'Inírida',
			'Riohacha',
			'San José del Guaviare',
			'Neiva',
			'Santa Marta',
			'Villavicencio',
			'Pasto',
			'Cúcuta',
			'Mocoa',
			'Armenia',
			'Pereira',
			'Providencia',
			'Bucaramanga',
			'Sincelejo',
			'Ibagué',
			'Cali',
			'Mitú',
			'Puerto Carreño',


		];

		paises['chile'] = [

			'Iquique',
			'Antofagasta',
			'Copiapó',
			'La Serena',
			'Valparaíso',
			'Rancagua',
			'Talca',
			'Concepción', 
			'Puerto Montt',
			'Coihaique',
			'Punta Arenas',
			'Santiago', 
			'Valdivia', 
			'Arica'

			


		];


		paises['paraguay'] = [

			'Asunción',
			'Filadelfia',
			'Fuerte Olimpo',
			'Villa Hayes',
			'Salto del Guairá',
			'Pedro Juan Caballero',
			'Pilar',
			'Areguá',
			'Ciudad del Este',
			'Paraguarí',
			'San Juan Bautista',
			'Encarnación',
			'Caazapá',
			'Coronel Oviedo',
			'Villarrica',
			'Caacupé',
			'San Pedro del Ycuamandiyú',
			'Concepción',
	

		]; 

		paises['panama'] = [

			'Ciudad de Panamá',
			'Chepo',
			'Chimán',
			'San Miguel',
			'San Miguelito',
			'Taboga'


		];

		paises['brasil'] = [

			'Aracaju',
			'Belém',
			'Belo Horizonte',
			'Boa Vista',
			'Brasília',
			'Campo Grande',
			'Cuiabá',
			'Curitiba',
			'Florianópolis',
			'Fortaleza',
			'Goiania',
			'Joao Pessoa',
			'Macapá',
			'Maceió',
			'Manaus',
			'Natal',
			'Palmas',
			'Porto Alegre',
			'Porto Velho',
			'Recife',
			'Rio Branco',
			'Rio de Janeiro',
			'Salvador',
			'Sao Luis',
			'Sao Paulo',
			'Teresina',
			'Vitória'


		];

		paises['costa_rica'] = [


			'San José',
			'Alajuela',
			'Cartago',
			'Heredia',
			'Limón',
			'Liberia',
			'Puntarenas'

		];

		var type_doc = {

			'argentina' : {

			  'DNI' : 'DNI',
			  'LE'  : 'LIBRETA DE ENROLAMIENTO',
			  'LC'  : 'LIBRETA CÍVICA',
			  'PASAPORTE' : 'PASAPORTE',
			  'CEDULA'    :  'CEDULA'


			},

			'colombia' : {

				'CE'  : 'CEDULA DE EXTRANJERIA',
				'CED' : 'CÉDULA DE CIUDADANÍA',
				'TI'  : 'TARJETA DE IDENTIDAD'

			},

			'costa_rica' : {

				'PAS' : 'PASAPORTE',
				'CED' : 'CED',
				'DNI' : 'DNI'

			},

			'chile' : {

				'CED' : 'CED',
				'DNI' : 'DNI',

			},

			'brasil' : {

				'CPF' : 'CPF'

			},

			'panama' : {

				'PAS' : 'PASAPORTE',
				'CED' : 'CED',
				'CPF' : 'CPF'

			},

			'paraguay' : {

				'CED'  : 'CED',
				'CEDR' : 'CEDULA RESIDENCIA',
				'PAS'  :  'PASAPORTE'

			}

		};


		$('.remove_img_fotos').click(function(e){

			e.preventDefault();

			$(this).parent().remove();

		});


		$('#forms a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show');
		});

		  $('#idiomas').change(function(e){

		  	 e.preventDefault();

		  	 var lang = $(this).val();

		  	 $('#nivel').empty();

		  	 for ( var i = 0, l = lang.length; i < l; i++ ) {
				
				$('#nivel').append('<div class="check input-group">'
					+'<label>Nivel de '+ lang[i]+'</label><br/>'	
					+'<span class="input-group-addon"><input type="checkbox" value="principiante"  name="idiomas['+lang[i]+']" />Principiante</span>'
					+'<span class="input-group-addon"><input type="checkbox" value="intermedio" name="idiomas['+lang[i]+']" />Intermedio</span>'
					+'<span class="input-group-addon"><input type="checkbox" value="experto"    name="idiomas['+lang[i]+']" />Experto</span></div>');	
				// console.log( lang[i] );
			}

		  });



		$(document).ready(function(){

			var pais   =  $('#pais').val();
			var ciudad =  '<?php echo $params["ciudad"]; ?>';

			$.each( paises[pais], function( key, value ) {
					
				var new_value = value.toLowerCase();	
				var selected = '';

				

				if(new_value == ciudad){

					selected = 'selected';	

				}

				$('#ciudad').append( '<option '+selected+' value="'+new_value+'">'+value+'</option>');
						

			});

			$.each( type_doc[pais], function( key, value ) {
				
				var type = '<?php echo $params["type_doc"]; ?>';
				var selected = '';

				if(value == type){

					selected = 'selected';	

				}

				$('#type_doc').append( '<option '+selected+' value="'+key+'">'+value+'</option>');
					

			});

			$.each( uni[pais], function( key, value ) {
				
				var new_value = value.toLowerCase();
				var selected = '';
				var univ = '<?php echo $params["universidad"]; ?>';

				if(new_value == univ){

					selected = 'checked';	

				}
				
				$('.universidad').append('<div class="check input-group"><span class="input-group-addon"> <input '+selected+' type="checkbox" name="universidad"'
				+'value="'+new_value+'" /></span><input class="form-control" type="text" readonly placeholder="'+value+'" /></div>');	

			});

		});

		$('.add_fotos').click(function(e){

			e.preventDefault();

			
			$(this).parent().append('<output id="list"></output><input class="gallery" onchange="handleFileSelect(this.files)" type="file" multiple="true" name="fotos[]" />');	
			$(this).remove();

		});

		$('.add_fotos_anfi').click(function(e){

			e.preventDefault();

			
			$(this).parent().append('<output id="list1"></output><input class="gallery" onchange="handleFileSelect1(this.files)" type="file" multiple="true" name="fotos[]" />');	
			$(this).remove();

		});


		$('.change_foto').click(function(e){

			e.preventDefault();

			$(this).parent().children('input[type="hidden"]').remove();
		
			$(this).parent().append('<input class="file" onChange="readURL(this,this.previousElementSibling);" type="file"'
			  +'accept="image/x-png, image/gif, image/jpeg" name="foto"  />');	
			$(this).remove();

		});


		$('.file').change(function(){

			var rut = $(this).parent().children('img');		

			readURL(this, rut);	


		});

		
	

	}(window.jQuery);


</script>


