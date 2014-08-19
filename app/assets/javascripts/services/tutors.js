angular.module('services')
  .factory("Tutors", [function($scope){
    var Tutors = {};
    Tutors.all = [
      {
        name: "Alice",
        qualification: "HKU Pharmacy"
      },
      {
        name: "Bob",
        qualification: "POLYU Civl Engineering"
      },
      {
        name: "Clemence",
        qualification: "CITYU Law"
      },
      {
        name: "Derek",
        qualification: "CU English"
      },
      {
        name: "Elaine",
        qualification: "UST Global Business"
      }
    ];
    return Tutors;
}])
