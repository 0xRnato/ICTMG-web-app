(function() {
    'use strict';

    angular
        .module('app.main')
        .factory('MainService', MainService);

    MainService.inject = ['$http'];
    function MainService($http) {
        var service = {
            getCalendar: _getCalendar,
            getNotes: _getNotes,
            getNews: _getNews,
            getSlides: _getSlides
        };

        return service;

        function _getCalendar() {
            return $http.get('/api/calendar');
        }

        function _getNotes() {
            return $http.get('api/notes');
        }

        function _getNews() {
            return $http.get('api/news');
        }

        function _getSlides(){
            return $http.get('api/slides');
        }
    }
})();
