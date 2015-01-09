<?php 

	namespace application;

	require_once PATH."models/rate.php";	

	use \rate\RateModel as r;
	use \db\Db as b;

	Class ApplicationModel extends b 

	{

		protected static $table_name = 'peticion';	

		public static function get_applications($id)
		{

			$query = 'SELECT peticion.*, perfil.foto, perfil.nombre, perfil.apellido FROM '.static::$table_name.' 
			LEFT JOIN perfil ON perfil.id=peticion.id_receptor
			WHERE (peticion.id_receptor='.$id.' OR peticion.id_remitente='.$id.') AND (estado = "enviada" OR estado = "aceptado") GROUP BY estado';	

				

			$result = static::__query($query);

			return $result;		

		}

		public static function insert_rate($array)
		{

			return r::save($array);	

		}


		public static function get_new_application($id)
		{


			$query = 'SELECT COUNT(*) as count FROM '.self::$table_name.' WHERE  id_receptor='.$id.' AND estado="enviada" OR estado="aceptado" ';


			$result = static::__query($query);

			return $result;		
	

		}

	}	

 ?>