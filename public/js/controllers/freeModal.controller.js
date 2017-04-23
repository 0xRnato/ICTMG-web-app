(function(){
    'use strict';

    angular
        .module('ui.bootstrap')
        .controller('FreeModalController', FreeModalController)

    FreeModalController.$inject = ['$uibModalInstance', '$rootScope'];

    function FreeModalController($uibModalInstance, $rootScope) {
        var vm = this;

        vm.tittle;
        vm.text;
        vm.image;
        vm.downloadLink;

        vm.close = function () {
            $uibModalInstance.close();
        };

        activate();

        function activate() {
            vm.tittle = $rootScope.tittle;
            vm.text = $rootScope.text;
            vm.image = $rootScope.image;
            vm.downloadLink = $rootScope.downloadLink;
        }
    }
})();
