var express = require('express');
var router = express.Router();
var database = require('../database');
var connection = database.createConnection('moodle');

/* GET event page. */
router.get('/', function (req, res, next) {
});

module.exports = router;