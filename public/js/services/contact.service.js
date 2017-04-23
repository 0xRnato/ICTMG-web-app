(function(){
    'use strict';

    angular
        .module('app.contact')
        .factory('ContactService', ContactService)

    ContactService.$inject = ['$http'];

    function ContactService($http) {
        var service = {
            getData: getData
        };

        return service;

        function getData() { }
    }
})();