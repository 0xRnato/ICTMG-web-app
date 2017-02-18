var express = require('express');
var database = require('../database');
var connection = database.createConnection('db_newUser');
var appConstants = require('../appConstants');
var router = express.Router();

//GET register
router.get('/', (req, res) => {
    res.render('register', {
        title: 'GUIGA | Cadastrar',
        popup: false
    });
});

//POST register
router.post('/', (req, res) => {
    var username = req.body.user_username;
    var email = req.body.user_email;
    var firstname = req.body.user_firstname;
    var lastname = req.body.user_lastname;
    var cpf = req.body.user_cpf;
    var phone = req.body.user_phone;
    var street = req.body.user_street;
    var house_number = req.body.user_house_number;
    var city = req.body.user_city;
    var cep = req.body.user_cep;
    var cellphone = req.body.user_cellphone;
    var webpage = req.body.user_webpage;
    var skype = req.body.user_skype;


    connection.query("INSERT INTO tbl_user (username,email,firstname,lastname,cpf,phone,street ,house_number,city,cep,cellphone,webpage,skype) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);", [username, email, firstname, lastname, cpf, phone, street, house_number, city, cep, cellphone, webpage, skype], (err) => {
        if (err) throw err;
        res.render('register', {
            title: 'GUIGA | Cadastrar',
            popup: true
        });
    });
});

module.exports = router;