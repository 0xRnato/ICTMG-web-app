(function(){
    'use strict';

    angular
        .module('app.admin')
        .controller('AdminController', AdminController)

    AdminController.$inject = ['$log', 'UserService', '$rootScope'];

    function AdminController($log, UserService, $rootScope) {
        var vm = this;
        vm.users = [];

        vm.save = function(){
            UserService.save(angular.copy(vm.user))
                .then(function sucessCallback(data){
                    vm.user = {};
                    loadUsers();
                    alert('Usuário salvo com sucesso');
                }, function errorCallback(error){
                    alert(error);
                })
        };

        vm.setUser = function(_user){
            vm.user = _user;
        }

        var loadUsers = function(){
            UserService.load()
                .then(function sucessCallback(data) {
                    vm.users = angular.copy(data.data);
                }, function errorCallback(error) {
                    $log.error('Error:' + error.status + ' - Message: ' + error.statusText);
            });
        }

        activate();

        function activate() {
            vm.userSession = angular.copy($rootScope.userSession);
            loadUsers();
        }
    }
})();