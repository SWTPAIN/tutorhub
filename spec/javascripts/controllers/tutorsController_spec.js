describe('TutorListController', function () {
  var scope, ctrl, $httpBackend;


  beforeEach(module('tutorhubApp'));
  // beforeEach(module('phonecatServices'));

  beforeEach(inject(function(_$httpBackend_, $rootScope, $controller) {
    $httpBackend = _$httpBackend_;
    $httpBackend.expectGET('tutors.json').
        respond([
          {name: 'Alice', qualification: 'HKU'},
          {name: 'Bob', qualification: 'CU'}
        ]);
    scope = $rootScope.$new();
    ctrl = $controller('TutorListController', {$scope: scope});
  }));

  it('should create "tutors" model with 2 tutors fetched from xhr', function() {
    expect(scope.tutors).toEqualData ([]);
    $httpBackend.flush();

    expect(scope.tutors).toEqualData([
      {name: 'Alice', qualification: 'HKU'},
      {name: 'Bob', qualification: 'CU'}
    ]);

  });
});
