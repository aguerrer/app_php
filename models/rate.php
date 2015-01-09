<?php 

	namespace rate;

	use \db\Db as b;

	Class RateModel extends b 

	{

		protected static $table_name = 'calificacion';	

		public static function get_rate($id_receptor, $id_remitente)
		{

			$query = 'SELECT * FROM '.static::$table_name.' WHERE id_receptor='.$id_receptor.' AND id_remitente='.$id_remitente.' 
			OR	id_receptor='.$id_remitente.' AND id_remitente='.$id_receptor.'	';	

			$result = static::__query($query);

			return $result;		

		}


	}	

 ?>