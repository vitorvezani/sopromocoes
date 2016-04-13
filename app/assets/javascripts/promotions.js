$(function() {

  imgLoaded = false;

  $('#img-url').blur(function() {
    //create image to preload:
    var imgPreload = new Image();
    $(imgPreload).attr({
        src: $('#img-url').val(),
        width: 350,
        height: 350,
    });

    //check if the image is already loaded (cached):
    if ((imgPreload.complete || imgPreload.readyState === 4) && !imgLoaded) {
      $('#load-img-here').append($(this));
      imgLoaded = true;
    } else {
        //go fetch the image:
      if(!imgLoaded){
        $(imgPreload).load(function (response, status, xhr) {
          if (status == 'error') {
          console.log('imagem não encontrada');
          } else {
            $('#load-img-here').append($(this));
            imgLoaded = true;
          }
        });
      }
    }
  });
});
