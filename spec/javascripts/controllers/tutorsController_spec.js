describe('Tutor Controllers', function() {

  beforeEach(function(){
    this.addMatchers({
      toEqualData: function(expected) {
        return angular.equals(this.actual, expected);
      }
    });
  });

  beforeEach(module('tutorhubApp'));
  beforeEach(module('tutorhubServices'));

  describe('TutorListFeaturedController', function() {
    var $scope, ctrl, _$httpBackend_;

    beforeEach(inject(fucntion(_$httpBackend_, $rootScope, ctrl){
      $httpBackend = _$httpBackend_;
      $httpbackend.expectGET('tutors/tutors.json').
        respond([{name: 'Tutor1'}, {name: 'Tutor2'},);
      scope = $rootScope.$new();
      ctrl = $controller('TutorListFeaturedController', ($scope: scope))
    }));

    it('should create "tutos" model with 2 tutor fetched from xhr', funcion(){
      expect($scope.toturs).toEqualData([]);
      $httpBackend.flush();

      expect($scope.toturs).toEqualData([
        {name: 'Tutor1'}, {name: 'Tutor2'}]);
    });

  });
});
