// define our model
// user table example
module.exports = (db) => {
    var User = db.define('user', {
        id: { type: 'serial', key: true },//Auto_increment key
        name: { type: 'text' }
    });
};