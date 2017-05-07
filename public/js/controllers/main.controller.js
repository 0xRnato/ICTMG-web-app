(function () {
    'use strict';

    angular
        .module('app.main')
        .controller('MainController', MainController);

    MainController.inject = ['MainService', '$log'];
    function MainController(MainService, $log) {
        var vm = this;
        activate();

        vm.calendar;
        vm.news;
        vm.slides;
        vm.notes;
        vm.myInterval;
        vm.noWrapSlides;
        vm.active;
        vm.currIndex;
        vm.slides;

        vm.getDate = function (date) {
            if (Number.isInteger(date)) {
                return new Date(date * 1000);
            }
            return new Date(date);
        };

        vm.removeTags = function (string) {
            return string
                .replace(/<([^>]*script|a+?)([^>]*?)>(.*?)<\/\1>/g, '')
                .replace(/<(?:.|\n)*?>/g, '')
                .replace(/&(nbsp|amp|quot|lt|gt);/g, '');
        }

        function activate() {
            vm.calendar = [];
            vm.notes = [];
            vm.news = [];
            vm.slides = [];

            MainService.getCalendar()
                .then(function sucessCallback(data) {
                    vm.calendar = angular.copy(data.data);
                }, function errorCallback(error) {
                    $log.error('Error:' + error.status + ' - Message: ' + error.statusText);
                });
            MainService.getNotes()
                .then(function sucessCallback(data) {
                    vm.notes = angular.copy(data.data);
                }, function errorCallback(error) {
                    $log.error('Error:' + error.status + ' - Message: ' + error.statusText);
                });
            MainService.getNews()
                .then(function sucessCallback(data) {
                    vm.news = angular.copy(data.data);
                }, function errorCallback(error) {
                    $log.error('Error:' + error.status + ' - Message: ' + error.statusText);
                });
            MainService.getSlides()
                .then(function sucessCallback(data) {
                    vm.slides = angular.copy(data.data);
                }, function errorCallback(error) {
                    $log.error('Error:' + error.status + ' - Message: ' + error.statusText);
                });

            vm.myInterval = 5000;
            vm.noWrapSlides = false;
            vm.active = 0;
            vm.currIndex = 0;
        }
    }
})();
