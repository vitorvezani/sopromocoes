// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require sweetalert
//= require alertifyjs
//= require bootstrap-datepicker
//= require_tree .

alertify.logPosition("top right");
alertify.closeLogOnClick(true)

// Custom alert

$.rails.allowAction = function(element){
    if( undefined === element.attr('data-confirm') ){
        return true;
    }

    $.rails.showConfirmDialog(element);
    return false;
};

$.rails.confirmed = function(element){
    element.removeAttr('data-confirm');
    element.trigger('click.rails');
};

$.rails.showConfirmDialog = function(element){
    var msg = element.data('confirm');
    alertify.confirm(msg, function(e){
        if(e){
            $.rails.confirmed(element);
        }
    })
};

// Datepicker Bootstrap
$.fn.datepicker.defaults.format = "dd/mm/yyyy";

// Utils
function changeClass(element, newClass, classToRemove) {
  element.addClass(newClass);
  element.removeClass(classToRemove);
}

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
