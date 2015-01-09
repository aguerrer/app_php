

<?php 

if(isset($_SESSION['user'])){?>

<div class="session">
	<div class="nombre"><?php echo $_SESSION['user']['nombre'];?></div>
	<a href="<?php echo URL.'peticiones' ?>">
		<div class="peticiones">
			<?php add_widget('peticiones'); ?>
			<img src="<?php echo URL ?>assets/img/peticiones.png" alt="">
		</div>
	</a>
	<a href="<?php echo URL.'mensajes' ?>">	
		<div class="mensajes">
			<?php add_widget('mensajes'); ?>
			<img src="<?php echo URL ?>assets/img/mensajes.png" alt="">
		</div>
	</a>	
	<div class="content_foto">
		<div class="foto">
			<?php  if($_SESSION['user']['perfil']['foto']==""){echo '<i class="fa fa-user"></i>';}else{echo '<img src="'.URL.'assets/upload/users/'.$_SESSION['user']['perfil']['foto'].'" alt="">';}?>
		</div>
		<div class="option_sesion">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				<img src="<?php echo URL ?>assets/img/flecha.png" alt="">
			</a>
			<ul class="dropdown-menu" role="menu">
		        <li><a href="<?php echo URL.'modificar_perfil'; ?>">Modificar perfil</a></li>
		        <li><a href="<?php echo URL.'logout'; ?>">Cerrar seccion</a></li>
		     </ul>
		</div>
	</div>
</div>


<?php }else{ ?>
	
	<div class="no-login">
		<a href="<?php echo URL.'registrese'; ?>">
			<div>
				Registro
			</div>
		</a>
		<a href="#">
			<div class="selected">
				Log in
			</div>
		</a>
	</div>
	
<form action="<?php echo URL.'login' ?>" method="post">
	<div class="content_login">
		<div class="titulo">Iniciar sesión</div>
		<div class="user"><input class="form-control" type="email" name="nombre_usuario" placeholder="Email" /></div>
		<div class="pass"><input class="form-control" type="password" name="pass_usuario" placeholder="Contraseña" /></div>
		<div class="olvide_pass">Olvidé mi <a href="">contraseña</a></div>
		<div class="submit"><input type="submit" value="INGRESA" class="btn btn-primary"/></div>
	</div>
</form>
<?php }?>