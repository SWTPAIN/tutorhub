'user strict'

tutorhubControllers.controller("SignupController", ['$scope', '$location', 'User',
  function($scope, $location, User){
    $scope.user = {};
    $scope.isTutor = true;
    $scope.education_levels = ["High School", "HD/ASSO", "Bachelor", "Master", "Phd"];
    $scope.subjectsTaught = [
      { name: "English", ticked: false },
      { name: "History", ticked: false },
      { name: "A Math", ticked: false },
      { name: "Chinese Language", ticked: false },
      { name: "Physic", ticked: false }
    ];

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

    angular.forEach( $scope.subjectsTaught, function( value, key ) {
      if ( value.ticked === true ) {
          /* do your stuff here */

      }
    });
  }]);
