(function() {
    'use strict';

    angular
        .module('ContentCtrl', [])
        .controller('ContentController', ContentController);

    ContentController.inject = ['$scope'];
    function ContentController($scope) {
        var vm = this;
        activate();

        // Do something

        function activate() { }
    }
})();
