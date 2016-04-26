$(function() {

  $('#img-url').blur(function() {
    //create image to preload:
    var imgPreload = new Image();
    $(imgPreload).attr({
        src: $('#img-url').val(),
        width: 350,
        height: 350,
    });

    //check if the image is already loaded (cached):
    if ((imgPreload.complete || imgPreload.readyState === 4) ) {
      $('#load-img-here').html(imgPreload);
    } else {
      //go fetch the image:
      $(imgPreload).load(function (response, status, xhr) {
        if (status == 'error') {
            var notFound = new Image();
            $(notFound).attr({
                src: "http://www.netocar.com.br/includes/tng/styles/img_not_found.gif",
                width: 350,
                height: 350,
            });
          $('#load-img-here').html(notFound);
        } else {
          $('#load-img-here').html(imgPreload);
        }
      });
    }
  });
});
