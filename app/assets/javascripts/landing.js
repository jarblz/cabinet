$(document).on('turbolinks:load', function() {
  $(function () {
    var $nav = $("#primary_nav_wrap");
    $nav.toggleClass('landing-scrolled', $(this).scrollTop() > $nav.height());
    $(document).scroll(function () {
      var $nav = $("#primary_nav_wrap");
      $nav.toggleClass('landing-scrolled', $(this).scrollTop() > $nav.height());
    });
  });
})
