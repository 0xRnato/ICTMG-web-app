module.exports = (app, db) => {
	var Users = require('./manipulation/user')(db);
	var Courses = require('./manipulation/course')(db);

	// Backend routes ======================================
	// get users
	app.get('/api/users', (req, res) => {
		// load user
		Users.getUser(req.body)
			.then(data => {
				res.send(data);
			})
			.catch(error => {
				res.send(error);
			});
	});

	// new/edit user
	app.post('/api/users', (req, res) => {
		// check if object have id to replace data in db
		Users.save(req.body)
			.then(data => {
				res.send(data);
			})
			.catch(error => {
				res.send(error);
			});
	});

	// get courses
	app.get('/api/courses', (req, res) => {
		// check if object have id to replace data in db
		Courses.getCourses(req.body)
			.then(data => {
				res.send(data);
			})
			.catch(error => {
				console.log(error);
				res.send(error);
			});
	});

	// new/edit course
	app.post('/api/courses', (req, res) => {
		// check if object have id to replace data in db
		Courses.save(req.body)
			.then(data => {
				res.send(data);
			})
			.catch(error => {
				console.log(error);
				res.send(error);
			});
	});

	// Frontend routes ====================================
	// route to handle all angular requests
	app.get('*', (req, res) => {
		res.sendFile('./public/index.html'); // load our public/index.html file
	});
};