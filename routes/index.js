var express = require('express');
var router = express.Router();
var database = require('../database');
var connection = database.createConnection('moodle');

/* GET home page. */
router.get('/', function (req, res, next) {
	var teste = [];
	var teste2 = [];
	connection.query("SELECT course.id as 'id', course.fullname as 'name' FROM mdl_course as course;", (err, results, fields) => {
		if (err) throw err;
		res.render('index', {
			title: 'GUIGA',
			results: results
		});
	});
	// connection.query("SELECT id, name FROM mdl_event WHERE eventtype = 'site';", (err, results, fields) => {
	// 	if (err) throw err;
	// 	teste2 = results;
	// });
	// console.log(teste);
	// console.log(teste2);
	// res.send(teste);
});

module.exports = router;