'use strict';

let lint = require('mocha-eslint');
let paths = ['.'];
let options = {formatter: 'table'};

lint(paths, options);
