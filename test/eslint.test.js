'use strict';

let lint = require('mocha-eslint');
let paths = ['.'];
let options = {formatter: 'stylish'};

lint(paths, options);
