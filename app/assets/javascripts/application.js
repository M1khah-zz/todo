// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .

$(document).ready(function() {

  $(".container-app").on("mouseover", ".task", function() {
      $(this).children(".control-task").css("display", "inline-block");
    }).on("mouseout", ".task", function() {
      $(this).children(".control-task").css("display", "none");
    });

  $(".container-app").on("mouseover", ".list-header", function() {
      $(this).children(".edit-list").css("display", "inline-block");
    }).on("mouseout", ".list-header", function() {
      $(this).children(".edit-list").css("display", "none");
    });

  $('.task-list').sortable({
    axis: 'y',
    update: function(){
      $.post('tasks/sort', $(this).sortable('serialize'));
    }
  });


  $(".task-check").on('change', function(){
    var $this = $(this);
    $.ajax({
        url: '/tasks/'+ $this.val() +'/done',
        type: 'POST',
        data: {"done": $this.is(':checked') }
    });
    $this.parent().find('p').toggleClass('done');
});

});
