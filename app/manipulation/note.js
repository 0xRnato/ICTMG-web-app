class Users {

	static save(objt) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			if (objt.id) {
				self.Note.get(objt.id, function(err, data) {
					// replace data of db object
					for (let i in data) {
						if (data.hasOwnProperty(i))
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
				self.Note.create(objt, function(err) {
					if (err) reject(err);
					fulfill(true);
				});
			}
		});
	}

	static load(objt) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			if (objt) {
				self.Note.find(objt, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			} else {
				self.Note.find({}, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			}
		});
	}

	constructor(Note) {
		this.Note = Note;
	}
}

module.exports = (modelDB) => {
	const Note = require('../models/note')(modelDB);
	return new Users(Note);
};
