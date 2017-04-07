(function() {
    'use strict';

    angular
        .module('ServicesCtrl', [])
        .controller('ServicesController', ServicesController);

    ServicesController.inject = ['$scope'];
    function ServicesController($scope) {
        let vm = this;
        activate();

        // Do something

        function activate() { }
    }
})();
