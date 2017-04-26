// Modules ================================================
const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const methodOverride = require('method-override');
const orm = require('orm');
const favicon = require('serve-favicon');
const app = express();

// Settings ===============================================
const configs = require('./app/configs');// config file
const port = process.env.PORT || configs.SV_PORT;
app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
// parse application/json
app.use(bodyParser.json());
// parse application/vnd.api+json as json
app.use(bodyParser.json({type: 'application/vnd.api+json'}));
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({extended: true}));
// override with the X-HTTP-Method-Override header in the request.
app.use(methodOverride('X-HTTP-Method-Override')); // simulate DELETE/PUT
// set the static files location /public/img will be /img for users
app.use(express.static(__dirname + '/public'));

// Databases ===============================================
const moodleDB = orm.connect(configs.DB_MOODLE, (err) => {
    if (err) return console.error('Connection error on MOODLEDB: ' + err);
    else {
        console.log('Connection with MOODLE database successfully completed.');
    }
});
const modelDB = orm.connect(configs.DB_MODELDB, (err) => {
    if (err) return console.error('Connection error on MODELDB: ' + err);
    else {
        console.log('Connection with MODELDB database successfully completed.');
    }
});

// Routes =================================================
require('./app/routes')(app, orm, moodleDB, modelDB); // load routes

// Start app ==============================================
app.listen(port);
console.log('Server running at http://localhost:' + port);
exports = module.exports = app;
