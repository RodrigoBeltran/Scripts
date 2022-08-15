fx_version 'cerulean'
game 'gta5'

description 'QB-Multicharacter'
version '1.0.0'

ui_page 'html/index.html'

shared_script '@qb-core/import.lua'
client_script 'client/main.lua'
server_script 'server/main.lua'

files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/bootstrap.css',
    'html/script.js',
    'html/qbus-logo.png',
    'html/bankgothic.ttf',
    'html/click.ogg',
    'html/over_button.ogg',
    'html/background.ogg',
    'html/confirm.ogg',
    'html/particles.json',
    'html/particles.js',
    'html/consejo.ogg',
    'html/carga.svg',
    'html/bg.mp4',
    'html/transition.ogg'


}

dependencies {
    'qb-core',
    'qb-spawn'
}