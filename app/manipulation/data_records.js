class DataRecords {

	static save(objt) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			if (objt.id) {
				self.DataRecord.get(objt.id, function(err, data) {
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
				self.DataRecord.create(objt, function(err) {
					if (err) reject(err);
					fulfill(true);
				});
			}
		});
	}

	static get(objt) {
		return new Promise(function(fulfill, reject) {
			if (objt) {
				self.DataRecord.find(objt, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			} else {
				self.DataRecord.find({}, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			}
		});
	}

	static getCalendar() {
		return new Promise(function(fulfill, reject) {
			self.DataRecord.find(
				{eventtype: 'site'}, ['timestart', 'Z'], 3,
				function(err, data) {
				if (err) reject(err);
				fulfill(data);
			});
		});
	}

	constructor(DataRecord) {
		this.DataRecord = DataRecord;
	}
}

module.exports = (db) => {
	const DataRecord = require('../models/data_records')(db);
	return new DataRecords(DataRecord);
};
