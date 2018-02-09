$(this).scrollTop(0);
$('.alert').delay(5000).fadeOut()
$('[data-toggle="tooltip"]').tooltip()

$(document).click(function(e) {
  var target = $(e.target), article;
  if(target.hasClass('dropper')) {
    e.preventDefault();
    if($(target).parent().children('ul').hasClass('on')){
      $(target).parent().children('ul').removeClass('on')
    } else {
      hideAllDropdowns();
      $(target).parent().children('ul').addClass('on')
    }
  } else if(target.hasClass('dropdown-trigger')) {
    e.preventDefault();
    target.closest('.dropper').click()
    // TODO: catch any other elements that might be clicked inside the a tag
  } else if(target.hasClass('dropper-parent')) {
    e.preventDefault();
    target.children('.dropper').click()
  } else {
    hideAllDropdowns();
  }
});

function hideAllDropdowns(){
  $('#primary_nav_wrap ul').children('li').each(function(){
    $(this).children('ul').removeClass('on')
  })
}

$(document).on('turbolinks:load', function() {
  $('[data-toggle="tooltip"]').tooltip()

  var subNav = document.getElementById("secondaryFix");
  var main = document.getElementById("main");
  var nav = document.getElementById("primary_nav_wrap");

  if (subNav){
   var sticky = subNav.offsetTop;
  }
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

});
