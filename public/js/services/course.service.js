(function() {
    'use strict';

    angular
        .module('CourseCtrl', [])
        .factory('Course', Course);

    Course.inject = ['$http'];
    function Course($http) {
        let service = {
            get: _get,
            create: _create,
            delete: _delete,
        };

        return service;

        // Do something
        function _get() {
            return $http.get('/api/courses');
        }
        function _create() {
            return $http.post('/api/courses', userData);
        }
        function _delete() {
            return $http.delete('/api/courses' + id);
        }
    }
})();
