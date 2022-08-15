fx_version 'adamant'

game 'gta5'

loadscreen_manual_shutdown "yes"

description 'Origen LoadingScreen System'

version '1.0.1'

loadscreen 'index.html'


files {
	'index.html',
    'css/bootstrap.min.css',
    'css/ionicons.min.css',
    'css/style.css',
    'fonts/fontawesome-webfont.woff2',
    'fonts/ionicons.ttf',
    'img/*.png',
    'img/*.jpg',
    'js/bootstrap.min.js',
    'js/jquery.easings.min.js',
    'js/jquery.mb.YTPlayer.js',
    'js/jquery.mCustomScrollbar.js',
    'js/jquery.min.js',
    'js/main-youtube.js',
    'js/main.js',
    'js/modernizr.custom.js',
    'js/photoswipe-ui-default.js',
    'js/photoswipe.js',
    'js/velocity.min.js',
    'js/velocity.ui.min.js',
    'js/app.js',
    'cargando.mp4',
    'bg.mp3'
}

client_script "client.lua"

