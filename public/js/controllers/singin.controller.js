(function(){
    'use strict';

    angular
        .module('app.admin')
        .controller('SinginController', SinginController)

    SinginController.$inject = ['$location', 'SinginService', '$document', '$rootScope'];

    function SinginController($location, SinginService, $document, $rootScope) {
        var vm = this;

        vm.singin = function() {
            SinginService.login(angular.copy(vm.user)).then(
                function sucessCallback(response){
                    if(response.data.status == 'success'){
                        const userSession = {
                            username: response.data.username,
                            fullname: response.data.fullname,
                            email: response.data.email
                        }
                        vm.userSession = userSession;
                        $rootScope.userSession = angular.copy(vm.userSession);
                        $location.path('/admin');
                    }
                    else{
                        alert(response.data.error);
                        vm.user = {};
                        const input = $document[0].getElementById('user');
                        input.focus();
                    }
                }, function errorCallback(response){
                    alert('Status error: ' + response.status + ' - ' + response.statusText);
                    vm.user = {};
                    const input = $document[0].getElementById('user');
                    input.focus();
                }
            );
        };

        activate();

        function activate() { }
    }
})();