
tutorhubControllers.controller('TutorListFeaturedController', ['$scope', 'Tutor',
  function($scope, Tutor){
  // $scope.tutors = [{name: "alice", qualification: "HKU"}];
    $scope.tutors = Tutor.query();
}]);
