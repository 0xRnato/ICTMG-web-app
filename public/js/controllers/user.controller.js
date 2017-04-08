(function() {
    'use strict';

    angular
        .module('UserCtrl', [])
        .controller('UserController', UserController);

    UserController.inject = ['$scope'];
    function UserController($scope) {
        var vm = this;
        activate();

        // Do something

        function activate() { }
    }
})();
