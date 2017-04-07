(function() {
    'use strict';

    angular
        .module('RegistrationCtrl', [])
        .controller('RegistrationController', RegistrationController);

    RegistrationController.inject = ['$scope'];
    function RegistrationController($scope) {
        let vm = this;
        activate();

        // Do something

        function activate() { }
    }
})();
