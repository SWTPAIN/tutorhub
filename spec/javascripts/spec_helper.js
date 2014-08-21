//= require support/bind-poly
//
// Matching files
// By default Teaspoon will look for files that match _spec.{js,js.coffee,.coffee}. Add a filename_spec.js file in your
// spec path and it'll be included in the default suite automatically. If you want to customize suites, check out the
// configuration in config/initializers/teaspoon.rb
//
// Manifest
// If you'd rather require your spec files manually (to control order for instance) you can disable the suite matcher in
// the configuration and use this file as a manifest.
//
// For more information: http://github.com/modeset/teaspoon
//
// You can require your own javascript files here. By default this will include everything in application, however you
// may get better load performance if you require the specific files that are being used in the spec that tests them.
//= require application
//= require angular-mocks

beforeEach(function(){
  this.addMatchers({
    toEqualData: function(expected) {
      return angular.equals(this.actual, expected);
    }
  });
});
