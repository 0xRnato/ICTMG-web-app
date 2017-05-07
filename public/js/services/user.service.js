(function() {
    'use strict';

    angular
        .module('app.admin')
        .factory('UserService', UserService);

    UserService.inject = ['$http'];
    function UserService($http) {
        var service = {
            load: _load,
            save: _save,
            delete: _delete,
        };

        return service;

        // Do something
        function _load() {
            return $http.get('/api/users');
        }
        function _save(userData) {
            return $http.post('/api/users', userData);
        }
        function _delete(id) {
            return $http.delete('/api/users' + id);
        }
    }
})();
