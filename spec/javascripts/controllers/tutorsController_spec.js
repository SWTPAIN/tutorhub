describe('TutorListFeaturedController', function () {
  var scope, ctrl, $httpBackend;


  beforeEach(module('tutorhubApp'));

  beforeEach(inject(function(_$httpBackend_, $rootScope, $controller) {
    $httpBackend = _$httpBackend_;
    $httpBackend.expectGET('featured_tutors.json').
        respond([
          {name: 'Alice', qualification: 'HKU'},
          {name: 'Bob', qualification: 'CU'}
        ]);
    scope = $rootScope.$new();
    ctrl = $controller('TutorListFeaturedController', {$scope: scope});
  }));

  afterEach(function(){
    $httpBackend.verifyNoOutstandingExpectation();
    $httpBackend.verifyNoOutstandingRequest();
  });

  it('should create "tutors" model with 2 tutors fetched from xhr', function() {
    expect(scope.tutors).toEqualData ([]);
    $httpBackend.flush();

    expect(scope.tutors).toEqualData([
      {name: 'Alice', qualification: 'HKU'},
      {name: 'Bob', qualification: 'CU'}
    ]);

  });
});
