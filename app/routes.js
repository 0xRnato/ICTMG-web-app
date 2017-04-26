module.exports = (app, orm, moodleDB, modelDB) => {
	const Course = require('./manipulation/course')(moodleDB);
	const Calendar = require('./manipulation/calendar')(modelDB);
	const Candidate = require('./manipulation/candidate')(modelDB);
	const News = require('./manipulation/news')(modelDB);
	const Note = require('./manipulation/note')(modelDB);
	const Slide = require('./manipulation/slide')(modelDB);
	const User = require('./manipulation/user')(modelDB);

	// Backend routes ======================================
	// load users
	app.get('/api/users', (req, res) => {
		// load user
		User.load(req.body)
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
		User.save(req.body)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// load Course
	app.get('/api/Course', (req, res) => {
		// check if object have id to replace data in db
		Course.load(req.body, orm)
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
		Calendar.load(req.body)
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
		Calendar.save(req.body)
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
		Candidate.load(req.body)
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
		Candidate.save(req.body)
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
		News.load(req.body)
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
		News.save(req.body)
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
		Note.load(req.body)
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
		Note.save(req.body)
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
		Slide.load(req.body)
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
		Slide.save(req.body)
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
		res.sendFile('./public/index.html'); // load our public/index.html file
	});
};
