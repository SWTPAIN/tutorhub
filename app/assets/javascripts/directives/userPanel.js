'use strict';

angular.module('directives')
  .directive('userPanel', function(){
    return {
      restrict: 'AE',
      templateUrl: "userPanel.html",
      // replace: true,
      // transclude: true,
      controller: function($scope, User, $rootScope){
          User.currentUser().then(function(user){
                $scope.currentUser = user;
          });

          $rootScope.$on('user:set',function(event, currentUser){
             $scope.currentUser = currentUser;
          });

          $scope.logout = function(){
              User.logout().then(function(){
                  $scope.currentUser = null;
              });
          };
       }
    };
});
