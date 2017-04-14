const gulp   = require('gulp');
const concat = require('gulp-concat');
const replace = require('gulp-replace');
const babel = require('gulp-babel');
// const rename = require('gulp-rename');
// const gutil  = require('gulp-util');
// const uglify = require('gulp-uglify');
// const watch  = require('gulp-watch');

gulp.task('default', ['watch', 'replace', 'minify-controllers', 'minify-services']);

gulp.task('watch', function() {
	gulp.watch('public/js/controllers/*.js', ['replace', 'minify-controllers']);
	gulp.watch('public/js/services/*.js', ['replace', 'minify-services']);
});

gulp.task('deploy', ['replace', 'minify-controllers', 'minify-services']);

gulp.task('minify-controllers', function() {
	return gulp
		.src([ 'public/js/controllers/*.js' ])
		.pipe(concat('controllers.js'))
		// .pipe(rename({ suffix: '.min' }))
		.pipe(babel({
			presets: ['es2015']
		}))
		.pipe(gulp.dest('public/dist'));
});

gulp.task('minify-services', function() {
	return gulp
		.src([ 'public/js/services/*.js' ])
		.pipe(concat('services.js'))
		// .pipe(rename({ suffix: '.min' }))
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
