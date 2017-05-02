(function () {
    'use strict';

    angular
        .module('app')
        .run(runBlock)

    runBlock.$inject = ['$rootScope', '$location', '$window'];

    function runBlock($rootScope, $location, $window) {
        var history = [];

        $rootScope.$on('$routeChangeSuccess', function () {
            history.push($location.$$path);
        });

        $rootScope.back = function () {
            var prevUrl = history.length > 1 ? history.splice(-2)[0] : "/";
            $location.path(prevUrl);
            $window.scrollTo(0, 0);
        };
    }
}());
