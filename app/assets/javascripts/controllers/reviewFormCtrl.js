app.controller("reviewFormCtrl", function($scope, $http) {
  $scope.reviewForm = {
    rating: 0,
    reviewText: ""
  };
  $scope.max = 5;
  $scope.id = $('.add-review-form').data('id');


  $scope.hoveringOver = function(value) {
    $scope.overStar = value;
  };

  $scope.submitForm = function(isValid) {
    if(isValid) {
      $http({
        method : "POST",
        url    : '/books/' + gon.book_id + '/review',
        data   : {review: $scope.reviewForm}
      }).success(function(data) {
        console.log(data)
      });
    }
  }



});