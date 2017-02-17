var express = require('express');
var router = express.Router();
var connection = require('../database');

/* POST course page */
router.get('/', function (req, res) {
    console.log(req.query.course_select);
    res.render('course');
});

module.exports = router;
