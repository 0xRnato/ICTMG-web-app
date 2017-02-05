var mysql = require('mysql');
var appConstants = require('./appConstants');

//Database connection
var connection = mysql.createConnection({
  host: appConstants.DB_HOST,
  user: appConstants.DB_USER,
  password: appConstants.DB_PASSWORD,
  database: appConstants.DB_NAME,
  port: appConstants.DB_PORT
});

module.exports = connection;