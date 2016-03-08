$(document).on('page:change', function() {
  var $answerFormAction = $('#answer-form-action');

  //  If errors (which indicate user is creating an answer but failed)
  // then show the buttons. else show buttons only when clicks on form
  if($('.comment-form').find('.field_with_errors').length > 0){
    $(this).closest('.comment-form').show();
  }else{

  }

  $('.show-comment-form').on('click', function(e){
    e.preventDefault();
    $('.comment-form').slideUp();
    $(this).parent().next('.comment-form').slideDown();
  });

  $('.comment-form').find('.comment-cancel-button').on('click',function(e) {
    e.preventDefault();
    $(this).closest('.comment-form').slideUp();
  });
  //
  // // Show delete answer button, when hover on that line
  // $('#answer-list > li').on('mouseenter',function() {
  //   $(this).find('#delete-answer-button').fadeIn();
  // }).on('mouseleave',function() {
  //   $(this).find('#delete-answer-button').hide();
  // });

});
