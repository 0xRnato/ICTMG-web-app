(function() {
    'use strict';

    angular
        .module('UserService', [])
        .factory('User', User);

    User.inject = ['$http'];
    function User($http) {
        var service = {
            get: _get,
            create: _create,
            delete: _delete,
        };

        return service;

        // Do something
        function _get() {
            return $http.get('/api/users');
        }
        function _create(userData) {
            return $http.post('/api/users', userData);
        }
        function _delete(id) {
            return $http.delete('/api/users' + id);
        }
    }
})();
