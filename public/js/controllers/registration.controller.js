(function () {
    'use strict';

    angular
        .module('app.registration')
        .controller('RegistrationController', RegistrationController);

    RegistrationController.inject = ['RegisterService', '$log'];
    function RegistrationController(RegisterService, $log) {
        var vm = this;

        function validaCPF(cpf) {
            var numeros, digitos, soma, i, resultado, digitos_iguais;
            digitos_iguais = 1;
            if (cpf.length < 11)
                return false;
            for (i = 0; i < cpf.length - 1; i++)
                if (cpf.charAt(i) != cpf.charAt(i + 1)) {
                    digitos_iguais = 0;
                    break;
                }
            if (!digitos_iguais) {
                numeros = cpf.substring(0, 9);
                digitos = cpf.substring(9);
                soma = 0;
                for (i = 10; i > 1; i--)
                    soma += numeros.charAt(10 - i) * i;
                resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
                if (resultado != digitos.charAt(0))
                    return false;
                numeros = cpf.substring(0, 10);
                soma = 0;
                for (i = 11; i > 1; i--)
                    soma += numeros.charAt(11 - i) * i;
                resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
                if (resultado != digitos.charAt(1))
                    return false;
                return true;
            }
            else
                return false;
        }

        vm.submit = function () {

            var phoneIsValid = isNaN(vm.user.phone) ? false : true;
            var emailIsValid = vm.user.email == vm.user.email2 ? true : false;
            var idIsValid = vm.user.registerId.lenght == 8 ? true : false;
            var cpfIsValid = validaCPF(vm.user.registerCpf);

            if (!emailIsValid) {
                alert('Verifique seu email');
            } else if (!phoneIsValid) {
                alert('Numero de telefone invalido');
            } else if (!idIsValid) {
                alert('Numero da carteira de identidade invalido');
            } else if (!cpfIsValid) {
                alert('Numero de CPF invalido');
            } else {
                RegisterService.save(vm.user).then(
                    function successCallback(){
                        alert('Cadastro realizado com sucesso.');
                        $location.path('/home');
                    }, function errorCallback(){
                        alert('Falha ao salvar os dados. Tente novamente.')
                    }
                )
            }
        }

        activate();

        function activate() {
        }
    }
})();
