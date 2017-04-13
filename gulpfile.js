var gulp   = require('gulp');
var gutil  = require('gulp-util');
var uglify = require('gulp-uglify');
var watch  = require('gulp-watch');
var rename = require('gulp-rename');
var concat = require('gulp-concat');
var replace = require('gulp-replace');
const babel = require('gulp-babel');

gulp.task('default', ['watch', 'replace', 'minify', 'minify-services']);

gulp.task('watch', function() {
	gulp.watch('public/js/controllers/*.js', ['replace', 'minify', 'minify-services']);
});

gulp.task('deploy', ['replace', 'minify']);

gulp.task('minify', function() {
	return gulp
		.src([ 'public/js/controllers/*.js' ])
		.pipe(concat('all.js'))
		.pipe(rename({ suffix: '.min' }))
		.pipe(babel({
			presets: ['es2015']
		}))
		.pipe(gulp.dest('public/dist'));
});

gulp.task('minify-services', function() {
	return gulp
		.src([ 'public/js/services/*.js' ])
		.pipe(concat('services.js'))
		.pipe(babel({
			presets: ['es2015']
		}))
		.pipe(gulp.dest('public/dist'));
});

gulp.task('replace', function() {
	return gulp
		.src(['public/index.html'])
		.pipe(replace(/\w=[0-9]{13,13}/g, "v="+Date.now()))
		.pipe(gulp.dest('public/'));
});
