(function() {
    'use strict';

    angular
        .module('app.registration')
        .controller('RegistrationController', RegistrationController);

    RegistrationController.inject = ['RegisterService'];
    function RegistrationController(RegisterService) {
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
                   console.log(data);
                }, function errorCallback(error) {
                    console.log(error);
                });
        }
    }
})();
