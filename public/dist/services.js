'use strict';

(function () {
    'use strict';

    angular.module('app.course').factory('CourseService', CourseService);

    CourseService.inject = ['$http'];
    function CourseService($http) {
        var service = {
            get: _get
        };

        return service;

        // Do something
        function _get() {
            return $http.get('/api/courses');
        }
    }
})();

(function () {
    'use strict';

    angular.module('app.main').factory('MainService', MainService);

    MainService.inject = ['$http'];
    function MainService($http) {
        var service = {
            getCalendar: _getCalendar
        };

        return service;

        // Do something
        function _getCalendar() {
            return $http.get('/api/caledar');
        }
    }
})();

(function () {
    'use strict';

    angular.module('app.course').factory('RegisterService', RegisterService);

    RegisterService.inject = ['$http'];
    function RegisterService($http) {
        var service = {
            post: _post
        };

        return service;

        // Do something
        function _post(data) {
            console.log(data);
            return $http.post('/api/register', data);
        }
    }
})();

(function () {
    'use strict';

    angular.module('app.user').controller('SinginController', SinginController);

    SinginController.inject = [];
    function SinginController() {
        // var vm = this;
        activate();

        // Do something

        function activate() {}
    }
})();

(function () {
    'use strict';

    angular.module('app.user').factory('UserService', UserService);

    UserService.inject = ['$http'];
    function UserService($http) {
        var service = {
            get: _get,
            create: _create,
            delete: _delete
        };

        return service;

        // Do something
        function _get() {
            return $http.get('/api/users');
        }
        function _create(userData) {
            return $http.post('/api/users', userData);
        }
        function _delete(id) {
            return $http.delete('/api/users' + id);
        }
    }
})();