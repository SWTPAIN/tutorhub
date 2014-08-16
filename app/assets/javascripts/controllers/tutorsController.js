angular.module('controllers')
  .controller("TutorsController", ['$scope', 'Tutors', function($scope, Tutors){
    $scope.tutors = Tutors;
}])
