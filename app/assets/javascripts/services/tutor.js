'use strict';

tutorhubServices.factory('Tutor', ['$resource',
  function($resource){
    return $resource('tutors/:tutorId.json') ;
  }
]);
