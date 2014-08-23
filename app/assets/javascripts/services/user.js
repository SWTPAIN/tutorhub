'use strict';

tutorhubServices.service('User',function($rootScope, $q, $cookieStore, $http, Auth) {
  this.currentUser = Auth.currentUser;

  this.login = function(params) {
    var d = $q.defer();
    $http({
      url: '/sessions',
      method: 'POST',
      data: {user: params}
    }).success(function(response) {
      if(response.success) {
        var user = response.user;
        Auth.setCurrentUser(user);
        d.resolve(user);
      } else {
        d.reject(response)
      }
    }).error(function(reason) {
      d.reject(reason);
    });
    return d.promise;
  };
  this.logout = function(id) {
    var d = $q.defer();
    console.log(id);
    $http({
      url: '/sessions/' + id,
      method: "DELETE"
    }).success(function(response) {
      Auth.removeCurrentUser();
      d.resolve();
    }).error(function(reason) {
      d.reject(reason);
    });
    return d.promise;
  };
  this.signup = function(params) {
    var d = $q.defer();
    $http({
      url: '/users',
      method: 'POST',
      data: {
          user: params
      }
    }).success(function(response) {
      var user = response.data.user;
      user.auth_token = response.data.auth_token; // talk about this
      Auth.setCurrentUser(user);
      d.resolve(user);
    }).error(function(reason) {
      d.reject(reason);
    });
    return d.promise;
  };
});
