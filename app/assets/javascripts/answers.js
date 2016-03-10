// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// $(document).ready(function() {
$(document).on('page:change', function() {
  var $answerFormAction = $('#answer-form-action');

  //  If errors (which indicate user is creating an answer but failed)
  // then show the buttons. else show buttons only when clicks on form
  if($answerFormAction.find('.field_with_errors').length > 0){
    $answerFormAction.show();
  }else{
    $('#answer_body').on('click', function(){
      // console.log($answerFormAction);

      $answerFormAction.slideDown();
    });
  }

  $answerFormAction.find('#answer-cancel-button').on('click',function(e) {
    e.preventDefault();
    $answerFormAction.slideUp();
  });

  // Show delete answer button, when hover on that line
  $('#answer-list').on('mouseenter',"li", function() {
    $(this).find('#delete-answer-button').fadeIn();
  }).on('mouseleave',function() {
    $(this).find('#delete-answer-button').hide();
  });

});
