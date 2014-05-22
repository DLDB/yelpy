$(document).ready(function(){

  $('.new_review').on('submit', function(event){
    event.preventDefault();
    var reviewList = $(this).siblings('ul');
    $.post($(this).attr('action'), $(this).serialize(), function(review){
      var newReview = Mustache.render($('#review_template').html(), review);
      reviewList.append(newReview);
    });
  })
})