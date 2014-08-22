describe('LoginController', function () {
  var scope, loginController, mockUser, q, deferred, location;

  beforeEach(module('tutorhubApp'));

  //Prepare the fake User factory
  beforeEach(inject(function ($controller, $rootScope) {
    mockUser = {
      login: function () {
        deferred = q.defer();
        deferred.resolve();
        return deferred.promise;
      },
      currentUser: function () {
        deferred = q.defer();
        deferred.resolve();
        return deferred.promise;
      }
    };
    spyOn(mockUser, 'login').andCallThrough();
    spyOn(mockUser, 'currentUser').andCallThrough();
  }));

  //Inject the fake User factory
  beforeEach(inject(function ($rootScope, $controller, $q){
    scope = $rootScope.$new();
    q = $q;
    controller = $controller('LoginController', {
      $scope: scope,
      User: mockUser,
      $location: location
    });
  }));

  describe('login()', function () {
    it('calls service with user data to login', function () {
      scope.user =  {
        email: 'alice@gmail.com',
        password: 'password'
      };
      scope.login();
      scope.$apply();
      expect(location.path.calledWith('/')).to.be.ok();
    });
  })
});
