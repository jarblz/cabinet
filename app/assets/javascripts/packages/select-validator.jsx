$(function(){
  appendRequiredFields();
  $('.form-errors').slideDown(400).delay(5000).animate({top: '60px',},{
      duration: 50,}).animate({top: '50px',},{
      duration: 50,}).slideUp(50);

  $('.limited').mouseup(function(){
    validateField($(this))
  });

  function validateField(field){
    if(field.prev('input:checked').length === 0 && tooManySelects(field)) {
      alert(`Oops! You are only allowed up to ${field.data('amount')} ${field.data('thing')}`);
      field.click();
    }
  }

  function tooManySelects(field){
    return (field.parent().children('input:checked').length >= field.data('amount'))
  }

    $('.alert').slideDown(400).delay(5000).animate({top: '60px',},{
      duration: 50,}).animate({top: '50px',},{
      duration: 50,}).slideUp(50);

  function appendRequiredFields(){
    $('.label-required').each(function(){
      $(this).prepend("<i class='sun icon'></i>")
    })
  }
})
