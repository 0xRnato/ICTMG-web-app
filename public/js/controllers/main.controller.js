(function() {
    'use strict';

    angular
        .module('app.main')
        .controller('MainController', MainController);

    MainController.inject = ['MainService', '$log'];
    function MainController(MainService, $log) {
        var vm = this;
        activate();

        // Do something
        vm.calendar;

        vm.getDate = function(date) {
            return new Date(date);
        };

        function activate() {
            vm.calendar = [];
            MainService.getCalendar()
                .then(function sucessCallback(data) {
                    vm.calendar = data.data;
                }, function errorCallback(error) {
                    $log.error(error);
                });
        }
    }
})();
