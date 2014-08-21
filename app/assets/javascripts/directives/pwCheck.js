'use strict';

tutorhubDirectives.directive('pwCheck', function(){
    return {
      templateUrl: "userPanel.html",
      require: 'ngModel',
      // transclude: true,
      link: function (scope, elem, attrs, ctrl) {
        var firstPassword = '#' + attrs.pwCheck;
        elem.add(firstPassword).on('keyup', function () {
          scope.$apply(function () {
            var v = elem.val() === $(firstPassword).val();
            ctrl.$setValidity('pwmatch', v);
          });
        });
      }
    };
});
