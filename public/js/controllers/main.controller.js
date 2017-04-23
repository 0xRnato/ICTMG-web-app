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
        vm.myInterval;
        vm.noWrapSlides;
        vm.active;
        vm.currIndex;
        vm.slides;

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
            vm.myInterval = 5000;
            vm.noWrapSlides = false;
            vm.active = 0;
            vm.currIndex = 0;
            vm.slides = [
                {
                    id: 0,
                    text: 'GUIGA é uma organização comprometida com o fomento e difusão da cultura e da educação, por isso realiza e o apoia ações, projetos e programas nessas áreas.',
                    image: './../img/slide1.jpg',
                },
                {
                    id: 1,
                    text: 'Formamos e capacitamos pessoas para o desenvolvimento do protagonismo, da responsabilidade e aprimoramento profissional, visando a busca de resultados efetivos.',
                    image: './../img/slide2.jpg',
                },
                {
                    id: 2,
                    text: 'Disponibilizamos capacitações profissionalizantes de qualidade, à distância, à preços acessíveis e com certificação.',
                    image: './../img/slide3.jpg',
                }
            ];
        }
    }
})();
