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
		let params = {};
		if(objt) {
			params = objt;
		}
		params.category = orm.gt(0);
		return new Promise(function(fulfill, reject) {
			objt.category = orm.gt(0);
			self.Course.find(objt, function(err, data) {
				if (err) reject(err);
				for(let i in data) {
					self.CourseCategories.getCourseCategorie(data[i].category)
						.then((category) => {
							data[i].category = category[0].name;
							if(i == data.length - 1) {
								self.sendCallback(fulfill, data);
							}
						})
						.catch((error) => {
							console.log(error);
						});
				}
			});
		});
	}

	sendCallback(callback, data) {
		callback(data);
	}

	constructor(Course, CourseCategories) {
		this.Course = Course;
		this.CourseCategories = CourseCategories;
	}
}

module.exports = (db) => {
	const Course = require('../models/course')(db);
	const CourseCategories = require('./course_categories')(db);
	return new Courses(Course, CourseCategories);
};
