(function() {
    'use strict';

    angular
        .module('app.courses')
        .factory('RegisterService', RegisterService);

    RegisterService.inject = ['$http','$log'];
    function RegisterService($http, $log) {
        var service = {
            post: _post
        };

        return service;

        // Do something
        function _post(data) {
            $log.debug(data);
            return $http.post('/api/register', data);
        }
    }
})();
