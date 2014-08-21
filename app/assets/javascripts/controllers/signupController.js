'user strict'

tutorhubControllers.controller("SignupController", ['$scope', '$location', 'User',
    function($scope, $location, User){
      $scope.education_levels = ["High School", "HD/ASSO", "Bachelor", "Master", "Phd"] ;
      $scope.user = {};
      $scope.isTutor = true;

      User.currentUser().then(function(user){
        $scope.user = user;
      });

      $scope.signup = function () {
        User.singup($scope.user).then(
          function (user){
            $location.path("/");
          },
          function (err) {
            $scope.error = err;
          }
        );
      };

      $scope.toggleSignupForm = function () {
        $scope.isTutor = !$scope.isTutor;
      };

}]);
