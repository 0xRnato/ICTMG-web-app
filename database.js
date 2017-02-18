var mysql = require('mysql');
var appConstants = require('./appConstants');

module.exports.createConnection = (database) => {
  return mysql.createConnection({
    host: appConstants.DB_HOST,
    user: appConstants.DB_USER,
    password: appConstants.DB_PASSWORD,
    database: database,
    port: appConstants.DB_PORT
  });
}