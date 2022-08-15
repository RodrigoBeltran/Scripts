fx_version 'cerulean'
game 'gta5'

description 'QB-Phone'
version '1.1.0'

ui_page 'html/index.html'

shared_scripts {
    'config.lua',
	'@qb-core/import.lua',
    '@qb-apartments/config.lua',
    '@qb-garages/SharedConfig.lua',
}

client_scripts {
    'client/main.lua',
    'client/animation.lua'
}

server_script 'server/main.lua'

files {
    'html/sounds/*.ogg',
    'html/*.html',
    'html/build/*.js',
    'html/js/*.js',
    'html/img/*.png',
    'html/css/*.css',
    'html/fonts/*.ttf',
    'html/fonts/*.otf',
    'html/fonts/*.woff',
    'html/img/backgrounds/*.png',
    'html/img/backgrounds/*.gif',
    'html/img/apps/*.png',
    'html/css/bankgothic.ttf'
}

exports {
    'InPhone'
}