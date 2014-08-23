describe('pw-check', function () {
  var scope, element, signupForm
      html = '<form name="signupForm">'
           + '<input type="password" name="password" ng-model="password" />'
           +'<input type="password" name="password_confirmation" ng-model="password_confirmation" pw-check="password" />'
           +'<div ng-show="signupForm.$error">'
           +'<span ng-show="signupForm.$error.pwMatch">'
           +'Passwords don\'t match.'
           +'</span></div></form>';

  beforeEach(module('tutorhubApp'));

  beforeEach(inject(function ($rootScope, $compile) {
    scope = $rootScope;
    element = angular.element(html);
    $compile(element)(scope);
    scope.$digest();
    signupForm = scope.signupForm;
  }));

  it('should set form invalid when the passwords didnt match', function () {
    expect(signupForm.$valid).toBe(true);
    signupForm.password.$setViewValue('abc');
    signupForm.password_confirmation.$setViewValue('abcd');
    scope.$digest();
    expect(scope.password).toBe('abc');
    expect(scope.password_confirmation).toBe('abcd');

    expect(signupForm.$valid).toBe(false);
  });

});
