(function() {
	'use strict';

	angular
		.module('app.routes')
		.config(RoutesConfig);

	RoutesConfig.$inject = ['$routeProvider', '$locationProvider'];

	function RoutesConfig($routeProvider, $locationProvider) {
		$locationProvider.hashPrefix('');
		$routeProvider
			.when('/home', {
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
			.when('/freeCourses', {
				templateUrl: 'views/free-courses.html',
			})
			.when('/paidCourses', {
				templateUrl: 'views/paid-courses.html',
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
			.when('/freeProducts', {
				templateUrl: 'views/free-products.html',
				controller: 'FreeProductsController',
				controllerAs: 'freeProductsController',
			})
			.when('/paidProducts', {
				templateUrl: 'views/paid-products.html',
				controller: 'PaidProductsController',
				controllerAs: 'paidProductsController',
			})
			.when('/services', {
				templateUrl: 'views/services.html',
			})
			.when('/donation', {
				templateUrl: 'views/donation.html',
			})
			.when('/singin', {
				templateUrl: 'views/singin.html',
				controller: 'SinginController',
				controllerAs: 'singinController',
			})
			.when('/admin', {
				templateUrl: 'views/admin.html',
				controller: 'AdminController',
				controllerAs: 'adminController',
			})
			.otherwise({redirectTo: '/home'});
	}
}());
