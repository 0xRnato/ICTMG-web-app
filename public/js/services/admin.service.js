(function() {
    'use strict';

    angular
        .module('app.admin')
        .factory('AdminService', AdminService);

    AdminService.inject = ['$http', '$filter'];
    function AdminService($http, $filter) {
        var service = {
            loadNotes: _loadNotes,
            saveNotes: _saveNotes,
            loadCalendar: _loadCalendar,
            saveCalendar: _saveCalendar,
            loadSlides: _loadSlides,
            saveSlide: _saveSlide
        };

        return service;

        function _loadNotes() {
            return $http.get('/api/notes');
        }

        function _saveNotes(_note){
            return $http.post('/api/notes', _note);
        }

        function _loadCalendar() {
            return $http.get('/api/calendar');
        }

        function _saveCalendar(_calendar){
            _calendar.startdate = $filter('date')(_calendar.startdate, 'yyyy-MM-dd hh:mm');
            _calendar.enddate = $filter('date')(_calendar.enddate, 'yyyy-MM-dd hh:mm');
            return $http.post('/api/calendar', _calendar);
        }

        function _loadSlides() {
            return $http.get('/api/slides');
        }

        function _saveSlide(_slide){
            return $http.post('/api/slides', _slide);
        }
    }
})();
