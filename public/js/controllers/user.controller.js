(function() {
    'use strict';

    angular
        .module('UserCtrl', [])
        .controller('UserController', UserController);

    UserController.inject = ['$scope'];
    function UserController($scope) {
        let vm = this;
        activate();

        // Do something

        function activate() { }
    }
})();
