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
//= require jquery.ui.all

//= require autocomplete-rails
//= require bootstrap.min
//= turbolinks_transitions
//= require turbolinks
//= require recurring_select
//= require_tree .




$(function(){

  $(".ui.selection.dropdown").dropdown();

  $('ul.events').each(function() {
    var $eventsList = $(this);
    var count=0;
    $eventsList.find("li").each(function(){
      if(++count == 3){
        $(this).parent().append("<li class='showLink'><a href='javascript:void(0);'>View more dates...</a></li>");
      }
      else if(count > 3){
        $(this).css("display","none");
        $(this).addClass("hiddenDate");
      }
    });
    $eventsList.find(".showLink").click(function(){
      $eventsList.find(".hiddenDate").toggle();
      $eventsList.find(".showLink a").text($eventsList.find(".showLink a").text()=="View more dates..."?"View more dates...":"View more dates...");
    });
  });

})
