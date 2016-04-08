$(function() {

  var ER = /[^a-zA-Z0-9_.\/]/g; // Expressão regular que remove caracteres especiais exceto '.' e '_'

  var removerCaracteresEspeciais = function(stringComCaracteresEspeciais) {
    return stringComCaracteresEspeciais.replace(ER, '');
  }

  $('#username-input').keyup(function() {
    var username = $(this).val();
    username = removerCaracteresEspeciais(username);
    $(this).val(username.toLowerCase());
  });

  // $('.nav-tabs a:eq('+ gon.tab +')').tab('show').addClass('active');
  // $('#myTabs a[href="#profile"]').tab('show') // Select tab by name

});
