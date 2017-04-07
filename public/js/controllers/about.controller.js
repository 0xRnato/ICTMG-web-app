(function() {
    'use strict';

    angular
        .module('AboutCtrl', [])
        .controller('AboutController', AboutController);

    AboutController.inject = ['$scope'];
    function AboutController($scope) {
        let vm = this;
        activate();

        // Do something

        function activate() { }
    }
})();
