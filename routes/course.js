var express = require('express');
var router = express.Router();
var connection = require('../database');
var dateformat = require('dateformat');

/* GET course page */
router.get('/', function (req, res) {
    connection.query("SELECT category.name as 'category', course.fullname as 'fullname', course.shortname as 'shortname', course.summary as 'sumary', FROM_UNIXTIME(course.startdate) as 'startdate', FROM_UNIXTIME(course.enddate) as 'enddate' from mdl_course as course join mdl_course_categories as category on course.category = category.id WHERE course.id = " + req.query.course_select, (err, results, fields) => {
        if(err) throw err;
        results[0].startdate = dateformat(results[0].startdate, "dd/mm/yyyy");
        results[0].enddate = dateformat(results[0].enddate, "dd/mm/yyyy");
        results[0].sumary = results[0].sumary.replace(/<([^>]*script+?)([^>]*?)>(.*?)<\/\1>/g,"").replace(/<(?:.|\n)*?>/g, "").replace(/&(nbsp|amp|quot|lt|gt);/g,"");
        res.render('course',{
            course:results[0]
        });
    });
});

module.exports = router;