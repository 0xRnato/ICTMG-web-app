class Users {

	static save(objt) {
		return new Promise(function(fulfill, reject) {
			if (objt.id) {
				User.get(objt.id, function(err, data) {
					// replace data of db object
					for (let i in data) {
						if (datahasOwnProperty(i))
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
				User.create(objt, function(err) {
					if (err) reject(err);
					fulfill(true);
				});
			}
		});
	}

	static getUser(objt) {
		return new Promise(function(fulfill, reject) {
			if (objt) {
				User.find(objt, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			} else {
				User.find({}, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			}
		});
	}
}

module.exports = (db) => {
	let User = require('../models/user')(db);
	return Users;
};
