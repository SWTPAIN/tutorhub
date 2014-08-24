
tutorhubControllers.controller('TutorListFeaturedController', ['$scope', '$http',
  function($scope, $http){
    $http.get('/featured_tutors').success(function(data){
      $scope.tutors = data;
    });
  }]);
