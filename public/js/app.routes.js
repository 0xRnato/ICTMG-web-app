(function() {
	'use strict';

	angular
		.module('app.routes')
		.config(RoutesConfig);

	RoutesConfig.$inject = ['$routeProvider', '$locationProvider'];

	function RoutesConfig($routeProvider, $locationProvider) {
		$locationProvider.hashPrefix('');
		$routeProvider
			.when('/', {
				templateUrl: 'views/home.html',
				controller: 'MainController',
				controllerAs: 'mainController',
			})
			.when('/about', {
				templateUrl: 'views/about.html',
			})
			.when('/course', {
				templateUrl: 'views/course.html',
			})
			.when('/registration', {
				templateUrl: 'views/registration.html',
				controller: 'RegistrationController',
				controllerAs: 'registrationController',
			})
			.when('/products', {
				templateUrl: 'views/products.html',
				controller: 'ProductsController',
				controllerAs: 'productsController',
			})
			.when('/services', {
				templateUrl: 'views/services.html',
				controller: 'ServicesController',
				controllerAs: 'servicesController',
			})
			.when('/singin', {
				templateUrl: 'views/singin.html',
				controller: 'SinginController',
				controllerAs: 'singinController',
			})
			.otherwise({redirectTo: '/'});
	}
}());
