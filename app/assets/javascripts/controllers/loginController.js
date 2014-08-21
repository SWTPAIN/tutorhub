'user strict'
angular.module('controllers')
  .controller("LoginController", ['$scope', '$location', 'User',
    function($scope, $location, User){
      $scope.user = {};

      User.currentUser().then(function(user){
        $scope.user = user;
      });

      $scope.login = function () {
        User.login($scope.user).then(
          function (user){
            $location.path("/");
          },
          function (err) {
            $scope.error = err;
          }
        );
      };

}]);
