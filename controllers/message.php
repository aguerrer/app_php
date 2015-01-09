<?php 

		
	use \message\MessageModel as m;


	Class Message 
	
	{



		public static function all_messages()
		{

			$all_messages = m::all_messages($_SESSION['user']['perfil']['id']);

		
			return __view('mensajes:layout', $all_messages);

		}


		public static function create_message($array)
		{

			// Validacion para que no se pueda enviar mensajes a si mismo 

			if($array['id'] == $_SESSION['user']['perfil']['id']) : 

				$url = URL;
		 		url_redirect($url);	

		 		else : 
		 		
	 			// Datos (remitente, receptor) 

		 		$data_msg = m::data_msg($_SESSION['user']['perfil']['id'], $array['id']);		

		 		$array['data_msg'] = $data_msg;

		 	    return __view('create_message_form:layout', $array);


			endif;	



		}



		public static function new_message()
		{

			$exist = m::message_exist($_POST['id_remitente'], $_POST['id_receptor']);

		

			if(!$exist) :

			$mensaje_remitente[0]['fecha']   = $_POST['fecha'];
			$mensaje_remitente[0]['msg']     = $_POST['msg'];
			$mensaje_remitente[0]['user_id'] = $_POST['user_id'];
			
			
			$_POST['estado_remitente']   = 'enviado';

			
			$mensaje_receptor = $mensaje_remitente;

			


			$_POST['estado_receptor'] = 'nuevo';
			$mensaje_remitente = json_encode($mensaje_remitente, JSON_UNESCAPED_UNICODE);
			$mensaje_receptor  = json_encode($mensaje_receptor, JSON_UNESCAPED_UNICODE);

			unset($_POST['msg']);	
			unset($_POST['fecha']);	
			unset($_POST['user_id']);	

			$_POST['mensajes_remitente'] = $mensaje_remitente;
			$_POST['mensajes_receptor']  = $mensaje_receptor;

			$save = m::save($_POST);


			$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Mensaje enviado</div>';

			$url = URL;
	 		url_redirect($url);			

			else : 

			
				
				$_POST['id'] = $exist[0]['id'];

				$_POST['mensajes_remitente'] = $exist[0]['mensajes_remitente'];
				$_POST['mensajes_receptor']  = $exist[0]['mensajes_receptor'];

				static::add_last_message($_POST);


				$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Mensaje enviado</div>';

				$url = URL;
		 		url_redirect($url);		


			endif;

		}

		public static function read_message()
		{


			if($_POST['rec'] == $_SESSION['user']['perfil']['id']) :

			$where = ' WHERE id= '.$_POST['id'].' ';

			$update = m::update(array('estado_remitente' => 'leido', 'estado_receptor' => 'leido'), $where);

			else :

				// echo 'Usted es el remitente';	

			endif;

			// echo 'Mensaje leido';

		}

		protected static function add_last_message($array)
		{

			$perfil = $_SESSION['user']['perfil']; 	

			

			$mensaje = json_decode($array['mensajes_remitente']);
	
		
			$count_msg = count($mensaje);
			$mensaje = (array) $mensaje;

	

			@$mensaje[$count_msg]->user_id = $perfil['id'];
			$mensaje[$count_msg]->fecha   = $array['fecha'];
			$mensaje[$count_msg]->msg   = $array['msg'];


			$array['mensajes_remitente'] = json_encode($mensaje, JSON_UNESCAPED_UNICODE);	
			$array['mensajes_receptor'] = json_encode($mensaje, JSON_UNESCAPED_UNICODE);	


			unset($array['user_id']);
			unset($array['fecha']);
			unset($array['msg']);

			$array['estado_receptor']  = 'nuevo'; 
			$array['estado_remitente'] = 'enviado'; 


			$where = 'WHERE id='.$array['id'].' ';	

			$update = m::update($array, $where);

	


		}


		public static function update_message()
		{


			
			$perfil = $_SESSION['user']['perfil']; 	
		

			// if($perfil['id'] == $_POST['id_remitente']) :

			// 	// $mensaje = json_decode($last_message[0]['mensajes_remitente']);
				

			// 	$nombre_remitente = $perfil['nombre'].'   '.$perfil['apellido'];
			// 	$id_remitente = $perfil['id'];
			// 	$imagen_remitente = ($perfil['foto'] == '') ? 
			// 		'<a href="'.URL.'perfil/'.$id_remitente.'" ><i class="fa fa-user"></i>'.$nombre_remitente.'</a>' :
			// 		'<a href="'.URL.'perfil/'.$id_remitente.'" ><img alt="foto" src="'.URL.'assets/upload/users/'.$perfil['foto'].'" />
			// 		'.$nombre_remitente.'</a>';
					


				
			// 	$receptor = m::profile_receptor($_POST['id_receptor']);
			// 	$receptor = $receptor[0];

			// 	$nombre_receptor = $receptor['nombre'].'   '.$receptor['apellido'];
			// 	$id_receptor = $receptor['id'];
			// 	$imagen_receptor = ($receptor['foto'] == '') ? 
			// 		'<a href="'.URL.'perfil/'.$id_receptor.'" ><i class="fa fa-user"></i>'.$nombre_receptor.'</a>' :
			// 		'<a href="'.URL.'perfil/'.$id_receptor.'" ><img alt="foto" src="'.URL.'assets/upload/users/'.$receptor['foto'].'" />
			// 		'.$nombre_receptor.'</a>';
	


			// else :
			
			// 	// $mensaje =  json_decode($last_message[0]['mensajes_receptor']);

			// 	$nombre_receptor = $perfil['nombre'].'   '.$perfil['apellido'];
			// 	$id_receptor = $perfil['id'];
			// 	$imagen_receptor = ($perfil['foto'] == '') ? 
			// 		'<a href="'.URL.'perfil/'.$id_receptor.'" ><i class="fa fa-user"></i>'.$nombre_receptor.'</a>' :
			// 		'<a href="'.URL.'perfil/'.$id_receptor.'" ><img alt="foto" src="'.URL.'assets/upload/users/'.$perfil['foto'].'" />
			// 		'.$nombre_receptor.'</a>';
					


				
			// 	$remitente = m::profile_receptor($_POST['id_remitente']);
			// 	$remitente = $remitente[0];

			// 	$nombre_remitente = $remitente['nombre'].'   '.$remitente['apellido'];
			// 	$id_remitente = $remitente['id'];
			// 	$imagen_remitente = ($remitente['foto'] == '') ? 
			// 		'<a href="'.URL.'perfil/'.$id_remitente.'" ><i class="fa fa-user"></i>'.$nombre_remitente.'</a>' :
			// 		'<a href="'.URL.'perfil/'.$id_remitente.'" ><img alt="foto" src="'.URL.'assets/upload/users/'.$remitente['foto'].'" />
			// 		'.$nombre_remitente.'</a>';

			// endif;	

			$last_message = m::find_by_attr(array('id' => $_POST['id']));		

			$_POST['mensajes_remitente'] = $last_message[0]['mensajes_remitente'];
			$_POST['mensajes_receptor']  = $last_message[0]['mensajes_receptor'];

			static::add_last_message($_POST);

			$last_message = m::find_by_attr(array('id' => $_POST['id']));	

			$mensaje = json_decode($last_message[0]['mensajes_remitente']);
			

			$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Mensaje enviado</div>';

			$url = URL;
	 		url_redirect($url);		
			
		

			// $html = '<ul>';
			
			// foreach($mensaje as $k => $msg) :

			// 	$msg = (array) $msg;

			// 		$html .= '<li>';

			// 		$html .= ($id_remitente == $msg['user_id']) ? $imagen_remitente : $imagen_receptor;	
			// 		$html .= '<span class="fecha">'.$msg['fecha'].'</span>';	
			// 		$html .= '<div class="msg_text">'.$msg['msg'].'</div>';	

			// 		$html .= '</li>';


			// 	$html .= '';

			// endforeach;	

			// $html .= '</ul>'; 
			
			// echo $html;
			
		}



	}



 ?>