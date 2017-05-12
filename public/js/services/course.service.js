(function() {
    'use strict';

    angular
        .module('app.courses')
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
