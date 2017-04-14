(function() {
    'use strict';

    angular
        .module('app.registration')
        .controller('RegistrationController', RegistrationController);

    RegistrationController.inject = ['RegisterService', '$log'];
    function RegistrationController(RegisterService, $log) {
        var vm = this;
        activate();

        // Do something
        vm.selected = {};

        function activate() {
            vm.selected = {};
        }

        vm.register = function() {
            RegisterService.post(vm.selected)
                .then(function sucessCallback(data) {
                   $log.debug(data);
                }, function errorCallback(error) {
                    $log.error(error);
                });
        }
    }
})();
