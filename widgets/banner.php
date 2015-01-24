<div class="images_home">
	<div id="carousel-example-generic" class="carousel slide carousel-fade" data-ride="carousel">	
		<div class="carousel-inner" role="listbox">
			
			<?php 
    			$imgs = glob(PATH.'assets/img/banner/*.{jpg,png,gif}', GLOB_BRACE); 
    			$i = 1;
    		
    			foreach($imgs as $img) :

    				$active = ($i == 1) ? 'active' : '';

    				echo '<div class="item '.$active.'"><img src="'.URL.str_replace(PATH, '', $img).'" alt="" /></div>';
    				 	
    			$i++;
    			endforeach;	
			?>


		</div>
	</div>

</div>