<?php 


	use \application\ApplicationModel as a;

	Class Application
	{


		public static function send_application()
		{

	

			$is_app = a::find_by_attr(array('id_remitente' => $_POST['id_remitente'], 'id_receptor' => $_POST['id_receptor']), '*', '',

			'AND fecha_llegada BETWEEN "'.$_POST['fecha_llegada'].'" AND "'.$_POST['fecha_salida'].'" ');
			
			
				 if($is_app == false) :

					$application = $_POST;
					$application['estado'] = 'enviada';

					a::save($application);

					$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Peticion enviada con exito </div>';

					$url = URL;
		 			url_redirect($url);


		 		 	else : 

		 			$_SESSION['message'] = '<div class="alert alert-success" role="alert"> Ya hay una peticion realizada para estas fechas </div>';

					$url = URL;
		 			url_redirect($url);	

		 		endif;		

			


		}

		public static function get_applications()
		{

			$applications = a::get_applications($_SESSION['user']['perfil']['id']);

			if($applications != false) :	

				foreach ($applications as $value) :
					
					$app[$value['estado']][] = $value;

				endforeach;

				else : 

				$app = false;		

			endif;	

			return __view('peticiones:layout', $app);

		}




		public static function stay_confirmation($array)
		{

			if(is_null($array['id']) or $array['id'] == '' AND is_null($array['estado']) or $array['estado'] == '') :

			$url = URL;
 			url_redirect($url);

			endif;	

			$is_app = a::find_by_attr(array('id' => $array['id']));

			if($is_app[0]['estado'] == 'aceptado') :

					a::update(array('estado' => $array['estado']), ' WHERE id= '.$array['id'].' ');
					
					a::insert_rate(array('id_remitente' => $is_app[0]['id_remitente'], 'id_receptor' => $is_app[0]['id_receptor']));


					$_SESSION['message'] = '<div class="alert alert-success" role="alert">
					 Estadia aceptada </div>';
					 $url = URL.'calificar_form/id/'.$is_app[0]['id_remitente'];
					 url_redirect($url);
				

		 			else :

		 			$_SESSION['message'] = '<div class="alert alert-danger" role="alert">Esta solicitud no fue aceptada</div>';	
		 			$url = URL;
					url_redirect($url);


				endif;


		}

		public static function application_confirmation($array)
		{

			if(is_null($array['id']) or $array['id'] == '' AND is_null($array['estado']) or $array['estado'] == '') :

			$url = URL;
 			url_redirect($url);

			endif;	

			
				
			$is_app = a::find_by_attr(array('id' => $array['id']));

				
				if($is_app[0]['estado'] == 'enviada') :

					a::update(array('estado' => $array['estado']), ' WHERE id= '.$array['id'].' ');
					



					$_SESSION['message'] = '<div class="alert alert-success" role="alert">
					 Peticion actualizada </div>';
					 $url = URL;
					 url_redirect($url);
				

		 			else :

		 			$_SESSION['message'] = '<div class="alert alert-danger" role="alert">Esta peticion ya no esta en espera de confirmacion</div>';	
		 			$url = URL;
					url_redirect($url);


				endif;

				

		}



		

	}

 ?>
