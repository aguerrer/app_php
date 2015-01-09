<?php $tipos_usuario = $params['tipos_usuario']; unset($params['tipos_usuario']);  ?>


<div class="admin">
	
<h1 class="title"><i class="fa fa-user"></i>Usuario</h1>

<form action="<?php  if(isset($params['action'])) :  echo $params['action']; unset($params['action']); else : echo URL.'admin/insert_user'; endif; ?>" method="POST">
	
	<?php echo isset($params['id']) ? '<input type="hidden" name="id" value="'.$params['id'].'"/>'  : ''; ?>


	<div class="form-group full">
		
		<label>Nombre Usuario</label>
		<input value="<?php echo isset($params['nombre_usuario']) ? $params['nombre_usuario'] : ''; ?>" type="text" placeholder="Nombre Usuario" name="nombre_usuario" required />
		

	</div>

	<div class="form-group full">
		
		<label>Nombre</label>
		<input value="<?php echo isset($params['nombre']) ? $params['nombre'] : ''; ?>" type="text" placeholder="Nombre Completo" name="nombre" required />
		

	</div>

	<div class="form-group full">
		
		<label>Email</label>
		<input value="<?php echo isset($params['email']) ? $params['email'] : ''; ?>" type="email" placeholder="Email" name="email" required />
		

	</div>

	<div class="form-group full">
		
		<label>Password</label>
		<input type="password" placeholder="Password" name="pass_usuario" <?php echo isset($params['pass_usuario']) ? '' : 'required'; ?> />
		

	</div>
	
	

	<div class="form-group full">
		
		<label>Estado</label>

		<select name="tipo" required>
				
			<?php 

				foreach($tipos_usuario as $tipo ) : 

				if(isset($params['tipo']) && $tipo == $params['tipo'] ) :

					$selected = 'selected';
				
				else :

					$selected = '';

				endif;	
		

				echo '<option '.$selected.' value="'.$tipo.'">'.$tipo.'</option>';
			
		 		endforeach; 

	 		?>
			
		</select>

	</div>

	



	<div class="form_group">
		
		<input type="submit" value="Enviar" />

	</div>


</form>
</div>	