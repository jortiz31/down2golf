// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
angular
  .module('Down2GolfApp')
  .controller('MatchController', MatchController);

MatchController.$inject = ['MatchesService', '$location','$routeParams'];
function MatchController(   MatchesService,   $location , $routeParams ) {
  var vm = this;
  var matchId = $routeParams.matchId;
  console.log('MatchController is live');
  vm.matches = [];
  vm.newMatchTitle = '';
  vm.newMatchTimeAndDate ='';
  vm.newMatchCourse = '';
  vm.deleteMatch = deleteMatch;
  vm.createMatch = createMatch;
  vm.showMatch = showMatch;
  // fetch data
  getMatch(matchId);


  function getMatch(id) {
    MatchesService.get({id:id},function(data){
      console.log('here\'s the match data in the controller', data);
      vm.match = data;
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
    if(vm.newMatchTitle.length > 1) {
      MatchesService.save({title: vm.newMatchTitle, course: vm.newMatchCourse, timeanddate: vm.newMatchTimeAndDate}, handleCreateSuccess);
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
