(function(){
    'use strict';

    angular
        .module('app.products')
        .controller('FreeProductsController', FreeProductsController)

    FreeProductsController.$inject = ['$log', '$uibModal', '$rootScope'];

    function FreeProductsController($log, $uibModal, $rootScope) {
        var vm = this;

        vm.products = [];
        activate();

        vm.setProduct = function(id){
            $rootScope.tittle = vm.products[id].tittle;
            $rootScope.text = vm.products[id].text;
            $rootScope.image = vm.products[id].image;
            $rootScope.downloadLink = vm.products[id].downloadLink;
            openModal();
        };

        function openModal() {
            $uibModal.open({
            animation: true,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'freeModal.html',
            controller: 'FreeModalController',
            controllerAs: 'freeModalController',
            size: 'md',
            appendTo: undefined,
            resolve: {}
            });
        }

        function activate() {
            vm.products = [
                {
                    tittle: 'Catálogo de Memórias da tradição Musical da Família Guiga',
                    text: 'O livro apresenta um registro de memórias a respeito da tradição musical centenária da Família Guiga, sob a forma de um inventário da música popular da Zona da Mata de Minas Gerais.',
                    image: './../img/free_product1.jpg',
                    downloadLink: '',
                },
                {
                    tittle: 'Artigo',
                    text: 'O artigo discute a construção social do patrimônio cultural e sua efetivação em direito no Brasil, identifica alguns agentes centrais desse processo e aponta para alguns problemas políticos e jurídicos envolvidos nas tentativas recentes de efetivação de direitos culturais.',
                    image: './../img/free_product2.jpg',
                    downloadLink: '',
                }
            ];
        }
    }
})();
