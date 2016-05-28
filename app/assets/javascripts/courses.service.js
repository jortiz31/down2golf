angular.module('Down2GolfApp')
  .service('CoursesService', CoursesService);

  CoursesService.$inject = ['$resource'];
  function CoursesService($resource) {
    resource = $resource('/api/courses/:courseId', {id: '@courseId'},{
        update: {
          method: 'PUT' // this method issues a PUT request
        },
        query: {
          isArray: true,
        }
      });
    return resource;
  }
