class Calendars {

	save(objt) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			if (objt.id) {
				self.Calendar.get(objt.id, function(err, data) {
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
				self.Calendar.create(objt, function(err) {
					if (err) reject(err);
					fulfill(true);
				});
			}
		});
	}

	load(objt) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			if (objt) {
				self.Calendar.find(objt, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			} else {
				self.Calendar.find({}, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			}
		});
	}

	sendCallback(callback, data) {
		callback(data);
	}

	constructor(Calendar) {
		this.Calendar = Calendar;
	}
}

module.exports = (modelDB) => {
	const Calendar = require('../models/calendar')(modelDB);
	return new Calendars(Calendar);
};
