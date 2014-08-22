  'use strict';

tutorhubDirectives.directive('pwCheck', ['$parse', function ($parse) {
  return {
    restrict: 'A',
    require: 'ngModel',
    link: function(scope, elem, attrs, ctrl) {
      scope.$watch(function() {
        return $parse(attrs.pwCheck)(scope) === ctrl.$modelValue;
      }, function(currentValue) {
        ctrl.$setValidity('pwMatch', currentValue);
      });
    }
  };
}]);
