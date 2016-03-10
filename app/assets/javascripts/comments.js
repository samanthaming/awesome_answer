$(document).on('page:change', function() {

  $('#answer-list').on('click','.show-comment-form' ,function(e){
    e.preventDefault();
    $('.comment-form').slideUp();
    $(this).parent().next().find('.comment-form').slideToggle();
  });

  $('#answer-list').on('click','.comment-form .comment-cancel-button',function(e) {
    e.preventDefault();
    $(this).closest('.comment-form').slideUp();
  });


});
