angular.module('Down2GolfApp', ['ngResource','ngRoute', 'templates'])
.config(config);

config.$inject = ['$routeProvider', '$locationProvider'];
function config ( $routeProvider, $locationProvider ) {
  $routeProvider
  .when('/courses', {  //note same as above, JIC
    templateUrl: 'courses.template.html',
    controller: 'CoursesController',
    controllerAs: 'coursesCtrl'
  })
  .when('/courses/:courseId', {
    templateUrl: 'course.template.html',
    controller: 'CourseController',
    controllerAs: 'courseCtrl'
  })
  .when('/matches', {  //note same as above, JIC
    templateUrl: 'matches.template.html',
    controller: 'MatchesController',
    controllerAs: 'matchesCtrl'
  })
  .when('/matches/:id', {
    templateUrl: 'match.template.html',
    controller: 'MatchController',
    controllerAs: 'matchCtrl'
  })
  .otherwise({
    redirectTo: '/'
  });
$locationProvider
  .html5Mode({
    enabled: true,
    requireBase: false
  });
}
