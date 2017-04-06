class DataRecords {

	static save(objt) {
		return new Promise(function(fulfill, reject) {
			if(objt.id) {
	            DataRecord.get(objt.id, function (err, data) {

	                // replace data of db object
	                for(let i in data) {
	                    data[i] = objt[i];
	                }

	                // saving changes
	                data.save(function(err) {
	                    if (err) reject(err);
	                    fulfill(data);
	                })

	            });
	        } else {
	            // create a new object in db and save
	            DataRecord.create(objt, function (err) {
	                if (err) reject(err);
	                fulfill(true);
	            });
	        }
		});
	}

	static getDataRecord(objt) {
		return new Promise(function(fulfill, reject) {
			if(objt) {
				DataRecord.find(objt, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			} else {
				DataRecord.find({}, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			}
		});
	}
}

module.exports = (db) => {
	var DataRecord = require('../models/data_records')(db);
	return DataRecords;
};
