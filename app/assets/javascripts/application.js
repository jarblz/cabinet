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
//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
$(document).on('turbolinks:load', function(){
  $(this).scrollTop(0);

  var subNav = document.getElementById("secondaryFix");
  var main = document.getElementById("main");
  var nav = document.getElementById("primary_nav_wrap");

  var sticky = subNav.offsetTop;

  $('.alert').delay(5000).fadeOut()


  window.onscroll = function() {setupStickyNav()};


  function setupStickyNav() {
    if(subNav){
      pushNavBehind();
      if (window.pageYOffset >= sticky) {
        subNav.classList.add("sticky");
        main.classList.add("sticky");
      } else {
        subNav.classList.remove("sticky");
        main.classList.remove("sticky");
      }
    }
  }

  function pushNavBehind(){

    if (window.pageYOffset == 0) {
      primary_nav_wrap
      nav.classList.remove("sub-nav");
    } else {
      nav.classList.add("sub-nav");
      hideAllDropdowns();
    }
  }

  function hideAllDropdowns(){
    $('#primary_nav_wrap ul').children('li').each(function(){
      $(this).children('ul').removeClass('on')
    })
  }





})
