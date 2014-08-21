(function(){

  'use strict';

  var Tutorhub = angular.module('Tutorhub', [
    'controllers',
    'services',
    'directives',
    'templates',
    'ngRoute',
    'ngCookies'
  ]);

  Tutorhub.config(['$routeProvider', function($routeProvider){
    $routeProvider
      .when('/', {
        templateUrl: 'index.html',
        controller: 'TutorsController'
      })
      .when('/login', {
        templateUrl: 'login.html',
        controller: 'LoginController'
      })
      .otherwise({
        redirectTo: '/'
      })      ;
  }]);

  Tutorhub.run(['$rootScope', '$location', 'Auth', function($rootScope, $location, Auth){
    var publicRoutes = ['/', '/login', '/signup'];

    var routeClean = function (route) {
      return _.find(publicRoutes, function (noAuthRoute) {
        return startsWith(noAuthRoute, route);
      });
    };

    $rootScope.$on('routeChangeStart', function(event, next, current){
      if (!routeClean($location.url()) && !Auth.isLoggedIn()){
        $location.path('/login');
      }
    });

    function startsWith(x, y){
      return x.indexOf(y) === 0;
    };
  }]);


  var controllers = angular.module('controllers', []);
  var services = angular.module('services', []);
  var directives = angular.module('directives', []);

})();
