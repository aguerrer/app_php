$(".selected").click(function(){

	$(".content_login").slideToggle('fast');

});


$(window).scroll(function(){
    if ($(this).scrollTop() > 0) {
        $('.boton-top').fadeIn();
    } else {
        $('.boton-top').fadeOut();
    }
});

$(".boton-top").click(function(){
	 $("html, body").delay(500).animate({scrollTop: $('header').offset().top }, 1000);

        

});

