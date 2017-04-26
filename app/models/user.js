module.exports = (modelDB) => {
    const User = modelDB.define('tbl_user', {
        id: {type: 'serial', key: true},
        username: String,
        password: String,
        fullname: String,
        email: String,
    });
    return User;
};
