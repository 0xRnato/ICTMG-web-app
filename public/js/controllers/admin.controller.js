(function(){
    'use strict';

    angular
        .module('app.admin')
        .controller('AdminController', AdminController)

    AdminController.$inject = ['$log', 'UserService', '$rootScope', 'AdminService'];

    function AdminController($log, UserService, $rootScope, AdminService) {
        var vm = this;
        vm.users = [];
        vm.notes = [];
        vm.calendars = [];
        vm.slides = [];
        vm.newss = [];

        vm.saveUser = function(){
            UserService.save(angular.copy(vm.user))
                .then(function sucessCallback(data){
                    vm.user = {};
                    loadUsers();
                    alert('Usuário salvo com sucesso');
                }, function errorCallback(error){
                    alert(error);
                });
        };

        vm.saveNote = function(){
            AdminService.saveNotes(angular.copy(vm.note))
                .then(function sucessCallback(data){
                    vm.note = {};
                    vm.noteIsSetted = false;
                    loadNotes();
                    alert('Nota salva com sucesso');
                }, function errorCallback(error){
                    alert(error);
                });
        };

        vm.saveCalendar = function(){
            AdminService.saveCalendar(angular.copy(vm.calendar))
                .then(function sucessCallback(data){
                    vm.calendar = {};
                    vm.calendarIsSetted = false;
                    loadCalendars();
                    alert('Evento salvo com sucesso');
                }, function errorCallback(error){
                    alert(error);
                });
        };

        vm.saveSlide = function(){
            AdminService.saveSlide(angular.copy(vm.slide))
                .then(function sucessCallback(data){
                    vm.slide = {};
                    vm.calendarIsSetted = false;
                    loadSlides();
                    alert('Slide salvo com sucesso');
                }, function errorCallback(error){
                    alert(error);
                });
        };

        vm.saveNews = function(){
            AdminService.saveNews(angular.copy(vm.news))
                .then(function sucessCallback(data){
                    vm.news = {};
                    vm.newsIsSetted = false;
                    loadNews();
                    alert('Noticia salvo com sucesso');
                }, function errorCallback(error){
                    alert(error);
                });
        };

        vm.setUser = function(_user){
            vm.user = _user;
        }

        vm.setNote = function(_note){
            vm.note = _note;
            vm.noteIsSetted = true;
        }

        vm.setCalendar = function(_calendar){
            vm.calendar = _calendar;
            vm.calendarIsSetted = true;
        }

        vm.setSlide = function(_slide){
            vm.slide = _slide;
            vm.slideIsSetted = true;
        }

        vm.setNews = function(_news){
            vm.news = _news;
            vm.slideIsSetted = true;
        }

        var loadUsers = function(){
            UserService.load()
                .then(function sucessCallback(data) {
                    vm.users = angular.copy(data.data);
                }, function errorCallback(error) {
                    $log.error('Error:' + error.status + ' - Message: ' + error.statusText);
            });
        }

        var loadNotes = function(){
            AdminService.loadNotes()
                .then(function sucessCallback(data) {
                    vm.notes = angular.copy(data.data);
                }, function errorCallback(error) {
                    $log.error('Error:' + error.status + ' - Message: ' + error.statusText);
            });
        }

        var loadCalendars = function(){
            AdminService.loadCalendar()
                .then(function sucessCallback(data) {
                    vm.calendars = angular.copy(data.data);
                }, function errorCallback(error) {
                    $log.error('Error:' + error.status + ' - Message: ' + error.statusText);
            });
        }

        var loadSlides = function(){
            AdminService.loadSlides()
                .then(function sucessCallback(data) {
                    vm.slides = angular.copy(data.data);
                }, function errorCallback(error) {
                    $log.error('Error:' + error.status + ' - Message: ' + error.statusText);
            });
        }

        var loadNews = function(){
            AdminService.loadNews()
                .then(function sucessCallback(data) {
                    vm.newss = angular.copy(data.data);
                }, function errorCallback(error) {
                    $log.error('Error:' + error.status + ' - Message: ' + error.statusText);
            });
        }

        activate();

        function activate() {
            vm.userSession = angular.copy($rootScope.userSession);
            loadUsers();
            loadNotes();
            loadCalendars();
            loadSlides();
            loadNews();
            vm.noteIsSetted = false;
            vm.calendarIsSetted = false;
            vm.slideIsSetted = false;
            vm.newsIsSetted = false;
        }
    }
})();