(function(){
    'use strict';

    angular
        .module('app.admin')
        .controller('AdminController', AdminController)

    AdminController.$inject = [
        '$log',
        'UserService',
        '$rootScope',
        'AdminService',
        '$filter',
        '$window'];

    function AdminController(
        $log,
        UserService,
        $rootScope,
        AdminService,
        $filter,
        $window) {

        var vm = this;
        vm.users = [];
        vm.notes = [];
        vm.calendars = [];
        vm.slides = [];
        vm.newss = [];
        vm.candidates = [];

        vm.saveUser = function(){
            UserService.save(angular.copy(vm.user))
                .then(function sucessCallback(){
                    vm.user = {};
                    loadUsers();
                    alert('Usuário salvo com sucesso');
                }, function errorCallback(error){
                    alert(error);
                });
        };

        vm.saveNote = function(){
            AdminService.saveNotes(angular.copy(vm.note))
                .then(function sucessCallback(){
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
                .then(function sucessCallback(){
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
                .then(function sucessCallback(){
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
                .then(function sucessCallback(){
                    vm.news = {};
                    vm.newsIsSetted = false;
                    loadNews();
                    alert('Noticia salvo com sucesso');
                }, function errorCallback(error){
                    alert(error);
                });
        };

        vm.saveCandidate = function(){
            AdminService.saveCandidates(angular.copy(vm.candidate))
                .then(function sucessCallback(){
                    vm.candidate = {};
                    loadCandidates();
                    $window.scrollTo(0, 0);
                    alert('Candidato salvo com sucesso');
                }, function errorCallback(error){
                    alert(error);
                });
        };

        vm.saveCandidateStatus = function(){
            AdminService.saveCandidateStatus(angular.copy(vm.candidate.id), angular.copy(vm.candidate.status))
                .then(function sucessCallback(){
                    vm.candidate = {};
                    loadCandidates();
                    $window.scrollTo(0, 0);
                    alert('Candidato atualizado com sucesso');
                }, function errorCallback(error){
                    alert(error);
                });
        };

        vm.setUser = function(_user){
            vm.user = _user;
        }

        vm.setCandidate = function(_candidate){
            vm.candidate = _candidate;
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
            vm.newsIsSetted = true;
        }

        vm.updateUsers = function(){
            loadCandidates();
        }

        vm.openImage = function(url){
            $window.open(url, '_blank');
        }

        var loadUsers = function(){
            UserService.load()
                .then(function sucessCallback(data) {
                    vm.users = angular.copy(data.data);
                }, function errorCallback(error) {
                    $log.error('Error:' + error.status + ' - Message: ' + error.statusText);
            });
        }

        var loadCandidates = function(){
            AdminService.loadCandidates(angular.copy(vm.filterStatus))
                .then(function sucessCallback(data) {
                    vm.candidates = angular.copy(data.data);
                    vm.candidates.forEach(function(_candidate) {
                        _candidate.birthDate = $filter('date')(new Date(_candidate.birthDate), 'dd/MM/yyyy');
                    });
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
            vm.filterStatus = "Aguardando aprovação";
            loadUsers();
            loadNotes();
            loadCalendars();
            loadSlides();
            loadNews();
            loadCandidates();
            vm.noteIsSetted = false;
            vm.calendarIsSetted = false;
            vm.slideIsSetted = false;
            vm.newsIsSetted = false;
        }
    }
})();