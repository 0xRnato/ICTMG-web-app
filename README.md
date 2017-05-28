# ICTMG-web-app
Website for presentation and registration of new GUIGA students with *NodeJs*, *ExpressJs*, *MySQL* and *AngularJs*.

[![Coverage Status](https://coveralls.io/repos/github/zRnatoNeto/ICTMG-web-app/badge.svg?branch=master)](https://coveralls.io/github/zRnatoNeto/ICTMG-web-app?branch=master)

This app are running at: [http://www.guigainstituto.org.br/](http://www.guigainstituto.org.br/ "GUIGA")

## Installing and running locally
You need to have already installed **NodeJs**, **NPM**, **Bower** and **MySQL Server** in your PC and navigate to the project folder in your terminal.

To create the database, just run the following command lines on your terminal:

    mysql -u root -p

Type the root password in your MySQL Server and run:

    CREATE DATABASE modelDB;
    USE modelDB;
    \. modelDB.sql
    CREATE DATABASE moodle;
    USE moodle;
    \. moodle.sql

To leave from mysql type:

    exit;

Then just run:

    npm install
    bower install
    gulp
    
And in another terminal:

    npm start

And the application will be runing at: [http://localhost:8080/](http://localhost:8080/ "Localhost address")
