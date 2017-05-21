module.exports = (app, orm, moodleDB, modelDB, path) => {
	const fs = require('fs');
	const Courses = require('./manipulation/course')(moodleDB);
	const Calendars = require('./manipulation/calendar')(modelDB);
	const Candidates = require('./manipulation/candidate')(modelDB);
	const Newss = require('./manipulation/news')(modelDB);
	const Notes = require('./manipulation/note')(modelDB);
	const Slides = require('./manipulation/slide')(modelDB);
	const Users = require('./manipulation/user')(modelDB);

	const decodeBase64Image = function(dataString, path) {
		let matches = dataString.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/);
		let response = {};

		if (matches.length !== 3) {
			return new Error('Invalid input string');
		}

		response.type = matches[1];
		response.data = new Buffer(matches[2], 'base64');
		fs.writeFile('public/' + path, response.data, function(err) {
			if (err) throw err;
		});
	};

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

	// new/edit candidate
	app.post('/api/candidate', (req, res) => {
		let registerIdImg = req.body.registerIdImg;
		let registerCpfImg = req.body.registerCpfImg;
		let recommendationLetterImg = req.body.recommendationLetter;
		Candidates.save(req.body)
			.then((data) => {
				decodeBase64Image(registerIdImg, data.registerIdPath);
				decodeBase64Image(registerCpfImg, data.registerCpfPath);
				decodeBase64Image(
					recommendationLetterImg,
					data.recommendationLetterPath);
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	app.post('/api/candidate/status', (req, res) => {
		Candidates.saveStatus(req.body.id, req.body.status)
			.then((data) => {
				res.send(data);
			})
			.catch((error) => {
				res.send(error);
			});
	});

	// get candidate
	app.post('/api/candidate/load', (req, res) => {
		// load candidate
		Candidates.load(req.body)
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
		let imageData = req.body.image;
		Newss.save(req.body)
			.then((data) => {
				decodeBase64Image(imageData, data.imagePath);
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
		let imageData = req.body.image;
		Slides.save(req.body)
			.then((data) => {
				decodeBase64Image(imageData, data.imagePath);
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
