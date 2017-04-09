'use strict';

let lint = require('mocha-eslint');
let paths = ['.'];
let options = {formatter: 'html'};

lint(paths, options);
