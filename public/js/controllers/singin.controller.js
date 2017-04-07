(function() {
    'use strict';

    angular
        .module('SinginCtrl', [])
        .controller('SinginController', SinginController);

    SinginController.inject = ['$scope'];
    function SinginController($scope) {
        let vm = this;
        activate();

        // Do something

        function activate() { }
    }
})();
