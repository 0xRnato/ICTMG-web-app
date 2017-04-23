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
			.when('/contact', {
				templateUrl: 'views/contact.html',
				controller: 'ContactController',
				controllerAs: 'contactController',
			})
			.when('/about1', {
				templateUrl: 'views/about1.html',
			})
			.when('/about2', {
				templateUrl: 'views/about2.html',
			})
			.when('/about3', {
				templateUrl: 'views/about3.html',
			})
			.when('/about4', {
				templateUrl: 'views/about4.html',
			})
			.when('/about5', {
				templateUrl: 'views/about5.html',
			})
			.when('/course', {
				templateUrl: 'views/course.html',
			})
			.when('/registration', {
				templateUrl: 'views/registration.html',
				controller: 'RegistrationController',
				controllerAs: 'registrationController',
			})
			.when('/terms', {
				templateUrl: 'views/terms.html',
				controller: 'TermsController',
				controllerAs: 'termsController',
			})
			.when('/free', {
				templateUrl: 'views/free-products.html',
				controller: 'FreeProductsController',
				controllerAs: 'freeProductsController',
			})
			.when('/paid', {
				templateUrl: 'views/paid-products.html',
			})
			.when('/services', {
				templateUrl: 'views/services.html',
			})
			.when('/donation', {
				templateUrl: 'views/donation.html',
			})
			.when('/singin', {
				templateUrl: 'views/singin.html',
			})
			.otherwise({redirectTo: '/'});
	}
}());
