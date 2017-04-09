(function() {
    'use strict';

    angular
        .module('app.course')
        .controller('CourseController', CourseController);

    CourseController.inject = ['CourseService', '$log'];
    function CourseController(CourseService, $log) {
        var vm = this;
        activate();

        // Do something
        vm.courses;

        function activate() {
            vm.courses = [];
            CourseService.get()
                .then(function sucessCallback(data) {
                    vm.courses = data.data;
                }, function errorCallback(error) {
                    $log.error(error);
                });
        }
    }
})();
