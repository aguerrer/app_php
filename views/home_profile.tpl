
<?php if(isset($_SESSION['message'])) : echo $_SESSION['message']; unset($_SESSION['message']); endif; ?>

    <section id="img_home">
      <div class="logo_mundo_ilumno">
        <img src="<?php echo URL ?>assets/img/logo_mundo_ilumno.png" alt="">
      </div>
    </section>


    <section id="content1_home">
      <div class="segura">
        <div class="left">
          <div class="text1">
            Conviértete en 
          </div>
          <div class="text2">
            anfitrión <br>o viajero
          </div>
        </div>
        <div class="right">
          <div class="text1">
            Sé parte de Mundo Ilumno, la plataforma virtual de intercambio de alojamiento para estudiantes de las instituciones miembro de Ilumno.
          </div>
          <a href="<?php echo URL.'registrese'; ?>">
            <div class="text2">
              REGÍSTRATE
            </div>
          </a>  
        </div>
      </div>
    </section>
    <section id="content2_home">
      <div class="segura">
        <img src="<?php echo URL ?>assets/img/img_home.png" alt="">
        <div class="text1">
          ¿Qué debo hacer para pertenecer a 
          <span>
            Mundo Ilumno?
          </span>
        </div>
        <div class="text2">
          <div>
            Es muy fácil. Regístrate y completa tu perfil. A partir de ese momento podrás, a través de un sistema de búsqueda muy sencillo, planear tu viaje y/o contactar a las personas que quieran alojarse en tu residencia. 
  
          </div>          
        </div>
        <div class="text3">
          <strong>En Mundo Ilumno encontrarás noticias, guías y blogs.</strong> También podrás contar tus experiencias, publicar imágenes de tus viajes y nuevos amigos, y calificar a tus huéspedes y anfitriones. <br>
          <strong>Somos una comunidad estudiantil muy activa.</strong>
        </div>
      </div>  
    </section>