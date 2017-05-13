(function() {
    'use strict';

    angular
        .module('app.courses')
        .factory('RegisterService', RegisterService);

    RegisterService.inject = ['$http','$log'];
    function RegisterService($http, $log) {
        var service = {
            save: _save
        };

        return service;

        function _save(_data) {
            return $http.post('/api/candidate', _data);
        }
    }
})();
