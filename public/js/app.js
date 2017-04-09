(function() {
    'use strict';

    angular.module('app', [
        'app.routes',
        'app.main',
        'app.about',
        'app.content',
        'app.course',
        'app.registration',
        'app.services',
        'app.user',
    ]);

    angular.module('app.routes', ['ngRoute']);
    angular.module('app.main', []);
    angular.module('app.about', []);
    angular.module('app.content', []);
    angular.module('app.course', []);
    angular.module('app.registration', []);
    angular.module('app.services', []);
    angular.module('app.user', []);
})();
