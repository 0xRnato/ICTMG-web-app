class Courses {

	static save(objt) {
		return new Promise(function(fulfill, reject) {
			if (objt.id) {
				Course.get(objt.id, function(err, data) {
					// replace data of db object
					for (let i in data) {
						if(data.hasOwnProperty(i))
							data[i] = objt[i];
					}

					// saving changes
					data.save(function(err) {
						if (err) reject(err);
						fulfill(data);
					});
				});
			} else {
				// create a new object in db and save
				Course.create(objt, function(err) {
					if (err) reject(err);
					fulfill(true);
				});
			}
		});
	}

	static getCourses(objt) {
		return new Promise(function(fulfill, reject) {
			if (objt) {
				Course.find(objt, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			} else {
				Course.find({}, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			}
		});
	}
}

module.exports = (db) => {
	let Course = require('../models/course')(db);
	return Courses;
};
