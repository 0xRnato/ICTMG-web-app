class Courses {

	static save(objt) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			if (objt.id) {
				self.Course.get(objt.id, function(err, data) {
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
				self.Course.create(objt, function(err) {
					if (err) reject(err);
					fulfill(true);
				});
			}
		});
	}

	getCourses(objt, orm) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			if (objt) {
				self.Course.find(objt, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			} else {
				self.Course.find({category: orm.gt(0)}, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			}
		});
	}

	constructor(Course) {
		this.Course = Course;
	}
}

module.exports = (db) => {
	const Course = require('../models/course')(db);
	return new Courses(Course);
};
