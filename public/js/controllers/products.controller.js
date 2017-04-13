(function() {
    'use strict';

    angular
        .module('app.products')
        .controller('ProductsController', ProductsController);

    ProductsController.inject = [];
    function ProductsController() {
        // var vm = this;
        activate();

        // Do something

        function activate() { }
    }
})();
