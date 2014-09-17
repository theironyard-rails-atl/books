$(function() {
  // -- Reviews -----


//  $('.add-review').click(function() {
//    reviewForm.slideToggle();
//  });

//  reviewForm.submit(function(e) {
    // Alternative to returning `false`
//    e.preventDefault();

//    console.log('Serialized data is', reviewForm.serialize());

//    $.ajax('/books/' + id + '/review', {
//      type: 'POST',
//      data: reviewForm.serialize(),
//      success: function(review) {
//        $('.reviews').append( $('<div class="well"><div class="row"><div class="col-xs-2"><p>' + review.user.email + '</p></div><div class="col-xs-10"></div><strong>' + review.rating + '/ 5</strong><p>' + review.text + '</p></div></div>') );
//      },
//      error: function(e, text) {
//        console.log('Error was', e);
//        alert('AJAX error: ' + text);
//      }
//    });

//    reviewForm.slideToggle();
//  });


  // -- Recommendations -----
  var recModal = $('.recommendation-modal');
  $('.make-recommendation').click(function() {
    recModal.modal('show');
  });

  recModal.find('.submit').click(function() {
    recModal.modal('hide');

    $.ajax('/books/' + id + '/recommend', {
      type: 'POST',
      data: recModal.find('form').serialize(),
      success: function(recommendation) {
        console.log(recommendation);
        alert('Message sent to ' + recommendation.user.email);
      },
      error: function(e, text) {
        console.log('Error was', e);
        alert('AJAX error: ' + text);
      }
    });
  });
});
