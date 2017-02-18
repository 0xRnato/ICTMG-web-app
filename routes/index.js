var express = require('express');
var router = express.Router();
var database = require('../database');
var connection = database.createConnection('moodle');

/* GET home page. */
router.get('/', function (req, res, next) {
  connection.query("SELECT course.id as 'id', course.fullname as 'name' FROM mdl_course as course;", (err, results, fields) => {
    if(err) throw err;
    res.render('index', {
      title: 'GUIGA',
      results: results
    });
  });
});

module.exports = router;
