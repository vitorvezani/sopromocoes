$(function(){
  $("#signin-form").submit(function (e) {
    var accepted = $('#terms-and-conditions').prop('checked');
    if(!accepted){
      sweetAlert('Oops...', "Você precisa aceitar os termos de condições para se cadastrar", 'error');
      e.preventDefault();
    }
  });
});
