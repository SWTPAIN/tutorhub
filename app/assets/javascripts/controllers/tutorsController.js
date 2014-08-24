
tutorhubControllers.controller('TutorListFeaturedController', ['$scope', 'Tutor',
  function($scope, Tutor) {
    Tutor.featuredTutors.success(function(data){
      $scope.tutors = data;
    });
  }]);

tutorhubControllers.controller('TutorListController', ['$scope', "Tutor",
  function($scope, Tutor) {
    Tutor.allTutors.query().success(function(data) {
      $scope.tutors = data
    });
  }]);
