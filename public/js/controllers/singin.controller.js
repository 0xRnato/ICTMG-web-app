(function() {
    'use strict';

    angular
        .module('SinginCtrl', [])
        .controller('SinginController', SinginController);

    SinginController.inject = ['$scope'];
    function SinginController($scope) {
        var vm = this;
        activate();

        // Do something

        function activate() { }
    }
})();
