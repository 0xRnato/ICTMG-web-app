(function() {
	'use strict';

	angular
		.module('appRoutes', [])
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
				controller: 'AboutController',
				controllerAs: 'aboutController',
			})
			.when('/course', {
				templateUrl: 'views/course.html',
				controller: 'CourseController',
				controllerAs: 'courseController',
			})
			.when('/registration', {
				templateUrl: 'views/registration.html',
				controller: 'RegistrationController',
				controllerAs: 'registrationController',
			})
			.when('/content', {
				templateUrl: 'views/content.html',
				controller: 'ContentController',
				controllerAs: 'contentController',
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
