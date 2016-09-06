const gulp = require('gulp');
const plugins = require('gulp-load-plugins')();

gulp.task('styles', () => {
	return gulp
		.src('sass/main.scss')
		.pipe(plugins.sass({
			style: 'compressed'
		}).on('error', plugins.sass.logError))
		.pipe(gulp.dest('./public/stylesheets/'));
});

gulp.task('styles:watch', () => {
	return gulp.watch('sass/**/*.scss', [
		'styles'
	]);
});