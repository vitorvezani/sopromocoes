$(function() {
  $("#signin-form").submit(function (e) {
    var accepted = $('#terms-and-conditions').prop('checked');
    if(!accepted){
      sweetAlert('Oops...', "Você precisa aceitar os Termos e Condições para se registrar", 'error');
      e.preventDefault();
    }
  });
});
