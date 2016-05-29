angular.module('Down2GolfApp')
  .service('MatchesService', MatchesService);

  MatchesService.$inject = ['$resource'];
  function MatchesService($resource) {
    resource = $resource('/api/matches/:id', {id: '@id'},{
        update: {
          method: 'PUT' // this method issues a PUT request
        },
        get:{
          isArray: false
        },
        query: {
          isArray: true
        }
      });
    return resource;
  }
