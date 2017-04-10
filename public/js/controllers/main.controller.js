(function() {
    'use strict';

    angular
        .module('app.main')
        .controller('MainController', MainController);

    MainController.inject = ['MainService', '$log'];
    function MainController(MainService, $log) {
        var vm = this;
        activate();

        vm.calendar;

        vm.getDate = function(date) {
            if(Number.isInteger(date)) {
                return new Date(date * 1000);
            }
            return new Date(date);
        };

        vm.removeTags = function(string){
            return string
                .replace(/<([^>]*script|a+?)([^>]*?)>(.*?)<\/\1>/g, '')
                .replace(/<(?:.|\n)*?>/g, '')
                .replace(/&(nbsp|amp|quot|lt|gt);/g, '');
        }

        function activate() {
            vm.calendar = [];
            MainService.getCalendar()
                .then(function sucessCallback(data) {
                    vm.calendar = angular.copy(data.data);
                    for (var i = 0; i < vm.calendar.length; i++) {
                        var event = vm.calendar[i];
                        event.description = vm.removeTags(event.description);
                    }
                }, function errorCallback(error) {
                    $log.error(error);
                });
        }
    }
})();
