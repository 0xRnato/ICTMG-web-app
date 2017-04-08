(function() {
    'use strict';

    angular
        .module('ServicesCtrl', [])
        .controller('ServicesController', ServicesController);

    ServicesController.inject = ['$scope'];
    function ServicesController($scope) {
        var vm = this;
        activate();

        // Do something

        function activate() { }
    }
})();
