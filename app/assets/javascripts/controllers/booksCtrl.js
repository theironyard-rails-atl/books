app.controller("booksCtrl", function($scope, $http, $location) {
  $scope.bookData = [];
  $scope.booksIndex = function() {
    $http({
      url: $location.absUrl() + ".json",
      method: "GET"
    }).success(function(data, status, headers, config) {
      $scope.bookData = data;
      console.log(data);
    }).error(function(data, status, headers, config) {
      console.log("Couldn't get index data");
    });
  };
  $scope.bookImage = function(book) {
    return book.image_url || '/assets/book_placeholder.png'
  };
});