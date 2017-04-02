angular.module('appRoutes', []).config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
	$routeProvider
		.when('/', {
			templateUrl: 'views/home.html',
			controller: 'MainController'
		})
		.when('/about', {
			templateUrl: 'views/about.html',
			controller: 'AboutController'
		})
		.when('/course', {
			templateUrl: 'views/course.html',
			controller: 'CourseController'
		})
		.when('/registration', {
			templateUrl: 'views/registration.html',
			controller: 'RegistrationController'
		})
		.when('/content', {
			templateUrl: 'views/content.html',
			controller: 'ContentController'
		})
		.when('/services', {
			templateUrl: 'views/services.html',
			controller: 'ServicesController'
		})
		.when('/singin', {
			templateUrl: 'views/singin.html',
			controller: 'SinginController'
		})
		.otherwise({ redirectTo: '/' });

	$locationProvider.html5Mode(true);
}]);