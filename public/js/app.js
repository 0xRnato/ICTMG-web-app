(function() {
    'use strict';

    angular.module('app', [
        'ngAnimate',
        'ngTouch',
        'ngSanitize',

        'app.routes',
        'app.main',
        'app.contact',
        'app.about',
        'app.products',
        'app.courses',
        'app.terms',
        'app.registration',
        'app.services',
        'app.admin',

        'ui.bootstrap',
    ]);

    angular.module('app.routes', ['ngRoute']);
    angular.module('app.main', []);
    angular.module('app.contact', []);
    angular.module('app.about', []);
    angular.module('app.products', []);
    angular.module('app.courses', []);
    angular.module('app.registration', []);
    angular.module('app.terms', []);
    angular.module('app.services', []);
    angular.module('app.admin', []);
})();

(function () {
    'use strict';

    angular
        .module ('app')
        .directive ('fileread', fileread);

    fileread.$inject = [];

    function fileread() {
        var directive = {
            link: link,
            restrict: 'EA',
            scope: {
                fileread: "="
            }
        };
        return directive;

        function link(scope, element, attrs) {
            element.bind("change", function (changeEvent) {
                var reader = new FileReader();
                reader.onload = function (loadEvent) {
                    scope.$apply(function () {
                        scope.fileread = loadEvent.target.result;
                    });
                }
                reader.readAsDataURL(changeEvent.target.files[0]);
            });
        }
    }

})();