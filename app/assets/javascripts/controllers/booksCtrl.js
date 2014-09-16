app.controller("booksCtrl", function($scope, $http, $location) {
  $scope.bookData = [];
  $scope.showingBooks = [];
  $scope.indexBooksShowing = 5;
  $scope.booksIndex = function() {
    $http({
      url: $location.absUrl() + ".json",
      method: "GET"
    }).success(function(data, status, headers, config) {
      $scope.bookData = data.books;
      $scope.showingBooks = $scope.bookData.slice(0, $scope.indexBooksShowing);
      console.log($scope.showingBooks);
    }).error(function(data, status, headers, config) {
      console.log("Couldn't get index data");
    });
  };
  $scope.bookImage = function(book) {
    return book.image_url || '/assets/book_placeholder.png'
  };

  $scope.loadMore = function() {
    console.log("ScrollMore");
    if ($scope.showingBooks.length < $scope.bookData.length) {
      var next = $scope.showingBooks.length;
      console.log("Next is ", next);
      var booksToAdd = $scope.bookData.slice(next, next + 1);
      console.log("Books to add", booksToAdd);
      $scope.showingBooks = $scope.showingBooks.concat(booksToAdd);
      console.log($scope.showingBooks);
    }
  };
});