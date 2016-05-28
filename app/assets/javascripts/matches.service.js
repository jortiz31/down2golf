angular.module('Down2GolfApp')
  .service('MatchesService', MatchesService);

  MatchesService.$inject = ['$resource'];
  function MatchesService($resource) {

    /* ngResource <3 RESTful routes
    { 'get':    'GET /items/:id',
      'save':   'POST /items',
      'query':  'GET /items',
      'remove': 'DELETE /items/:id',
      'update': 'PUT /items/:id' };
    */
    resource = $resource('/api/courses/:courseId/matches/:matchId', {courseId: '@courseId', matchId: '@id'},{
        update: {
          method: 'PUT' // this method issues a PUT request
        },
        query: {
          isArray: true,
        }
      });
    return resource;
  }
