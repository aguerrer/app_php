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

				
				$('.universidad').append('<div class="check input-group"><span class="input-group-addon"> <input type="radio" name="universidad"'
				+'value="'+new_value+'" /></span><input class="form-control" type="text" readonly placeholder="'+value+'" /></div>');	

			});

			$.each( type_doc[pais], function( key, value ) {
				


				$('#type_doc').append( '<option value="'+key+'">'+value+'</option>');
					

			});

		});


		
	

		function remove_lang(nip, e)
		{

			 e.preventDefault();


			 $(nip).parent().remove();

		}

		function add_lang(nip, e)
		{

			e.preventDefault();


			var counter = $(nip).parent().children('.more_lang:last-child').attr('title'); 	

					


			if ( isNaN(counter)) {

				counter =  parseInt(counter);								

				counter =   1;

			}else {


				counter =  parseInt(counter);

				
				counter = counter + 1;

			}

			$('#idiomas').append('<div class="input-group more_lang" title="'+counter+'"><input class="form-control" type="text"' 
			+'name="idiomas['+counter+'][nombre]" placeholder="Idioma" required/>'
			+'<select class="form-control" name="idiomas['+counter+'][nivel]"><option value="bajo">Bajo</option>'
			+'<option value="medio">Medio</option><option value="alto">Alto</option></select><a href="#" onclick="remove_lang(this,event)">'
			+'<i class="fa fa-minus"></i> Quitar</a></div>');

		}


		$('#tipo_perfil').change(function(e){

		var value = $(this).val();

		var viajero = '<div class="viajero"><h3>Viajero</h3>'
		
	
		+'<div class="form-group"><label for="fumas">Fumas</label><select class="form-control"name="viajero[fumas] required"><option disabled selected>Selcciona una opcion</option><option value="si">Si</option><option value="no">No</option></select></div>'
		+'<div class="form-group"><label for="bebes">¿Ingiero bebidas alcohólicas?</label><select class="form-control"name="viajero[bebes] required"><option disabled selected>Selcciona una opcion</option><option value="si">Si</option><option value="no">No</option></select></div>'
		+'<div class="form-group"><label for="mascotas">Llevo mascota</label><select class="form-control"name="viajero[mascotas] required"><option disabled selected>Selcciona una opcion</option>'
		+'<option value="si">Si</option><option value="no">No</option></select></div>'
		+'<div class="form-group"><label for="alergias">Alergias y enfermedades</label><input class="form-control" type="text" name="viajero[alergias_enfermedades]" required/></div>'
		+'<div class="form-group"><label for="busco_anfi">Busco un espacio con: </label><select class="form-control" name="viajero[busco_anfi]" required>'
		+'<option disabled selected>Selcciona una opcion</option><option value="privado">Compartido</option><option value="privado">Privado</option></select></div>'
		+'<div class="form-group"><label for="prefe_anfi">El anfitrión prefiero que viva con:</label><select class="form-control" name="viajero[prefe_anfi]">'
		+'<option disabled selected>Selcciona una opcion</option><option value="1">Con familia</option><option value="2">Con amigos</option><option value="3">Solo</option></select></div>'
		+'</div>';

		var anfitrion = '<div class="anfitrion"><h3>Anfitrion</h3>'
		
		+'<div class="form-group"><label for="fumadores">Recibo fumadores</label><select class="form-control" name="anfitrion[fumadores]" required><option disabled selected>Selcciona una opcion</option><option value="si">Si</option>'
		+'<option value="no">No</option></select></div>'
		+'<div class="form-group"><label for="ninos">Mi casa es apta para niños</label><select class="form-control" name="anfitrion[ninos]" required><option disabled selected>Selcciona una opcion</option><option value="si">Si</option>'
		+'<option value="no">No</option></select></div>'
		+'<div class="form-group"><label for="mascotas">Mi casa es apta para mascotas</label><select class="form-control" name="anfitrion[mascotas]" required><option disabled selected>Selcciona una opcion</option><option value="si">Si</option>'
		+'<option value="no">No</option></select></div>'
		+'<div class="form-group"><label for="vivo_con">Vivo con</label><select class="form-control" name="anfitrion[vivo_con]" required><option disabled selected>Selcciona una opcion</option><option value="padres">Padres</option>'
		+'<option value="amigos">Amigos</option><option value="solo">Solo</option></select></div>'
		+'<div class="form-group"><label>El espacio que ofresco es :</label>'
		+'<span class="input-group-addon"><input type="radio" name="anfitrion[espacio_ofer]" value="1_habitacion"/>  1 habitacion</span><br/>'
		+'<span class="input-group-addon"><input type="radio" name="anfitrion[espacio_ofer]" value="+1_habitacion"/> +1 habitacion</span><br/>'
		+'<span class="input-group-addon"><input type="radio" name="anfitrion[espacio_ofer]" value="habitacion_bano_priv"/> Habitacion con baño privado</span><br/>'
		+'<span class="input-group-addon"><input type="radio" name="anfitrion[espacio_ofer]" value="habitacion_bano_comp"/> Habitacion con baño compartido</span><br/>'
		+'<span class="input-group-addon"><input type="radio" name="anfitrion[espacio_ofer]" value="habitacion_comp"/> Habitacion compartida</span>'
		+'</div>'
		+'<div class="form-group"><label>En mi espacio puede hacer uso de : </label>'
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[espacio_uso][]" value="cocina"/> Cocina</span><br/>'
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[espacio_uso][]" value="ropa_cama"/> Ropa de cama</span><br/>'
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[espacio_uso][]" value="servicio_lavanderia"/> Servicio de lavanderia</span><br/>'
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[espacio_uso][]" value="internet"/> Internet</span><br/>'
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[espacio_uso][]" value="television"/> Television</span><br/>'
		+'</div>'
		+'<div class="form-group"><label>Mi casa esta cerca a: </label><span class="input-group-addon"><input type="checkbox" value="zona_estudiantil" name="anfitrion[cerca_a][]" /> Zona estudiantil</span><br/>'
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[cerca_a][]" value="universidades" /> Universidades</span><br/>'
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[cerca_a][]" value="centro_comerciales" /> Centro comerciales</span><br/>'	
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[cerca_a][]" value="medios_transporte" /> Medios de transporte </span><br/>'
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[cerca_a][]" value="sector_financiero" /> Sector financiero</span><br/>'
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[cerca_a][]" value="zonas_recreativas" /> Zonas recreativas</span><br/>'
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[cerca_a][]" value="fuera_de_ciudad" /> Fuera de la ciudad</span><br/>'
		+'<span class="input-group-addon"><input type="checkbox" name="anfitrion[cerca_a][]" value="centro_ciudad" /> Centro de la ciudad</span>'
		+'</div>'
		+'<div class="form-group"><label for="fotos_anfitrion">Fotos de tu casa y tu ciudad</label><input type="file"' 
		+'onchange="handleFileSelect(this.files, this)" name="fotos_anfitrion[]" multiple /><output class="list"></output></div>'
		+'</div>';
		



		if(value == 'viajero') {

			if($('.viajero').length){


				$('.viajero').remove();

			}

			$(this).parent().append(viajero);

			if($('.anfitrion').length){


				$('.anfitrion').remove();

			}


		}
		if(value == 'anfitrion') {


			if($('.anfitrion').length){


				$('.anfitrion').remove();

			}


			$(this).parent().append(anfitrion);	

			if($('.viajero').length){


				$('.viajero').remove();

			}			


		}
		if(value == 'anfitrion/viajero'){

			if($('.anfitrion').length){


				$('.anfitrion').remove();

			}	

			if($('.viajero').length){


				$('.viajero').remove();

			}	


			$(this).parent().append(viajero+anfitrion);	

		}


		});


		$('.file').change(function(){

			var rut = $(this).parent().children('img');		

			readURL(this, rut);	


		});

		

		function handleFileSelect(files, lo) {
	    // var files = evt.target.files; // FileList object
	    // console.log(files);
	    // Loop through the FileList and render image files as thumbnails.
	    	
	    $(lo).parent().children('.list').empty();

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
	          // document.getElementById('list').insertBefore(span, null);

	          $(lo).parent().children('.list').append(span);
	        };
	      })(f);

	      // Read in the image file as a data URL.
	      reader.readAsDataURL(f);
	    }
	  }

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
