// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
angular
  .module('down2GolfApp')
  .controller('CoursesController', CoursesController);

ListsController.$inject = ['CoursesService', '$location'];
function ListsController(   CoursesService,   $location  ) {
  var vm = this;
  console.log('CoursesController is live');
  vm.courses = [];
  vm.newCourseName = '';
  vm.deleteCourse = deleteCourse;
  vm.createCourse = createCourse;
  vm.showCourse = showCourse;
  // fetch data
  getCourses();


  function getCourses() {
    CoursesService.query(function(data){
      console.log('here\'s the courses data in the controller', data);
      vm.courses = data;
    });
  }

  function deleteList(list, $event) {
    ListsService.remove({id: list.id}, handleDeleteSuccess);
      // we can get access to the 'click' or other event using $event (see the template also)
      // we don't want to trigger both deleteList and showList so we stop event propagation
      $event.stopPropagation();

      // declaring this inside deleteList to have a closure around list variable
      function handleDeleteSuccess(data) {
        console.log('deleted');
        vm.lists.splice(vm.lists.indexOf(list), 1);
      }

  }

  function createList() {
    console.log('create with', vm.newListName);
    if(vm.newListName.length > 1) {
      ListsService.save({name: vm.newListName}, handleCreateSuccess);
      vm.newListName = '';
    }
  }
  function handleCreateSuccess(data) {
    console.log('created', data);
    vm.lists.unshift(data);
  }

  function showList(list) {
    console.log('transition to showing list:', list);
    $location.path('/lists/' + list.id);
  }
}
