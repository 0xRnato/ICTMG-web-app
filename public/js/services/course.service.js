(function() {
    'use strict';

    angular
        .module('app.course')
        .factory('CourseService', CourseService);

    CourseService.inject = ['$http'];
    function CourseService($http) {
        var service = {
            get: _get
        };

        return service;

        // Do something
        function _get() {
            return $http.get('/api/courses');
        }
    }
})();
