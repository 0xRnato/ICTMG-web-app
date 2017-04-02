angular.module('appRoutes', []).config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
	$routeProvider
		.when('/', {
			templateUrl: 'views/home.html',
			controller: 'MainController'
		})
		.when('/users', {
			templateUrl: 'views/user.html',
			controller: 'UserController'
		});
	$locationProvider.html5Mode(true);
}]);