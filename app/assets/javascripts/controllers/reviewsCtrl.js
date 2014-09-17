app.controller("reviewsCtrl", function($scope, Pusher) {
  //  Pusher stuff
  console.log('book_' + gon.book_id);
  Pusher.subscribe('reviews', 'book_' + gon.book_id, function(review) {
    $('.reviews').append( $('<div class="well"><div class="row"><div class="col-xs-2"><p>' + review.email + '</p></div><div class="col-xs-10"></div><strong>' + review.rating + '/ 5</strong><p>' + review.text + '</p></div></div>') );
  });

});



