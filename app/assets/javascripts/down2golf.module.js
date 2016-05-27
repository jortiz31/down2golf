angular.module('down2golf', ['ngRoute', 'templates'])
.config(config);

config.$inject = ['$routeProvider', '$locationProvider'];
function config ( $routeProvider, $locationProvider ) {
  $routeProvider
  .when('/', {
    templateUrl: 'courses.template.html',
    controller: 'CoursesController',
    controllerAs: 'coursesCtrl'
  })
  .otherwise({
    redirectTo: '/'
  });

  $locationProvider
  .html5mode({
    enabled: true,
    requireBase: flase
  });
}
