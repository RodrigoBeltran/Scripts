fx_version 'adamant'

game 'gta5'

description 'Origen Notification System'

version '1.0.1'

ui_page 'html/ui.html'

files {

    'html/logo.png',
    'html/noty.css',
    'html/noty.css.map',
    'html/noty.min.js',
    'html/noty.min.js.map',
    'html/script.js',
    'html/style.css',
    'html/ui.html',
    'html/bankgothic.ttf',
    'html/helptext.ogg',
    'html/pop.ogg'
}

client_scripts {
    'client/main.lua',
}

export {
	'Notify'
}