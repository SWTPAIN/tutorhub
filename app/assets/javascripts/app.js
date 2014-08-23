'use strict';

var tutorhubApp = angular.module('tutorhubApp', [
  'tutorhubControllers',
  'tutorhubServices',
  'tutorhubDirectives',
  'templates',
  'ngRoute',
  'ngResource',
  'ngCookies',
  'multi-select'
]);

tutorhubApp.config(['$routeProvider','$httpProvider', function($routeProvider, $httpProvider){
  $routeProvider
    .when('/', {
      templateUrl: 'index.html',
      controller: 'TutorListFeaturedController'
    })
    .when('/login', {
      templateUrl: 'login.html',
      controller: 'LoginController'
    })
    .when('/signup', {
      templateUrl: 'signup.html',
      controller: 'SignupController'
    })
    .otherwise({
      redirectTo: '/'
    });
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');
}]);

tutorhubApp.run(['$rootScope', '$location', 'Auth', function($rootScope, $location, Auth){
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


var tutorhubControllers = angular.module('tutorhubControllers', []);
var tutorhubServices = angular.module('tutorhubServices', []);
var tutorhubDirectives = angular.module('tutorhubDirectives', []);
