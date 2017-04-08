(function() {
    'use strict';

    angular
        .module('CourseCtrl')
        .controller('CourseController', CourseController);

    CourseController.inject = ['$scope', '$log', '$http', 'Course'];
    function CourseController($scope, $log, $http, Course) {
        let vm = this;
        activate();

        // Do something
        vm.courses;

        function activate() {
            vm.courses = [];
            Course.get()
                .then(function sucessCallback(data) {
                    vm.courses = data.data;
                }, function errorCallback(error) {
                    $log.error(error);
                });
        }
    }
})();
