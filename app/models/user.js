// define our model
// user table example
module.exports = (db) => {
    const User = db.define('user', {
        id: {type: 'serial', key: true}, // Auto_increment key
        name: String,
        email: String,
        password: String,
    });
    return User;
};
