(function() {
    'use strict';

    angular
        .module('MainCtrl', [])
        .factory('Main', Main);

    Main.inject = ['$http'];
    function Main($http) {
        let service = {};
        service.calendar = {
            get: _get,
            create: _create,
            delete: _delete,
        };

        return service;

        // Do something
        function _get() {
            return $http.get('/api/caledar');
        }
        function _create() {
            return $http.post('/api/caledar', userData);
        }
        function _delete() {
            return $http.delete('/api/caledar' + id);
        }
    }
})();
