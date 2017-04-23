(function(){
    'use strict';

    angular
        .module('app.terms')
        .controller('TermsController', TermsController)

    TermsController.$inject = ['$log', 'TermsService'];

    function TermsController($log, TermsService) {
        var vm = this;

        activate();

        function activate() { }
    }
})();