(function() {
    'use strict';

    angular
        .module('MainCtrl')
        .controller('MainController', MainController);

    MainController.inject = ['$scope', '$http', 'Main'];
    function MainController($scope, $http, Main) {
        let vm = this;
        activate();

        // Do something
        vm.calendar;

        vm.getDate = function(date) {
            console.log(date);
            return new Date(date);
        }

        function activate() {
            vm.calendar = [];
            Main.calendar.get()
                .then(function sucessCallback(data) {
                    vm.calendar = data.data;
                }, function errorCallback(error) {
                    $log.error(error);
                });
        }
    }
})();
