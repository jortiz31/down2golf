// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
angular
  .module('Down2GolfAppApp')
  .controller('MatchesController', MatchesController);

MatchesController.$inject = ['MatchesService', '$location'];
function MatchesController(   MatchesService,   $location  ) {
  var vm = this;
  console.log('MatchesController is live');
  vm.matches = [];
  vm.newMatchName = '';
  vm.deleteMatch = deleteMatch;
  vm.createMatch = createMatch;
  vm.showMatch = showMatch;
  // fetch data
  getMatches();


  function getMatches() {
    MatchesService.query(function(data){
      console.log('here\'s the matches data in the controller', data);
      vm.matches = data;
    });
  }

  function deleteMatch(match, $event) {
    MatchesService.remove({id: id}, handleDeleteSuccess);
      // we can get access to the 'click' or other event using $event (see the template also)
      // we don't want to trigger both deleteList and showList so we stop event propagation
      $event.stopPropagation();

      // declaring this inside deleteList to have a closure around list variable
      function handleDeleteSuccess(data) {
        console.log('deleted');
        vm.matches.splice(vm.matches.indexOf(match), 1);
      }

  }

  function createMatch() {
    console.log('create with', vm.newMatchName);
    if(vm.newMatchName.length > 1) {
      MatchesService.save({name: vm.newMatchName}, handleCreateSuccess);
      vm.newMatchName = '';
    }
  }
  function handleCreateSuccess(data) {
    console.log('created', data);
    vm.matches.unshift(data);
  }

  function showMatch(match) {
    console.log('transition to showing match:', match);
    $location.path('/matches/' + match.id);
  }
}
