(function() {
    'use strict';

    angular
        .module('app.course')
        .factory('RegisterService', RegisterService);

    RegisterService.inject = ['$http'];
    function RegisterService($http) {
        var service = {
            post: _post
        };

        return service;

        // Do something
        function _post(data) {
            console.log(data);
            return $http.post('/api/register', data);
        }
    }
})();
