angular.module('MainCtrl', []).controller('MainController', function ($scope, $http) {
    var init;

    init = function() {
        $scope.calendar = [];
        $http.get('api/caledar')
	  		.then(function sucessCallback(data) {
                  $scope.calendar = data.data;
			}, function errorCallback(error){
                console.log(error);
			});
    };

    return init();
});