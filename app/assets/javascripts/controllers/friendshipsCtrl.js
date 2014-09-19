app.controller("FriendshipsCtrl", function([$scope, $ngResource]) {
  $scope.tabs = [
    { title: "Current Friends", content: "Friends Listing" },
    { title: "Friend Requests", content: "Pending Friend Requests" },
    { title: "Users", content: "Discover Friends!" }
  ];

});
