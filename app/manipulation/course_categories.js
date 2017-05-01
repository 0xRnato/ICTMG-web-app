class CourseCategories {

	getCourseCategorie(objt, orm) {
		const self = this;
		return new Promise(function(fulfill, reject) {
            self.CourseCategorie.find({id: objt}, function(err, data) {
                if (err) reject(err);
                fulfill(data);
            });
		});
	}

	sendCallback(callback, data) {
		callback(data);
	}

	constructor(CourseCategorie) {
		this.CourseCategorie = CourseCategorie;
	}
}

module.exports = (moodleDB) => {
	const CourseCategorie = require('../models/course_categories')(moodleDB);
	return new CourseCategories(CourseCategorie);
};
