<?php 


	use \rate\RateModel as r;

	Class Rate 
	{


		public static function is_rate($array)
		{

			if(is_null($array['id']) or $array['id'] == '') :

				$url = URL;
 				url_redirect($url);


			endif;	

			// id_receptor y id_remitente
			$is_rate = r::get_rate($array['id'], $_SESSION['user']['perfil']['id']);


			return  __view('calificar:layout', $is_rate);	


		}


		public static function qualify()
		{

		

			

				r::update($_POST, ' WHERE id= '.$_POST['id'].' ');
				
				$_SESSION['message'] = '<div class="alert alert-success" role="alert">
				 Calificado </div>';

				$url = URL;
 				url_redirect($url);

		}


	}



 ?>