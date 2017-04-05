module.exports = (app, db) => {
	var Users = require('./manipulation/user')(db);

	// Backend routes ======================================
	// Example find all users with ORM
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

	// Frontend routes ====================================
	// route to handle all angular requests
	app.get('*', (req, res) => {
		res.sendFile('./public/index.html'); // load our public/index.html file
	});
};