(function(){
    'use strict';

    angular
        .module('app.main')
        .controller('NavbarController', NavbarController)

    NavbarController.$inject = [
        '$log',
        'CourseService',
        '$window',
        '$rootScope'];

    function NavbarController(
        $log,
        CourseService,
        $window,
        $rootScope) {

        var vm = this;
        activate();

        vm.courses;

        vm.showCourse = function(course){
            $rootScope.selectedCourse = course;
            $window.location.href = '#/course';
        }

        vm.removeTags = function(string){
            return string
                .replace(/<([^>]*script|a+?)([^>]*?)>(.*?)<\/\1>/g, '')
                .replace(/<(?:.|\n)*?>/g, '')
                .replace(/&(nbsp|amp|quot|lt|gt);/g, '');
        }

        function activate() {
            vm.courses = [];
            CourseService.get()
                .then(function sucessCallback(data){
                    vm.courses = angular.copy(data.data);
                    for (var i = 0; i < vm.courses.length; i++) {
                        var course = vm.courses[i];
                        course.summary = vm.removeTags(course.summary);
                    }
                }, function errorCallback(error){
                    $log.error(error);
                });
        }
    }
})();
