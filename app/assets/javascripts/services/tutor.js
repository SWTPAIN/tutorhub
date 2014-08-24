'use strict';

tutorhubServices.factory('Tutor', ['$resource', '$http',
  function($resource, $http){
    return {
      allTutors: $resource('tutors/:tutorId.json'),
      featuredTutors: $http.get('/featured_tutors.json')
    };
  }
]);
