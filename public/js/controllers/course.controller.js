(function() {
    'use strict';

    angular
        .module('CourseCtrl', [])
        .controller('CourseController', CourseController);

    CourseController.inject = ['$scope', '$log', '$http'];
    function CourseController($scope, $log, $http) {
        let vm = this;
        activate();

        // Do something
        vm.courses;

        function activate() {
            vm.courses = [];
            $http.get('api/courses')
                .then(function sucessCallback(data) {
                    vm.courses = data.data;
                }, function errorCallback(error) {
                    $log.error(error);
                });
        }
    }
})();
