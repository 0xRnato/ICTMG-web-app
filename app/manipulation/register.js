class Register {

	static save(objt) {
		return new Promise(function(fulfill, reject) {
			console.log(objt);
			fulfill(true);
		});
	}

}

module.exports = (db) => {
	return Register;
};
