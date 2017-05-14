class Candidates {

	save(objt) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			if (objt.id) {
				objt.registerIdPath = 'data/id/' + objt.id + '.jpg';
				objt.registerCpfPath = 'data/cpf/' + objt.id + '.jpg';
				objt.recommendationLetterPath =
					'data/recommendationletter/' + objt.id + '.jpg';
				self.Candidate.get(objt.id, function(err, data) {
					// replace data of db object
					for (let i in data) {
						if (data.hasOwnProperty(i))
							data[i] = objt[i];
					}

					// saving changes
					data.save(function(err) {
						if (err) reject(err);
						data.registerIdPath = objt.registerIdPath;
						data.registerCpfPath = objt.registerCpfPath;
						data.recommendationLetterPath = objt.recommendationLetterPath;
						fulfill(data);
					});
				});
			} else {
				// create a new object in db and save
				let lastId;
				self.Candidate.find({}, function(err, data) {
					if (err) reject(err);
					if (data.length > 0) {
						lastId = data[data.length - 1].id + 1;
						objt.registerIdPath = 'data/id/' + lastId + '.jpg';
						objt.registerCpfPath = 'data/cpf/' + lastId + '.jpg';
						objt.recommendationLetterPath =
							'data/recommendationletter/' + lastId + '.jpg';
					} else {
						objt.registerIdPath = 'data/id/1.jpg';
						objt.registerCpfPath = 'data/cpf/1.jpg';
						objt.recommendationLetterPath =
							'data/recommendationletter/1.jpg';
					}
					objt.status = 'Aguardando aprovação';
					delete objt.email2;
					objt.registerCpf = objt.registerCPF;
					delete objt.registerCPF;
					delete objt.registerCpfImg;
					delete objt.registerIdImg;
					delete objt.recommendationLetterImg;
					delete objt.otherReason;
					delete objt.otherReasonForEntry;
					objt.phone = String(objt.phone);
					objt.registerCpf = String(objt.registerCpf);
					objt.registerId = String(objt.registerId);
					objt.selectedCourse = objt.selectedCourse.fullname;
					self.Candidate.create(objt, function(err, data) {
						if (err) reject(err);
						data.registerIdPath = objt.registerIdPath;
						data.registerCpfPath = objt.registerCpfPath;
						data.recommendationLetterPath = objt.recommendationLetterPath;
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
				self.Candidate.find(objt, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			} else {
				self.Candidate.find({}, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			}
		});
	}

	sendCallback(callback, data) {
		callback(data);
	}

	constructor(Candidate) {
		this.Candidate = Candidate;
	}
}

module.exports = (modelDB) => {
	const Candidate = require('../models/candidate')(modelDB);
	return new Candidates(Candidate);
};
