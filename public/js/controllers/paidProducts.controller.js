(function(){
    'use strict';

    angular
        .module('app.products')
        .controller('PaidProductsController', PaidProductsController)

    PaidProductsController.$inject = ['$log', '$uibModal', '$rootScope'];

    function PaidProductsController($log, $uibModal, $rootScope) {
        var vm = this;

        vm.products = [];
        activate();

        vm.setProduct = function(id){
            $rootScope.tittle = vm.products[id].tittle;
            $rootScope.text = vm.products[id].text;
            $rootScope.image = vm.products[id].image;
            $rootScope.value = vm.products[id].value;
            $rootScope.paymentLink = vm.products[id].paymentLink;
            openModal();
        };

        function openModal() {
            $uibModal.open({
            animation: true,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'paidModal.html',
            controller: 'PaidModalController',
            controllerAs: 'paidModalController',
            size: 'lg',
            appendTo: undefined,
            resolve: {}
            });
        }

        function activate() {
            vm.products = [
                {
                    tittle: 'Song Book Família Guiga Edição Trilingue -  Português/Espanhol/Inglês',
                    text: 'Este livro é um dos resultados do projeto Memorial Família Guiga – MFG, que viabilizou o registro cultural, bem como produtos, acerca da produção musical centenária dos compositores da Família Guiga, cuja a principal origem está na linguagem musical popular do choro. Estudantes, músicos profissionais e amadores terão a oportunidade de desfrutar de um material que vem facilitar a execução do repertório. E, para além do uso artístico, este Livro de Canções se revela como uma ferramenta pedagógica. É também uma referência útil ao aprendizado e ampliação do vocabulário e dos gêneros deste estilo de música instrumental brasileira, que anima bailes tradicionais até os dias de hoje.',
                    image: './../img/paid_product1.png',
                    value: 'R$ 45,00',
                    paymentLink: '',
                },
                {
                    tittle: 'Direitos Autorais, Culturas Populares e Conhecimentos Tradicionais',
                    text: '"Em tempos nos quais a criatividade, apesar de ser um atributo do intelecto humano, é quase um imperativo aos obreiros da economia imaterial da sociedade da informação, o livro de Paloma Goulart desponta com traços de novidade e de originalidade – requisito indispensável de toda obra intelectual. Na contramão de boa parte da literatura jurídica nacional, inclusive sobre direitos autorais, acostumada a repetir e reproduzir dogmatismos e fetichismos legais, a autora enfrenta e desmistifica ilusões acerca do grau de proteção conferido pelo ordenamento jurídico aos conhecimentos tradicionais cujo locus de análise é frequentemente mapeado no território daquilo que concebemos como domínio público." Doutor Rodrigo Vieira Costa - Professor de Direito Público da Universidade Federal Rural do Semiárido – UFERSA e membro do Grupo de Estudos e Pesquisas em Direitos Culturais – GEPDC.',
                    image: './../img/paid_product2.png',
                    value: 'R$ 57,00',
                    paymentLink: '',
                },
                {
                    tittle: 'CD Vaê Volta - Músicas Populares de Tradição Centenária da Família Guiga',
                    text: 'CD Vaê Volta apresenta uma coletânea de músicas da tradição musical da Família Guiga. Interpretado por 4 músicos (João, Xisto, Antônio e Célio de Guiga), as músicas revistam o imaginário dos gêneros que compõem a suíte popular da família.',
                    image: './../img/paid_product3.png',
                    value: 'R$ 22,00',
                    paymentLink: '',
                }
            ];
        }
    }
})();
