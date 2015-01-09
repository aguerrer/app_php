<?php

	namespace message;

	require_once PATH."models/profile.php";	
	
	use \profile\ProfileModel as p;
	use \db\Db as b;


	Class MessageModel extends b {



		protected static $table_name = 'mensaje';


		public static function get_new_message($id)
		{


			$query = 'SELECT COUNT(*) as count FROM '.self::$table_name.' WHERE  id_receptor='.$id.' AND estado_receptor="nuevo" ';


			$result = static::__query($query);

			return $result;		


		}

		public static function all_messages($id)
		{


		$query = 'SELECT mensaje.*, perfil.foto, perfil.nombre, perfil.apellido, perfil.id as id_perfil, peticion.id as id_peticion,
			  usuario.tipo	
			  FROM '.static::$table_name.'
		      LEFT JOIN perfil ON perfil.id= mensaje.id_remitente 
		      LEFT JOIN peticion ON 

		   	  mensaje.id_receptor = (CASE 

				WHEN peticion.id_receptor = '.$id.' THEN peticion.id_receptor ELSE peticion.id_remitente

	   	  	  END) AND 
			  mensaje.id_remitente = (CASE 

				WHEN peticion.id_receptor = '.$id.' THEN peticion.id_remitente ELSE peticion.id_receptor

	   	  	  END)	





		      INNER JOIN usuario ON perfil.id_usuario= usuario.id
		      WHERE  mensaje.id_receptor = '.$id.' 
		      UNION SELECT mensaje.*, perfil.foto, perfil.nombre, perfil.apellido, perfil.id as id_perfil, peticion.id as id_peticion,
		      usuario.tipo	
		      FROM '.static::$table_name.' 
		      LEFT JOIN perfil ON perfil.id= mensaje.id_receptor 
		      LEFT JOIN peticion ON 
		      
			  mensaje.id_receptor = (CASE 

				WHEN peticion.id_remitente = '.$id.' THEN peticion.id_receptor ELSE peticion.id_remitente

	   	  	  END) AND 
			  mensaje.id_remitente = (CASE 

				WHEN peticion.id_remitente = '.$id.' THEN peticion.id_remitente ELSE peticion.id_receptor

	   	  	  END)



		      INNER JOIN usuario ON perfil.id_usuario= usuario.id
		      WHERE mensaje.id_remitente = '.$id.'
		      ORDER BY ultima_fecha DESC';



		
			$result = static::__query($query);

			return $result;		

		}
		
		public static function data_msg($id_rem, $id_rec)
		{


			$query = 'SELECT id, nombre, apellido, foto FROM perfil WHERE  id= '.$id_rem.' UNION SELECT id, nombre, apellido, foto FROM perfil WHERE id='.$id_rec.' ';

			$result = static::__query($query);

			return $result;		


		}

		public static function profile_receptor($id)
		{


			return p::find_by_attr(array('id'=> $id), $res = 'id, nombre, apellido, foto');	

		}


		public static function message_exist($id_rem, $id_rec)
		{

			
			$query = 'SELECT * FROM '.static::$table_name.' WHERE  id_remitente= '.$id_rem.' AND id_receptor='.$id_rec.' OR 
			id_remitente= '.$id_rec.' AND id_receptor='.$id_rem.' ';

			
			$result = static::__query($query);

			return $result;					

		}

	}

?>