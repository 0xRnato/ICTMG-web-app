(function() {
    'use strict';

    angular
        .module('app.main')
        .factory('MainService', MainService);

    MainService.inject = ['$http'];
    function MainService($http) {
        var service = {
            getCalendar: _getCalendar
        };

        return service;

        // Do something
        function _getCalendar() {
            return $http.get('/api/calendar');
        }
    }
})();
