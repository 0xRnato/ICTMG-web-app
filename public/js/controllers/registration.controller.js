(function () {
    'use strict';

    angular
        .module('app.registration')
        .controller('RegistrationController', RegistrationController);

    RegistrationController.inject = [
        'RegisterService',
        '$log',
        '$location',
        '$document',
        '$rootScope'];

    function RegistrationController(RegisterService, $log, $location, $document, $rootScope) {
        var vm = this;

        function validarCPF(cpf) {
            cpf = cpf.replace(/[^\d]+/g, '');
            var numeros, digitos, soma, i, resultado, digitos_iguais;
            digitos_iguais = 1;
            if (cpf.length != 11 ||
                cpf == "00000000000" ||
                cpf == "11111111111" ||
                cpf == "22222222222" ||
                cpf == "33333333333" ||
                cpf == "44444444444" ||
                cpf == "55555555555" ||
                cpf == "66666666666" ||
                cpf == "77777777777" ||
                cpf == "88888888888" ||
                cpf == "99999999999")
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
            var idIsValid = String(vm.user.registerId).length == 8 ? true : false;
            var cpfIsValid = validarCPF(String(angular.copy(vm.user.registerCPF)));

            if (!emailIsValid) {
                alert('Verifique seu email');
            } else if (!phoneIsValid) {
                alert('Numero de telefone invalido');
            } else if (!idIsValid) {
                alert('Numero da carteira de identidade invalido');
            } else if (!cpfIsValid) {
                alert('Numero de CPF invalido');
            } else if (!$rootScope.selectedCourse) {
                alert('Selecione o curso que deseja se inscrever.');
                $location.path('/freeCourses');
            } else {
                if ($document[0].getElementById('schoolEducation1').checked) {
                    vm.user.schoolEducation = $document[0].getElementById('schoolEducation1').value;
                } else if ($document[0].getElementById('schoolEducation2').checked) {
                    vm.user.schoolEducation = $document[0].getElementById('schoolEducation2').value;
                } else if ($document[0].getElementById('schoolEducation3').checked) {
                    vm.user.schoolEducation = $document[0].getElementById('schoolEducation3').value;
                } else if ($document[0].getElementById('schoolEducation4').checked) {
                    vm.user.schoolEducation = $document[0].getElementById('schoolEducation4').value;
                } else if ($document[0].getElementById('schoolEducation5').checked) {
                    vm.user.schoolEducation = $document[0].getElementById('schoolEducation5').value;
                } else if ($document[0].getElementById('schoolEducation6').checked) {
                    vm.user.schoolEducation = $document[0].getElementById('schoolEducation6').value;
                } else if ($document[0].getElementById('schoolEducation7').checked) {
                    vm.user.schoolEducation = $document[0].getElementById('schoolEducation7').value;
                }

                if ($document[0].getElementById('numberOfCourses1').checked) {
                    vm.user.numberOfCourses = $document[0].getElementById('numberOfCourses1').value;
                } else if ($document[0].getElementById('numberOfCourses2').checked) {
                    vm.user.numberOfCourses = $document[0].getElementById('numberOfCourses2').value;
                } else if ($document[0].getElementById('numberOfCourses3').checked) {
                    vm.user.numberOfCourses = $document[0].getElementById('numberOfCourses3').value;
                }

                if ($document[0].getElementById('reasonForEntry1').checked) {
                    vm.user.reasonForEntry = $document[0].getElementById('reasonForEntry1').value;
                } else if ($document[0].getElementById('reasonForEntry2').checked) {
                    vm.user.reasonForEntry = $document[0].getElementById('reasonForEntry2').value;
                } else if ($document[0].getElementById('reasonForEntry3').checked) {
                    vm.user.reasonForEntry = $document[0].getElementById('reasonForEntry3').value;
                } else {
                    vm.user.reasonForEntry = vm.user.otherReasonForEntry;
                }

                vm.user.selectedCourse = $rootScope.selectedCourse;

                RegisterService.save(angular.copy(vm.user)).then(
                    function successCallback() {
                        alert('Cadastro realizado com sucesso.');
                        $location.path('/home');
                    }, function errorCallback() {
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
