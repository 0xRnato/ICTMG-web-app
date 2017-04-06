angular.module('CourseCtrl', []).controller('CourseController', function ($scope, $http) {
    var init;

    init = function() {
        $scope.courses = [];
        $http.get('api/courses')
	  		.then(function sucessCallback(data) {
                  $scope.courses = data.data;
			}, function errorCallback(error){
                console.log(error);
			});
    };

    return init();
});