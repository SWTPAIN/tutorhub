
tutorhubControllers.controller('TutorListController', ['$scope', 'Tutors', function($scope, Tutors){
  $scope.tutors = Tutors;
}]);
