
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
angular
  .module('Down2GolfApp')
  .controller('CoursesController', CoursesController);

CoursesController.$inject = ['CoursesService', '$location'];
function CoursesController(   CoursesService,   $location  ) {
  var vm = this;
  console.log('CoursesController is live');
  vm.courses = [];
  vm.newCourseName = '';
  vm.newCourseUrl = '';
  vm.newCourseImage = '';
  vm.newCourePrice = '';
  vm.newCourseLocation = '';
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

  function deleteCourse(course, $event) {
    CoursesService.remove({id: courseId}, handleDeleteSuccess);
      // we can get access to the 'click' or other event using $event (see the template also)
      // we don't want to trigger both deleteList and showList so we stop event propagation
      $event.stopPropagation();

      // declaring this inside deleteList to have a closure around list variable
      function handleDeleteSuccess(data) {
        console.log('deleted');
        vm.courses.splice(vm.courses.indexOf(course), 1);
      }

  }

  function createCourse() {
    console.log('create with', vm.newCourseName);
    if(vm.newCourseName.length > 1) {
      CoursesService.save({name: vm.newCourseName, location: vm.newCourseLocation, url:vm.newCourseUrl, price:vm.newCoursePrice, image:vm.newCourseImage}, handleCreateSuccess);
      vm.newCourseName = '';
    }
  }
  function handleCreateSuccess(data) {
    console.log('created', data);
    vm.courses.unshift(data);
  }

  function showCourse(course) {
    console.log('transition to showing course:', course);
    $location.path('/courses/' + course.id);
  }
}
