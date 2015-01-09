<?php 

	use \user\UserModel as u;


	Class User {


		public static $tipos_usuario = array(

			'admin',
			'viajero',
			'anfitrion',
			'anfitrion/viajero'

		);


		public static function logout()
		
		{


			session_destroy();
			url_redirect(URL);

		}


		public static function login()
		
		{

			
			$login = u::authenticate_user($_POST['nombre_usuario'],sha1(md5($_POST['pass_usuario'])));
		


			if($login == false) :

				$_SESSION['message'] = '<div  class = "alerta alerta de peligro"  role = "alerta" > Datos erroneos </ div>';	
				
				url_redirect(URL);

				elseif($login[0]['tipo'] == 'admin') : 

					url_redirect(URL.'admin'); 

				
				elseif($login[0]['tipo'] != 'admin') : 

				  $it = u::get_profile($login[0]['id']);

				  $_SESSION['user']['perfil'] = $it[0]; 	
				

				  url_redirect(URL.'perfil/id/'.$it[0]['id']);

				else :
					
				

			endif; 

			

		}

		public static function all_users()
		{

			$users = u::find_all();
			

			__view('admin_users:admin_layout', $users);	


		}

		public static function add_user_form()
		{

			$user['tipos_usuario'] = static::$tipos_usuario;
			__view('admin_user:admin_layout', $user);	

		} 

		public static function insert_user()
		{

			$_POST['pass_usuario'] = md5($_POST['pass_usuario']);	

			
			if(u::save($_POST)) :

				$url = URL."admin/lines";
				url_redirect($url);

			endif;


		}


		public static function update_user($array)
		{

		


			 $user = u::find_id($array['id']);

			 if($user) :
			 	
			 	$user = $user[0];	
			 	$user['action'] = URL.'admin/update_by_user';
			 	$user['tipos_usuario'] = static::$tipos_usuario;


			 	else :


			 	url_redirect(URL.'admin/user');	


			 endif;

			__view('admin_user:admin_layout', $user);
		
		

		


	}


	public static function update_by_user ()
		
	{

			
			if(isset($_POST['pass_usuario']) && $_POST['pass_usuario'] != '') : 

				$_POST['pass_usuario'] = md5($_POST['pass_usuario']); 


				else : 


				unset($_POST['pass_usuario']);	

			endif;
	

		


			if(isset($_POST['id']) && u::update($_POST, ' WHERE id = '.$_POST['id'].' ')) :

				$url = URL."admin/users";
				url_redirect($url);

			endif;


	}

	public static function delete_line()
	{




		if( isset($_POST['id']) &&  u::delete_by_id($_POST['id'])) :

			
			echo 'Usuario eliminado';

		endif;


	}


}


?>