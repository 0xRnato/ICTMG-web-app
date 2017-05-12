(function(){
    'use strict';

    angular
        .module('app.courses')
        .factory('CoursesService', CoursesService)

    CoursesService.$inject = ['$http'];

    function CoursesService($http) {
        var service = {
            loadFree: _loadFree
        };

        return service;

        function _loadFree() {
            return $http.get('/api/courses');
        }
    }
})();