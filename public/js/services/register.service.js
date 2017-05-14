(function() {
    'use strict';

    angular
        .module('app.courses')
        .factory('RegisterService', RegisterService);

    RegisterService.inject = ['$http','$log','$filter'];
    function RegisterService($http, $log, $filter) {
        var service = {
            save: _save
        };

        return service;

        function _save(_data) {
            _data.birthDate = $filter('date')(_data.birthDate, 'yyyy-MM-dd hh:mm');
            return $http.post('/api/candidate', _data);
        }
    }
})();
