(function(){
    'use strict';

    angular
        .module('app.terms')
        .controller('TermsController', TermsController)

    TermsController.$inject = ['$log', 'TermsService', '$location'];

    function TermsController($log, TermsService, $location) {
        var vm = this;

        vm.goToRegistration = function (){
            if(vm.agreed){
                $location.path('/registration');
            }
        }

        activate();

        function activate() { }
    }
})();