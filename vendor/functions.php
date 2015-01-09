<?php

	// Redirect function

	function url_redirect($url) 
	{	
		header("Location: {$url}");
		exit();
	}	

	function get_vars($array) {

		$i = 1;

		

		foreach($array as $k => $v) :

		
			if ($i % 2 == 0) :
 		 		
				$new_array[$array[$k-1]] = $array[$k];	

			endif;	

			$i++;

		endforeach;	


		return isset($new_array) ? $new_array : null;

	}

	function url($title)
	{

		// reemplaza cualquier cadena inválida por "-";
		$title = str_replace("&", "and", $title);
		$arrStupid = array('feat.', 'feat', '.com', '(tm)', ' ', '*', "'s", '"', ",", ":", ";", "@", "#", "(", ")", "?", "!", "_",
		"$","+", "=", "|", "'", '/', "~", "`s", "`", "\\", "^", "[","]","{", "}", "<", ">", "%", "&#8482;");

		$title = htmlentities($title);
		$title = preg_replace('/&([a-zA-Z])(.*?);/','$1',$title);
		$title = strtolower("$title");
		$title = str_replace(".", "", $title);
		$title = str_replace($arrStupid, "_", $title);
		$flag = 1;
		
		while($flag){
			$newtitle = str_replace("--","-",$title);
			if($title != $newtitle) {
				$flag = 1;
			}
			else $flag = 0;
				$title = $newtitle;
			}
			$len = strlen($title);
			if($title[$len-1] == "") {
				$title = substr($title, 0, $len-1);
			}
		
		return $title;	

	}

	function __title()
	{

		$url = $_SERVER['REQUEST_URI'];
		$url = is_null(LOCAL) ? $url : str_replace(LOCAL, "", $url);
		$array = explode('/', $url);
		$title = array_pop($array);

		if($url == '') : 

				$title = ucwords(SITENAME);

			elseif(is_numeric($title)) :

				$count = count($array);

				if($count > 1) :

					$title = ucwords(str_replace('_', ' ', $array[0]).' '.str_replace('_', ' ', $array[1]));	

				else :

					$title = ucwords(str_replace('_', ' ', $array[0]));
				
				endif;	

				

			elseif(!is_numeric($title)) :

			$title = ucwords(str_replace('_', ' ', $title));

		


		endif;	

		
		echo $title;


	}


			



	function __upload_file($path, $file, $multiple = false) {

		// Si es multiple

		if($multiple) :

			if (isset($file["name"]) && ($file["name"] <> '') ) :


			$file_count = count($file['name']);

	

				for ($i=0; $i < $file_count ; $i++) { 
					

					

					$name = $file['name'][$i]; 

					move_uploaded_file($file['tmp_name'][$i],  $path.$name);

					$images[] = $name; 

				}


				return $images;

				else : 

					return null;

			endif;	


		// Si es sencillo

		else :


			if (isset($file["name"]) && ($file["name"] <> '') ) :
				$file_name			    = $file["name"];
				$fileNameTemp 	        = $file["tmp_name"];
				$fileNameNew 	= $path . basename($file_name);

				
				if(move_uploaded_file($fileNameTemp,$fileNameNew)) :
					
					
					return $file_name;
					
				
				else :
					
					return null;	

				endif;
			
			else :
				
				return null;

			endif;	

		endif;	



	}

	function dias($init,$finish)
	{
	    //formateamos las fechas a segundos tipo 1374998435
	    $diferencia = strtotime($finish) - strtotime($init);
	 
	    //comprobamos el tiempo que ha pasado en segundos entre las dos fechas
	    //floor devuelve el número entero anterior, si es 5.7 devuelve 5
	    if($diferencia < 60){
	        $tiempo = floor($diferencia) . " segundos";
	    }else if($diferencia > 60 && $diferencia < 3600){
	        $tiempo = floor($diferencia/60) . " minutos'";
	    }else if($diferencia > 3600 && $diferencia < 86400){
	        $tiempo = floor($diferencia/3600) . " horas";
	    }else if($diferencia > 86400 && $diferencia < 2592000){
	        $dias   = floor($diferencia/86400);
	    }else if($diferencia > 2592000 && $diferencia < 31104000){
	        $tiempo = floor($diferencia/2592000) . " meses";
	    }else if($diferencia > 31104000){
	        $tiempo = floor($diferencia/31104000) . " años";
	    }else{
	        $tiempo = "Error";
	    }
	    return $dias;
	}

	
	function __content($url, $routes)
	{

		

        $url = is_null(LOCAL) ? $url : str_replace(LOCAL, "", $url);
		
        


		foreach($routes as $route => $route_val) :


			if(strpos($route,'$1')) :
				
				$route = explode("$1", $route);
				$route = $route[0];
		
			
				 // if(is_numeric(strpos(trim($url, '1'), $route)) and ($url != $route)) :
					
					if(strstr($url, substr($url, strlen($route), strlen($url)), true) === $route) :
					
					$url = str_replace($route, '', $url);


					$get_vars = explode("/", $url);

					$get_vars = get_vars($get_vars);

					$url = $route;
					

				endif;	


			endif;	
		

			if($url == $route) :

	

				switch (key($route_val)) {
					
					case 'view':
						
						$perms = next($route_val);	

						if($perms) :

							
							foreach($perms as $perm) :

								if(isset($_SESSION['user']) && $_SESSION['user']['tipo'] == $perm) :

									return isset($get_vars) ? __view($route_val['view'], $get_vars) : __view($route_val['view']);	

								endif;	

							endforeach;	

							return isset($_SESSION['user']) ? url_redirect(URL.'perm') : url_redirect(URL);

							else :	

						 return isset($get_vars) ? __view($route_val['view'], $get_vars) : __view($route_val['view']);

						endif;	

					break;

					case 'controller':

						$perms = next($route_val);	

						if($perms) :

							foreach($perms as $perm) :

								if(isset($_SESSION['user']) && $_SESSION['user']['tipo'] == $perm) :

									return isset($get_vars) ? __controller($route_val['controller'], $get_vars) : __controller($route_val['controller']);

								endif;	

							endforeach;	

							return isset($_SESSION['user']) ? url_redirect(URL.'perm') : url_redirect(URL);

							else :

							return isset($get_vars) ? __controller($route_val['controller'], $get_vars) : __controller($route_val['controller']);

						endif;	

						

					break;
					
				

				}

			


			endif;	


		endforeach;	



		 return require_once PATH.'views/404.tpl';


	}


	function __view($file, $params = null)
	{

		
		$url = explode(":", $file);



		if (file_exists(PATH.'views/'.$url[0].'.tpl') && file_exists(PATH.'views/'.$url[1].'.tpl')) :

			$content =  PATH.'views/'.$url[0].'.tpl';

			require_once PATH.'views/'.$url[1].'.tpl';



		elseif (file_exists(PATH.'views/'.$url[0].'.tpl') && $url[1] == 'no_layout') :

			require_once PATH.'views/'.$url[0].'.tpl';


			
		elseif (!file_exists(PATH.'views/'.$url[0].'.tpl') && !file_exists(PATH.'views/'.$url[1].'.tpl')) :	

			echo 'La vista no existe <br/>';	

		endif;	

		

	}



	function __controller($file, $params = null)
	{

		$url = explode(":", $file);

		if (file_exists(PATH.'controllers/'.$url[1].'.php')) :

			if (file_exists(PATH.'models/'.$url[1].'.php')) :

				require_once PATH.'models/'.$url[1].'.php';


			endif;	

		
			
			require_once PATH.'controllers/'.$url[1].'.php';

			$name = ucfirst($url[1]);

			$app = new $name();

			if(method_exists($app,$url[0])) :

				
			
				return is_null($params) ? $app->{$url[0]}() : $app->{$url[0]}($params);


				else :	

					echo 'este metdodo no existe';


			endif;
				


		else :

			echo 'el controlador no existe no existe <br/>';


		endif;	


	}


	function add_widget($name, $params = null)
	{




		if (file_exists(PATH.'widgets/'.$name.'.php')) :

			return require_once PATH.'widgets/'.$name.'.php';

		else :

			echo 'el widget no existe <br/>';


		endif;	

	}


?>