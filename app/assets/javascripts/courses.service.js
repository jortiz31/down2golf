angular.module('Down2GolfApp')
  .service('CoursesService', CoursesService);

  CoursesService.$inject = ['$resource'];
  function CoursesService($resource) {
    resource = $resource('/api/courses/:courseId', {courseId: '@courseId'},{
        update: {
          method: 'PUT' // this method issues a PUT request
        },
        get: {
          method: "GET"
        },
        query: {
          isArray: true,
        }
      });
    return resource;
  }
