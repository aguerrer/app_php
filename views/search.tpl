<div class="search">
		
	<div class="container">
		
	<div class="search_left">
		
		<form id="search" meyhod="post">
			
			<div class="row">
				<div class="col-lg-6">
					<div class="form-group">
						
						
						<select class="form-control" name="perfil.pais" id="pais" required>
							<option disabled selected>Pais</option>	
							<option value="colombia">Colombia</option>
							<option value="brasil">Brasil</option>	
							<option value="chile">Chile</option>
							<option value="argentina">Argentina</option>
							<option value="costa_rica">Costa rica</option>
							<option value="panama">Panama</option>
							<option value="paraguay">Paraguay</option>

						</select>


					</div>
				</div>
				<div class="col-lg-6">
					<div class="form-group">
						

						<select class="form-control" name="perfil.ciudad" id="ciudad">
							<option disabled selected>Ciudad</option>	
							
						</select>
					</div>
				</div>
			</div>
			
			<div class="row">	
				<div class="col-lg-6">
					<div class="form-group">
						
						<select class="form-control" name="perfil.sexo" id="sexo">
							<option disabled selected>Selcciona tu sexo</option>	
							<option value="masculino">Masculino</option>
							<option value="femenino">Femenino</option>

						</select>

					</div>
				</div>
				<div class="col-lg-6">	
					<div class="form-group">
						
						<select class="form-control" name="perfil.edad" id="edad">
							<option disabled selected>Edad</option>	
							<?php 

								for ($i=16; $i <= 100; $i++) { 
									echo '<option value="'.$i.'">'.$i.'</option>';
								}

							?>

						</select>	

					</div>
				</div>	
			</div>

			<div class="row">
				<div class="col-lg-6">
				
					<div class="form-group universidad">
								
						<label for="universidad">Universidad</label>

					</div>

			
				</div>
				<div class="col-lg-6">
					
					<div class="form-group">
						<label for="fumadores">Fuma</label>
						<select class="form-control" name="anfitrion.fumadores">
							<option disabled selected>Selcciona una opcion</option>
							<option value="si">Si</option>
							<option value="no">No</option>
							
						</select>
					</div>

				</div>
			</div>
		
			<div class="row">
				<div class="col-lg-6">
					<div class="form-group">
						<label for="mascotas">Qué permita mascotas</label>
						<select class="form-control" name="anfitrion.mascotas">
							<option disabled selected>Selcciona una opcion</option>
							<option value="si">Si</option>
							<option value="no">No</option>
						</select>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="form-group">
						<label for="mascotas">Qué permita mascotas</label>
						<select class="form-control" name="anfitrion.mascotas">
							<option disabled selected>Selcciona una opcion</option>
							<option value="si">Si</option>
							<option value="no">No</option>
						</select>
					</div>

				</div>
			</div>
			
			<div class="row">
				<div class="col-lg-6">
					<div class="form-group">
						<label for="vivo_con">El anfitrión prefiero que viva con:</label>
						<select class="form-control" name="anfitrion.vivo_con">
							<option disabled selected>Selcciona una opcion</option>
							<option value="padres">Padres</option>
							<option value="amigos">Amigos</option>
							<option value="solo">Solo</option>
						</select>
					</div>

				</div>

				<div class="col-lg-6">
					
					<div class="form-group">
						<label>Busco un espacio con :</label>
						<select name="anfitrion.espacio_ofer" class="form-control">
							<option disabled selected>Selcciona una opcion</option> 
							<option value="1_habitacion">1 habitacion</option>
							<option value="+1_habitacion">+1 habitacion</option>
							<option value="habitacion_bano_priv">Habitacion con baño privado</option>
							<option value="habitacion_bano_comp">Habitacion con baño compartido</option>
							<option value="habitacion_comp">Habitacion compartida</option>

						</select>
						
					</div>

				</div>
			</div>


			

			

			<div class="form-group">
				<label for="ninos">Qué permita niños</label>
				<select class="form-control" name="anfitrion.ninos">
					<option disabled selected>Selcciona una opcion</option>	
					<option value="si">Si</option>
					<option value="no">No</option>
					
				</select>
			</div>


			<input class="btn btn-primary" type="submit" value="Buscar" />	

		</form>


	</div>	

	<div class="search_right">
		
		
		<div class="results"></div>

	</div>	


	</div>

</div>





<script type="text/javascript">
	
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

		$('#pais').change(function(e){

			var pais = $(this).val();

			$('#ciudad option:gt(0)').remove();
			$('#type_doc option:gt(0)').remove();
			$('.universidad .check').remove();

			$.each( paises[pais], function( key, value ) {
				
				var new_value = value.toLowerCase();	

				$('#ciudad').append( '<option value="'+new_value+'">'+value+'</option>');
					

			});

			$.each( uni[pais], function( key, value ) {
				
				var new_value = value.toLowerCase();	

				
				$('.universidad').append('<div class="check input-group"><span class="input-group-addon"> <input type="radio" name="perfil.universidad"'
				+'value="'+new_value+'" /></span><input class="form-control" type="text" readonly placeholder="'+value+'" /></div>');	

			});

			

		});



		$('#search').submit(function(e){

			e.preventDefault();
			
			var form = $(this);

			$.ajax({
				url: '<?php echo URL."search" ?>',
				cache: false,
				type: 'POST',
				data: form.serialize(),
				success: function(html){
					$('.results').html(html);
				}
			}); 

		});


</script>
