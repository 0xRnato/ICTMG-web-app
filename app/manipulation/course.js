class Courses {

	load(objt, orm) {
		const self = this;
		let params = {};
		if (objt) {
			params = objt;
		}
		params.category = orm.gt(0);
		return new Promise(function(fulfill, reject) {
			objt.category = orm.gt(0);
			self.Course.find(objt, function(err, data) {
				if (err) reject(err);
				for (let i in data) {
					if (data[i]) {
						self.CourseCategories.getCourseCategorie(data[i].category)
							.then((category) => {
								data[i].category = category[0].name;
								if (i == data.length - 1) {
									self.sendCallback(fulfill, data);
								}
							})
							.catch((error) => {
								console.log(error);
							});
					}
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

module.exports = (moodleDB) => {
	const Course = require('../models/course')(moodleDB);
	const CourseCategories = require('./course_categories')(moodleDB);
	return new Courses(Course, CourseCategories);
};
