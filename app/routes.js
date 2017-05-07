module.exports = (app, orm, moodleDB, modelDB, path) => {
	const Courses = require('./manipulation/course')(moodleDB);
	const Calendars = require('./manipulation/calendar')(modelDB);
	const Candidates = require('./manipulation/candidate')(modelDB);
	const Newss = require('./manipulation/news')(modelDB);
	const Notes = require('./manipulation/note')(modelDB);
	const Slides = require('./manipulation/slide')(modelDB);
	const Users = require('./manipulation/user')(modelDB);

	// Backend routes ======================================
	// load users
	app.get('/api/users', (req, res) => {
		// load user
		Users.load(req.body)
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

	app.post('/api/singin', (req, res) => {
		Users.singin(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// load Course
	app.get('/api/courses', (req, res) => {
		// check if object have id to replace data in db
		Courses.load(req.body, orm)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				console.log(error);
				res.send(error);
			});
	});

	// load calendar
	app.get('/api/calendar', (req, res) => {
		Calendars.load(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				console.log(error);
				res.send(error);
			});
	});

	// new/edit calendar
	app.post('/api/calendar', (req, res) => {
		// check if object have id to replace data in db
		Calendars.save(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				console.log(error);
				res.send(error);
			});
	});

	// get candidate
	app.get('/api/candidate', (req, res) => {
		// load candidate
		Candidates.load(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// new/edit candidate
	app.post('/api/candidate', (req, res) => {
		// check if object have id to replace data in db
		Candidates.save(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// get news
	app.get('/api/news', (req, res) => {
		// load news
		Newss.load(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// new/edit news
	app.post('/api/news', (req, res) => {
		// check if object have id to replace data in db
		Newss.save(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// get notes
	app.get('/api/notes', (req, res) => {
		// load notes
		Notes.load(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// new/edit notes
	app.post('/api/notes', (req, res) => {
		// check if object have id to replace data in db
		Notes.save(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// get slides
	app.get('/api/slides', (req, res) => {
		// load slides
		Slides.load(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// new/edit slides
	app.post('/api/slides', (req, res) => {
		// check if object have id to replace data in db
		Slides.save(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});


	// Frontend routes ====================================
	// route to handle all angular requests
	app.get('*', (req, res) => {
		res.sendFile(path.resolve('public/index.html'));
	});
};
