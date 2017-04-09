(function() {
    'use strict';

    angular
        .module('app.services', [])
        .controller('ServicesController', ServicesController);

    ServicesController.inject = [];
    function ServicesController() {
        // var vm = this;
        activate();

        // Do something

        function activate() { }
    }
})();
