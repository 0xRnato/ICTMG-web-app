(function() {
    'use strict';

    angular.module('app', [
        'ngRoute',
        'appRoutes',
        'MainCtrl',
        'AboutCtrl',
        'ContentCtrl',
        'CourseCtrl',
        'RegistrationCtrl',
        'ServicesCtrl',
        'SinginCtrl',
        'UserService',
    ]);
})();
