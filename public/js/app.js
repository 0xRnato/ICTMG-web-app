(function() {
    'use strict';

    angular.module('app', [
        'ngAnimate',
        'ngTouch',

        'app.routes',
        'app.main',
        'app.contact',
        'app.about',
        'app.products',
        'app.course',
        'app.terms',
        'app.registration',
        'app.services',
        'app.user',

        'ui.bootstrap',
    ]);

    angular.module('app.routes', ['ngRoute']);
    angular.module('app.main', []);
    angular.module('app.contact', []);
    angular.module('app.about', []);
    angular.module('app.products', []);
    angular.module('app.course', []);
    angular.module('app.registration', []);
    angular.module('app.terms', []);
    angular.module('app.services', []);
    angular.module('app.user', []);
})();
