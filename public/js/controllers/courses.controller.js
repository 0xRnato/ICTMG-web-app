(function () {
    'use strict';

    angular
        .module('app.courses')
        .controller('CoursesController', CoursesController)

    CoursesController.$inject = [
        '$log',
        'CoursesService',
        '$location',
        '$rootScope',
        '$scope',
        '$filter'
    ];

    function CoursesController(
        $log,
        CoursesService,
        $location,
        $rootScope,
        $scope,
        $filter) {

        var vm = this;
        vm.freeCourses = [];

        vm.setCourse = function (_course) {
            $rootScope.selectedCourse = angular.copy(_course);
            $location.path('/course');
        }

        var removeTags = function (string) {
            return string
                .replace(/<([^>]*script|a+?)([^>]*?)>(.*?)<\/\1>/g, '')
                .replace(/<(?:.|\n)*?>/g, '')
                .replace(/&(nbsp|amp|quot|lt|gt);/g, '');
        }

        var getDate = function(date) {
            if(Number.isInteger(date)) {
                return new Date(date * 1000);
            }
            return new Date(date);
        };

        activate();

        function activate() {
            CoursesService.loadFree()
                .then(function sucessCallback(data) {
                    vm.freeCourses = angular.copy(data.data);
                    for (var i = 0; i < vm.freeCourses.length; i++) {
                        var course = vm.freeCourses[i];
                        course.summary = removeTags(course.summary);
                        course.startdate = $filter('date')(getDate(course.startdate), 'dd/MM/yyyy');
                        course.enddate = $filter('date')(getDate(course.enddate), 'dd/MM/yyyy');
                    }
                    $scope.$digest;
                }, function errorCallback(error) {
                    $log.error(error);
                });
        }
    }
})();