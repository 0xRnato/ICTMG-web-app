// define our model
// user table example
module.exports = (db) => {
    return User = db.define('users', {
        id: { type: 'serial', key: true },//Auto_increment key
        name: String,
        email: String,
        password: String
    });
};