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
//= require turbolinks
//= require_tree .





$(document).ready(function() {
  $('.checkbox input[type=checkbox').click(function (){
    var current_record = $(this).parents('tr');
    $(current_record).children('.text').toggleClass('text_decor', 'text')
  });
  $('.deleteAction').hover( function (){
    $(this).css('opacity', '1');
  }, function (){
    $(this).css('opacity', '0.5');
  }
  ).click(function() {
    var current_record = $(this).parents('tr');
      $.ajax({
        url: '/records/' + $(current_record).attr('data-record_id'),
        type: 'POST',
        data: { _method: 'DELETE' },
        success: function() {
          $(current_record).fadeOut(200);
        }
      });
    });
});
