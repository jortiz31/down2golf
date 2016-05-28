angular.module('Down2GolfAppApp')
  .service('CoursesService', CoursesService);

  CoursesService.$inject = ['$resource'];
  function CoursesService($resource) {

    /* ngResource <3 RESTful routes
    { 'get':    'GET /items/:id',
      'save':   'POST /items',
      'query':  'GET /items',
      'remove': 'DELETE /items/:id',
      'update': 'PUT /items/:id' };
    */
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
