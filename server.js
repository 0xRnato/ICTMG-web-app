// Modules ================================================
var express        = require('express');
var path           = require('path');
var bodyParser     = require('body-parser');
var methodOverride = require('method-override');
var orm            = require('orm');
var favicon        = require('serve-favicon');
var app            = express();

// Settings ===============================================
var configs = require('./config/configs');// config file
var port = process.env.PORT || configs.PORT;
app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(bodyParser.json()); // parse application/json 
app.use(bodyParser.json({ type: 'application/vnd.api+json' })); // parse application/vnd.api+json as json
app.use(bodyParser.urlencoded({ extended: true })); // parse application/x-www-form-urlencoded
app.use(methodOverride('X-HTTP-Method-Override')); // override with the X-HTTP-Method-Override header in the request. simulate DELETE/PUT
app.use(express.static(__dirname + '/public')); // set the static files location /public/img will be /img for users

// Database ===============================================
var db = orm.connect(configs.DB, (err) => {// database connected instance
    if(err) return console.error('Connection error: ' + err);
    else console.log('Connection with database successfully completed.');
});

// Routes =================================================
require('./app/routes')(app, db); // load routes

// Start app ==============================================
app.listen(port);
console.log('Server running at http://localhost:' + port);
exports = module.exports = app;