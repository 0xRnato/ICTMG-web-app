module.exports = (app, db) => {
	const Users = require('./manipulation/user')(db);
	const DataRecords = require('./manipulation/data_records')(db);
	const Courses = require('./manipulation/course')(db);
	const Register = require('./manipulation/register')(db);

	// Backend routes ======================================
	// get users
	app.get('/api/users', (req, res) => {
		// load user
		Users.getUser(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// new/edit user
	app.post('/api/users', (req, res) => {
		// check if object have id to replace data in db
		Users.save(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// get courses
	app.get('/api/courses', (req, res) => {
		// check if object have id to replace data in db
		Courses.getCourses(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				console.log(error);
				res.send(error);
			});
	});

	// new/edit course
	app.post('/api/courses', (req, res) => {
		// check if object have id to replace data in db
		Courses.save(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				console.log(error);
				res.send(error);
			});
	});

	// get events
	app.get('/api/events', (req, res) => {
		DataRecords.get(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				console.log(error);
				res.send(error);
			});
	});

	// new/edit events
	app.post('/api/events', (req, res) => {
		// check if object have id to replace data in db
		DataRecords.save(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				console.log(error);
				res.send(error);
			});
	});

	// get events
	app.get('/api/caledar', (req, res) => {
		DataRecords.getCalendar()
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				console.log(error);
				res.send(error);
			});
	});

	// post registrations
	app.post('/api/register', (req, res) => {
		Register.save(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
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
