(function(){
    'use strict';

    angular
        .module('app.courses')
        .controller('CoursesController', CoursesController)

    CoursesController.$inject = ['CoursesService', '$location'];

    function CoursesController(CoursesService, $location) {
        var vm = this;
        vm.freeCourses = [];
        vm.selectedCourse = {};

        var setCourse = function(_course){
            vm.selectedCourse = angular.copy(_course);
            $location.path('/course');
        }

        activate();

        function activate() {
            CoursesService.loadFree()
                .then(function sucessCallback(data) {
                    console.log(data.data);
                    vm.freeCourses = angular.copy(data.data);
                }, function errorCallback(error) {
                    alert('Error:' + error.status + ' - Message: ' + error.statusText);
            });
        }
    }
})();