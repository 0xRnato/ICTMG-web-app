module.exports = (app, db) => {
    //Load models
    var User = require('./models/user')(db);

    // Backend routes ======================================
    // Example find all users with ORM
    app.get('/api/users', (req, res) => {
        User.find({}, (err, users) => {
            if (err) res.send(err);
            res.json(users);
        });
    });
    // Frontend routes ====================================
    // route to handle all angular requests
    app.get('*', (req, res) => {
        res.sendFile('./public/index.html'); // load our public/index.html file
    });
};