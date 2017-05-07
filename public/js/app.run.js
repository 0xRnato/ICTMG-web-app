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

        $rootScope.$on('$locationChangeStart', function() {
            var restrictedPages = [
                '/admin'
            ];
            var restrictedPage = restrictedPages.indexOf($location.path()) == -1 ? false : true;
            var loggedIn = $rootScope.userSession;
            if (restrictedPage && !loggedIn) {
                $location.path('/singin');
            }
        });

        $rootScope.back = function () {
            var prevUrl = history.length > 1 ? history.splice(-2)[0] : "/";
            $location.path(prevUrl);
            $window.scrollTo(0, 0);
        };
    }
}());
