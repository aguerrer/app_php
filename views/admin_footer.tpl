	<footer>
		
		<div>2014 © Color al Cuadrado. </div>
	

	</footer>




	<script type="text/javascript">
		
		$('.ico_menu').click(function(e){


			e.preventDefault();

			

			if($(this).hasClass( 'close-m' )) {

				$(this).removeClass('close-m').addClass('open-m');
				
				$('#sidebar').animate({left:'0'});
				$('#admincontent').animate({marginLeft:'210px'});


			}else {

				$(this).removeClass('open-m').addClass('close-m');
				
				$('#sidebar').animate({left:'-75%'});
				$('#admincontent').animate({marginLeft:'0'});

			}


			

		});	

		$('.user_icon').click(function(e){

			e.preventDefault();

			$('.user_interface').fadeToggle('slow');

		});


		$('.submenu > a').click(function(e){

			e.preventDefault();

			

			

			
			if($(this).parent().hasClass('open-submenu')) {

				$(this).children('.fa-plus').toggleClass('fa-minus' );
				$(this).parent().children('ul').fadeToggle('slow');		

			}else {

				$('#sidebar .submenu > ul').hide('fast');
				$('.open-submenu').removeClass('open-submenu');	
				$(this).parent().addClass('open-submenu');
				$('.submenu > a').children('.fa-minus').addClass('fa-plus' ).removeClass('fa-minus');
				$(this).children('.fa-plus').toggleClass('fa-minus' );
				$(this).parent().children('ul').fadeToggle('slow');		
				

			}

			

			
			

		});	
	

	</script>	
	
	<noscript></noscript>

	</body>

</html>