(function(){
    'use strict';

    angular
        .module('app.terms')
        .factory('TermsService', TermsService)

    TermsService.$inject = ['$http'];

    function TermsService($http) {
        var service = {
            getData: getData
        };

        return service;

        function getData() { }
    }
})();