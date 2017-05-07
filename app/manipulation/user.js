class Users {

	save(objt) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			if (objt.id) {
				self.User.get(objt.id, function(err, data) {
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
				self.User.create(objt, function(err) {
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
				self.User.find(objt, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			} else {
				self.User.find({}, function(err, data) {
					if (err) reject(err);
					fulfill(data);
				});
			}
		});
	}

	singin(objt) {
		const self = this;
		return new Promise(function(fulfill, reject) {
			self.User.find({username: objt.username}, function(err, data) {
				if (err) reject(err);
				if (data.length > 0) {
					if (objt.password == data[0].password) {
						fulfill({
							status: 'success',
							username: data[0].username,
							fullname: data[0].fullname,
							email: data[0].email,
						});
					} else {
						fulfill({
							status: 'error',
							error: 'Senha invalida.',
						});
					}
				} else {
					fulfill({
						status: 'error',
						error: 'Usuário invalido ou não cadastrado.',
					});
				}
			});
		});
	}

	sendCallback(callback, data) {
		callback(data);
	}

	constructor(User) {
		this.User = User;
	}
}

module.exports = (modelDB) => {
	const User = require('../models/user')(modelDB);
	return new Users(User);
};
