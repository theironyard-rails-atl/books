app.controller("reviewFormCtrl", function($scope) {
  $scope.rate = 0;
  $scope.max = 5;


  $scope.hoveringOver = function(value) {
    $scope.overStar = value;
//    $scope.percent = 100 * (value / $scope.max);
  };

});