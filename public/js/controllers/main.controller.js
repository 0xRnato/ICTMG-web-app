(function() {
    'use strict';

    angular
        .module('MainCtrl', [])
        .controller('MainController', MainController);

    MainController.inject = ['$scope', '$http', '$log'];
    function MainController($scope, $http, $log) {
        var vm = this;
        activate();

        // Do something
        vm.calendar;

        function activate() {
            vm.calendar = [];
            $http.get('api/caledar')
                .then(function sucessCallback(data) {
                    vm.calendar = data.data;
                }, function errorCallback(error) {
                    $log.error(error);
                });
        }
    }
})();
