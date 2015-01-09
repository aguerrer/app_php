<?php 


	namespace profile;

	require_once PATH."models/anfitrion.php";
	require_once PATH."models/viajero.php";	
	require_once PATH."models/user.php";	

	use \anfitrion\AnfitrionModel as a;
	use \db\Db as b;
	use \viajero\ViajeroModel as v;
	use \user\UserModel as u;

	Class ProfileModel extends b {



		protected static $table_name = 'perfil';


		public static function insert_user($array)
		{

			return u::save($array);


		}

		public static function insert_anfitrion($array) 
		
		{

			

			return a::save($array);


		}


		public static function insert_viajero($array) 
		
		{

	

			return v::save($array);


		}


		public static function get_profile($id)
		{

			$query = 'SELECT p.*, u.email, u.tipo FROM '.self::$table_name.' as p INNER JOIN usuario as u ON p.id_usuario=u.id 
		
			WHERE p.id='.$id.' ';

			$result = parent::__query($query);

			return $result;		


		}

		public static function get_viajero($id)
		{

			return v::find_by_attr(array('id_perfil' => $id));

		}

		public static function get_anfitrion($id)
		{
		
			return a::find_by_attr(array('id_perfil' => $id));

		}

		public static function update_user($array, $where)
		{

			return u::update($array, $where);

		}	

		public static function update_viajero($array, $where)
		{

			return v::update($array, $where);

		}


		public static function update_anfitrion($array, $where)
		{

			return a::update($array, $where);

		}

		

		

	}



 ?>