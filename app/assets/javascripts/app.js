(function(){

  var Tutorhub = angular.module('Tutorhub', [
    'controllers',
    'services',
    'templates',
    'ngRoute'
  ]);

  Tutorhub.config(['$routeProvider', function($routeProvider){
    $routeProvider
      .when('/', {
        templateUrl: 'index.html',
        controller: 'TutorsController'
      })
      .when('/login', {
        templateUrl: 'sign.html',
        controller: 'UsersController'
      })
      .otherwise({
        redirectTo: '/'
      })      ;
  }]);

  var controllers = angular.module('controllers', []);
  var services = angular.module('services', []);


})();
