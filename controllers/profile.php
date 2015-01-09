<?php 


	use \profile\ProfileModel as p;

	Class Profile {

		
		private static $anfitrion_ofer         = array('1_habitacion' => '1 habitacion', '+1_habitacion' => '+1 habitacion', 'habitacion_bano_priv' => 'Habitacion con baño privado', 'habitacion_bano_comp' => 'Habitacion con baño compartido', 'habitacion_comp' => 'Habitacion compartida' );
		// private static $anfitrion_espacio_uso  = array('cocina' => 'Cocina', 'ropa_cama' => 'Ropa de cama', 'servicio_lavanderia' => 'Servicio de lavanderia', 'internet' => 'Internet', 'television' => 'Television');	
		// private static $anfitrion_cerca_a      = array('zona_estudiantil' => 'Zona estudiantil', 'universidades' => 'Universidades', 'centro_comerciales' => 'Centro comerciales', 'medios_transporte' => 'Medios de transporte', 'sector_financiero' => 'Sector financiero', 'zonas_recreativas' => 'Zonas recreativas', 'fuera_de_ciudad' => 'Fuera de la ciudad', 'centro_ciudad' => 'Centro de la ciudad');

		private static $viajero_prefe_anfi    = array('Con familia', 'Con amigos', 'Solo');

		// Insertar perfil 

		public static function insert_profile()
		{

			

			$user = array(

				'pass_usuario'    => sha1(md5($_POST['pass'])),
				'nombre'          => $_POST['nombre'].' '.$_POST['apellido'],
				'nombre_usuario'  => $_POST['email'],		
				'email'           => $_POST['email'],
				'tipo'            => $_POST['tipo']

			);

			unset($_POST['tipo']);	
			unset($_POST['pass']);	
			unset($_POST['email']);	

			foreach($_POST['idiomas'] as $idioma) :

				$idiomas[$idioma['nombre']] = $idioma['nivel'];
				
			endforeach;	
			 

			$_POST['idiomas'] = json_encode($idiomas, JSON_UNESCAPED_UNICODE);


			$id_usuario = p::insert_user($user);
			
			$_POST['id_usuario'] = $id_usuario['db']->insert_id;

			

			// Foto de perfil

			$path = PATH.'assets/upload/users/';
			
			$foto = __upload_file($path, $_FILES['foto']);
			
			if($foto != null) : $_POST['foto'] = $foto; endif;  	

			


			//  insercion de ambos tipos de perfiles

			if(isset($_POST['viajero']) &&  isset($_POST['anfitrion'])) :

					if(isset($_POST['anfitrion']['espacio_uso'])) : $_POST['anfitrion']['espacio_uso'] = json_encode($_POST['anfitrion']['espacio_uso']); endif;	
					if(isset($_POST['anfitrion']['cerca_a']))     : $_POST['anfitrion']['cerca_a']     = json_encode($_POST['anfitrion']['cerca_a']); endif;

					$viajero    = $_POST['viajero'];
					$anfitrion  = $_POST['anfitrion'];

					unset($_POST['viajero']);
					unset($_POST['anfitrion']);

					$profile = p::save($_POST);


					if (!file_exists($path.'anfitrion/'.$profile['db']->insert_id)) {
		    			mkdir($path.'anfitrion/'.$profile['db']->insert_id, 0777, true);
					}

				
					$fotos_anfitrion = __upload_file($path.'anfitrion/'.$profile['db']->insert_id.'/', $_FILES['fotos_anfitrion'], true);
					
					if($fotos_anfitrion != null) : $anfitrion['fotos_ciudad_casa'] = json_encode($fotos_anfitrion); endif; 


					
					$viajero['id_perfil']	= $profile['db']->insert_id;
					$anfitrion['id_perfil']	= $profile['db']->insert_id;

					p::insert_viajero($viajero);
					p::insert_anfitrion($anfitrion);	

					$_SESSION['message'] = '<div class="alert alert-success" role="alert">Usuario creado con exito (viajero/anfitrion)</div>';	

					$url = URL;
			 		url_redirect($url);	

			//  insercion solo viajero

			elseif(isset($_POST['viajero']) &&  !isset($_POST['anfitrion'])) :	



				$viajero = $_POST['viajero'];
				unset($_POST['viajero']);

				$profile = p::save($_POST);

				$viajero['id_perfil']	= $profile['db']->insert_id;
				
				p::insert_viajero($viajero);

				$_SESSION['message'] = '<div class="alert alert-success" role="alert">Usuario creado con exito (viajero)</div>';	

				$url = URL;
		 		url_redirect($url);	

			// insercion solo anfitrion 

			elseif(!isset($_POST['viajero']) &&  isset($_POST['anfitrion'])) :	

				if(isset($_POST['anfitrion']['espacio_uso'])) : $_POST['anfitrion']['espacio_uso'] = json_encode($_POST['anfitrion']['espacio_uso']); endif;	
				if(isset($_POST['anfitrion']['cerca_a']))     : $_POST['anfitrion']['cerca_a']     = json_encode($_POST['anfitrion']['cerca_a']); endif;


				$anfitrion = $_POST['anfitrion'];
				unset($_POST['anfitrion']);

				$profile = p::save($_POST);

				if (!file_exists($path.'anfitrion/'.$profile['db']->insert_id)) {
		    			mkdir($path.'anfitrion/'.$profile['db']->insert_id, 0777, true);
				}

				$fotos_anfitrion = __upload_file($path.'anfitrion/'.$profile['db']->insert_id.'/', $_FILES['fotos_anfitrion'], true);

				if($fotos_anfitrion != null) : $anfitrion['fotos_ciudad_casa'] = json_encode($fotos_anfitrion); endif;

				$anfitrion['id_perfil']	= $profile['db']->insert_id;
				
				p::insert_anfitrion($anfitrion);

				$_SESSION['message'] = '<div class="alert alert-success" role="alert">Usuario creado con exito (anfitrion)</div>';	

				$url = URL;
		 		url_redirect($url);	


			endif;


		}

		private static function get_anfitrion_data($anfitrion)
		
		{

			$anfitrion = $anfitrion[0];

				

			
			$anfitrion['espacio_ofer'] = self::$anfitrion_ofer [$anfitrion['espacio_ofer']];
			
	
			
			return $anfitrion;


		}


		private static function get_viajero_data($viajero)
		{

			$viajero = $viajero[0];

			
			$viajero['prefe_anfi']  = self::$viajero_prefe_anfi[(int)$viajero['prefe_anfi']-1];
	
			
			return $viajero;	

		}

		// Ver perfil

		public static function view_profile($array)
		{


			$profile = p::get_profile($array['id']);
			$profile = $profile[0];

			if($profile['tipo'] == 'anfitrion') :

				$profile['anfitrion'] = self::get_anfitrion_data(p::get_anfitrion($profile['id']));

			elseif($profile['tipo'] == 'viajero') :

				$profile['viajero'] = self::get_viajero_data(p::get_viajero($profile['id']));

			elseif($profile['tipo'] == 'anfitrion/viajero') :

				$profile['viajero'] = self::get_viajero_data(p::get_viajero($profile['id']));
				$profile['anfitrion'] = self::get_anfitrion_data(p::get_anfitrion($profile['id']));

			endif; 



			return __view('profile:layout', $profile);


		}

		public static function update_profile_form()
		{

			$tipo = $_SESSION['user']['tipo'];
			$id   = $_SESSION['user']['perfil']['id'];

			$profile = p::get_profile($id);
			$profile = $profile[0];

			if($tipo == 'anfitrion') :

				$profile['anfitrion'] = self::get_anfitrion_data(p::get_anfitrion($id));

			elseif($tipo == 'viajero') :

				$profile['viajero'] = self::get_viajero_data(p::get_viajero($id));

			elseif($tipo == 'anfitrion/viajero') :

				$profile['viajero'] = self::get_viajero_data(p::get_viajero($id));
				$profile['anfitrion'] = self::get_anfitrion_data(p::get_anfitrion($id));

			endif; 


			

			 return __view('update_profile:layout', $profile );

		}


		public static function update_profile()
		{
			
			$path = PATH.'assets/upload/users/';
			
			$user['nombre_usuario'] = $_POST['email'];
			$user['nombre']         = $_POST['nombre'].' '.$_POST['apellido'];
			if($_POST['pass'] != '') :  $user['pass_usuario'] = sha1(md5($_POST['pass']));  endif;

			$where_u = 'WHERE id='.$_POST['id_usuario'].' ';
			$update = p::update_user($user, $where_u);

			$_SESSION['user']['nombre_usuario'] = $_POST['email'];

			unset($_POST['email']);
			unset($_POST['pass']);
			unset($_POST['id_usuario']);

			
			if(!isset($_POST['foto'])):	
				$foto = __upload_file($path, $_FILES['foto']);
				if($foto != null) : $_POST['foto'] = $foto; endif;  
			endif;	

			foreach($_POST['idiomas'] as $idioma) :

				$idiomas[$idioma['nombre']] = $idioma['nivel'];
				
			endforeach;	
			 

			$_POST['idiomas'] = json_encode($idiomas, JSON_UNESCAPED_UNICODE);

			$where = 'WHERE id='.$_POST['id'].' ';
			p::update($_POST, $where);


			$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Datos basicos actualizados</div>';

			$url = URL;
	 		url_redirect($url);	

		}



		public static function update_viajero()
		{

			if(isset($_POST['dejar_viajero'])) :

				$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Perfil viajero deshabilitado </div>';

				$_SESSION['user']['tipo'] = 'anfitrion';

				p::update_user(array('tipo' => 'anfitrion'), ' WHERE id='.$_POST['id_usuario'].' ');

				$url = URL;
		 		url_redirect($url);


			endif;	


			foreach($_POST['idiomas'] as $idioma) :

				$idiomas[$idioma['nombre']] = $idioma['nivel'];
		
			endforeach;	


			$_POST['idiomas'] = json_encode($idiomas, JSON_UNESCAPED_UNICODE);
			unset($_POST['id_usuario']);
			unset($_POST['dejar_viajero']);
			
			$where = ' WHERE id_perfil='.$_POST['id_perfil'].' ';
			p::update_viajero($_POST, $where);


			$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Datos viajero actualizados</div>';

			$url = URL;
	 		url_redirect($url);

		}


		public static function update_anfitrion()
		{



			if(isset($_POST['espacio_uso'])) : $_POST['espacio_uso'] = json_encode($_POST['espacio_uso']); endif;	
			if(isset($_POST['cerca_a']))     : $_POST['cerca_a']     = json_encode($_POST['cerca_a']); endif;	

		
			if(isset($_POST['dejar_anfitrion'])) :

				$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Perfil anfitrion deshabilitado </div>';

				$_SESSION['user']['tipo'] = 'viajero';

				p::update_user(array('tipo' => 'viajero'), ' WHERE id='.$_POST['id_usuario'].' ');

				$url = URL;
		 		url_redirect($url);


			endif;	


			$path = PATH.'assets/upload/users/';

			if (isset($_POST['fotos']) && isset($_FILES['fotos'])) :
					
				$fotos_anfitrion = __upload_file($path.'anfitrion/'.$_POST['id_perfil'].'/', $_FILES['fotos'], true);
				// if($fotos_viajero != null) : $_POST['fotos'] = json_encode($fotos_viajero); endif;   
						
				$images = array_merge($_POST['fotos'], $fotos_anfitrion);
				$_POST['fotos_ciudad_casa'] = json_encode($images);
				// echo 'tiene las 2';
			
			
			elseif(isset($_POST['fotos']) && !isset($_FILES['fotos'])) : 
		
				$images = $_POST['fotos'];

				$_POST['fotos_ciudad_casa'] = json_encode($images);
				// echo 'tiene post';


			elseif(!isset($_POST['fotos']) && isset($_FILES['fotos'])) :

				$fotos_anfitrion = __upload_file($path.'anfitrion/'.$_POST['id_perfil'].'/', $_FILES['fotos'], true);

		
				$_POST['fotos_ciudad_casa'] = json_encode($fotos_anfitrion);
				// echo 'tiene files';

			elseif(!isset($_POST['fotos']) && !isset($_FILES['fotos'])) :

				
				$_POST['fotos_ciudad_casa'] = '[""]';	
				// echo 'no tiene nd';

			endif;

			unset($_POST['fotos']);
			unset($_POST['id_usuario']);
			unset($_POST['dejar_viajero']);
			
			$where = ' WHERE id_perfil='.$_POST['id_perfil'].' ';
			p::update_anfitrion($_POST, $where);


			$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Datos anfitrion actualizados</div>';

			$url = URL;
	 		url_redirect($url);


		}

		// Funcion verifica si tiene un perfil de viajero inactivo y lo activa sino lo envia al form

		public static function add_viajero()
		{
		


			$viajero = p::get_viajero($_SESSION['user']['perfil']['id']);

			

			if($viajero == false) : 


				return __view('viajero_form:layout');	

			else :

				$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Perfil viajero habilitado de nuevo </div>';

				$_SESSION['user']['tipo'] = 'anfitrion/viajero';

				p::update_user(array('tipo' => 'anfitrion/viajero'), ' WHERE id='.$_SESSION['user']['id'].' ');

				$url = URL;
		 		url_redirect($url);

			
			endif;	

		}

		// Funcion verifica si tiene un perfil de anfitrion inactivo y lo activa sino lo envia al form

		public static function add_anfitrion()
		{

			$anfitrion = p::get_anfitrion($_SESSION['user']['perfil']['id']);

			if($anfitrion == false) :

				return __view('anfitrion_form:layout');	

			else :

				$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Perfil anfitrion habilitado de nuevo </div>';

				$_SESSION['user']['tipo'] = 'anfitrion/viajero';

				p::update_user(array('tipo' => 'anfitrion/viajero'), ' WHERE id='.$_SESSION['user']['id'].' ');

				$url = URL;
		 		url_redirect($url);

			endif; 

		}


		public static function insert_viajero()
		{

			$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Perfil viajero actualizado </div>';

			$_SESSION['user']['tipo'] = 'anfitrion/viajero';

			p::update_user(array('tipo' => 'anfitrion/viajero'), ' WHERE id='.$_SESSION['user']['id'].' ');

			foreach($_POST['idiomas'] as $idioma) :

					$idiomas[$idioma['nombre']] = $idioma['nivel'];
				
			endforeach;	

			unset($_POST['idiomas']);
			 

			$_POST['idiomas'] = json_encode($idiomas, JSON_UNESCAPED_UNICODE);	
			p::insert_viajero($_POST);

			$url = URL;
	 		url_redirect($url);

		}

		public static function insert_anfitrion()
		{

			$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Perfil anfitrion actualizado </div>';

			$_SESSION['user']['tipo'] = 'anfitrion/viajero';

			p::update_user(array('tipo' => 'anfitrion/viajero'), ' WHERE id='.$_SESSION['user']['id'].' ');

			$path = PATH.'assets/upload/users/';

			if (!file_exists($path.'anfitrion/'.$_SESSION['user']['perfil']['id'])) {
    			mkdir($path.'anfitrion/'.$_SESSION['user']['perfil']['id'], 0777, true);
			}

			$fotos_anfitrion = __upload_file($path.'anfitrion/'.$_SESSION['user']['perfil']['id'].'/', $_FILES['fotos'], true);
					
			if($fotos_anfitrion != null) : $_POST['fotos_ciudad_casa'] = json_encode($fotos_anfitrion); endif;

			if(isset($_POST['espacio_uso'])) : $_POST['espacio_uso'] = json_encode($_POST['espacio_uso']); endif;	
			if(isset($_POST['cerca_a']))     : $_POST['cerca_a']     = json_encode($_POST['cerca_a']); endif;

			p::insert_anfitrion($_POST);



			$url = URL;
	 		url_redirect($url);


		}

		public static function search()
		{

		

			if(!empty($_POST)) :

			$select = 'perfil.id, perfil.nombre, perfil.sexo, perfil.apellido, perfil.edad, perfil.pais, perfil.ciudad, perfil.universidad, perfil.foto';
			$union  = 'INNER JOIN anfitrion ON perfil.id = anfitrion.id_perfil';	

			foreach ($_POST as $key => $value) :
				
				$array[str_replace('_', '.', $key)] = $value;

			endforeach;

		

			$results = p::find_by_attr($array, $select, $union);

			if($results == false ) :
				echo '<div class="alert alert-danger" role="alert">No hay resultados</div>';

				else : 

				echo '<div class="num_encontrados">'.count($results).' Anfitriones encontrados</div>';		

				
				foreach($results as $res) :
				
					$foto = ($res['foto'] != '') ? '<img src="'.URL.'assets/upload/users/'.$res['foto'].'" alt="Foto perfil" />' 
							: '<i class="fa fa-user"></i>';

					echo '<div class="perfil">
							<a class="foto" href="'.URL.'perfil/id/'.$res['id'].'">'.$foto.'</a>
							<a class="nombre" href="'.URL.'perfil/id/'.$res['id'].'">'.$res['nombre'].' '.$res['apellido'].'</a>
							<p> '.$res['edad'].' Años  - '.$res['sexo'].' </p>
							<p> <b>pais: </b> '.$res['pais'].'</p>
							<p> <b>Ciudad: </b> '.$res['ciudad'].'</p>
							<p> <b>Universidad: </b> '.$res['universidad'].'</p>
							</div>';	

				endforeach;	

			endif;
			else :

				echo '<div class="alert alert-danger" role="alert">Debe ingresar al menos un parametro de busqueda</div>';

			endif;		
		}

	}



 ?>