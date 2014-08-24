
tutorhubControllers.controller('TutorListFeaturedController', ['$scope', '$http',
  function($scope, $http){
    $http.get('/featured_tutors.json').success(function(data){
      $scope.tutors = data;
    });
  }]);
