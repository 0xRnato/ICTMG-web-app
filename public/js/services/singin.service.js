(function() {
    'use strict';

    angular
        .module('app.admin')
        .factory('SinginService', SinginService);

    SinginService.inject = ['$http'];
    function SinginService($http) {
        var service = {
            login: _login
        };

        return service;

        function _login(_userData) {
            return $http.post('/api/singin', _userData);
        }
    }
})();
