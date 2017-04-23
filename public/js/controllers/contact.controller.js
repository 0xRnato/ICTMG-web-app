(function(){
    'use strict';

    angular
        .module('app.contact')
        .controller('ContactController', ContactController)

    ContactController.$inject = ['$log', 'ContactService'];

    function ContactController($log, ContactService) {
        var vm = this;

        activate();

        function activate() { }
    }
})();