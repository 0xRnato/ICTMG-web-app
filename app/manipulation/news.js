class Newss {

	save(objt) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			if (objt.id) {
				objt.imagePath = 'data/news/' + objt.id + '.jpg';
				self.News.get(objt.id, function(err, data) {
					// replace data of db object
					for (let i in data) {
						if (data.hasOwnProperty(i))
							data[i] = objt[i];
					}

					// saving changes
					data.save(function(err) {
						if (err) reject(err);
						data.imagePath = objt.imagePath;
						fulfill(data);
					});
				});
			} else {
				// create a new object in db and save
				let lastId;
				self.News.find({}, function(err, data) {
					if (err) reject(err);
					if(data.length > 0) {
						lastId = data[data.length - 1].id + 1;
						objt.imagePath = 'data/news/' + lastId + '.jpg';
					} else {
						objt.imagePath = 'data/news/1.jpg';
					}
					self.News.create(objt, function(err, data) {
						if (err) reject(err);
						data.imagePath = objt.imagePath;
						fulfill(data);
					});
				});
			}
		});
	}

	load(objt) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			if (objt) {
				self.News.find(objt, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			} else {
				self.News.find({}, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			}
		});
	}

	sendCallback(callback, data) {
		callback(data);
	}

	constructor(News) {
		this.News = News;
	}
}

module.exports = (modelDB) => {
	const News = require('../models/news')(modelDB);
	return new Newss(News);
};
