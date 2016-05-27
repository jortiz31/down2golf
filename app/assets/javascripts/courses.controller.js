angular
.module('down2golf')
.controller('CoursesController', CoursesController);

CoursesController.$inject = ['$location'];
function CoursesController ( $location ) {
  var vm = this;
  console.log('CoursesController is live!');
  vm.courses = [{ id: 1, name: "Courses Index" }, { id: 300, name: "Hank's Swank"}];
  vm.sampleData = 'hello world';
}
