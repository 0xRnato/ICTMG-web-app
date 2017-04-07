// Modules ================================================
const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const methodOverride = require('method-override');
const orm = require('orm');
const favicon = require('serve-favicon');
const app = express();

// Settings ===============================================
const configs = require('./config/configs');// config file
const port = process.env.PORT || configs.PORT;
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

// Database ===============================================
const db = orm.connect(configs.DB, (err) => {// database connected instance
    if (err) return console.error('Connection error: ' + err);
    else {
        console.log('Connection with database successfully completed.');
    }
});

// Routes =================================================
require('./app/routes')(app, db); // load routes

// Start app ==============================================
app.listen(port);
console.log('Server running at http://localhost:' + port);
exports = module.exports = app;
