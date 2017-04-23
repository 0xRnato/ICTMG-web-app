(function(){
    'use strict';

    angular
        .module('ui.bootstrap')
        .controller('PaidModalController', PaidModalController)

    PaidModalController.$inject = ['$uibModalInstance', '$rootScope'];

    function PaidModalController($uibModalInstance, $rootScope) {
        var vm = this;

        vm.tittle;
        vm.text;
        vm.image;
        vm.value;
        vm.paymentLink;

        vm.close = function () {
            $uibModalInstance.close();
        };

        activate();

        function activate() {
            vm.tittle = $rootScope.tittle;
            vm.text = $rootScope.text;
            vm.image = $rootScope.image;
            vm.value = $rootScope.value;
            vm.paymentLink = $rootScope.paymentLink;
        }
    }
})();
