'user strict'

tutorhubControllers.controller("SignupController", ['$scope', '$location', 'User',
  function($scope, $location, User){
    $scope.education_levels = ["High School", "HD/ASSO", "Bachelor", "Master", "Phd"];
    $scope.user = {};
    $scope.isTutor = true;


    User.currentUser().then(function(user){
      $scope.user = user;
    });

  $scope.setAs = function(role) {
    if (role == "Tutor") {
      $scope.isTutor = true;
      $scope.isEmployer = false;
    } else if (role == "Employer") {
      $scope.isTutor = false;
      $scope.isEmployer = true;
    };
  };

  $scope.signup = function () {
    User.singup($scope.user).then(
      function (user){
        $location.path("/");
      },
      function (error) {
        $scope.error = error;
      }
    );
  };
}]);
