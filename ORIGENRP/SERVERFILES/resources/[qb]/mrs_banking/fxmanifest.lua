fx_version 'cerulean'
game 'gta5'

description 'mrs_banking'
version '1.0.0'

shared_scripts { 
    '@es_extended/locale.lua',
	'config/config.lua',
}

server_scripts {
    'server/wrappers/business.lua',
    'server/wrappers/useraccounts.lua',
    'server/wrappers/gangs.lua',
    'server/main.lua'
}

client_scripts {
    'client/main.lua',
    'client/nui.lua'
}

ui_page 'nui/index.html'

files {
    'nui/images/logo.png',
    'nui/scripting/jquery-ui.css',
    'nui/scripting/external/jquery/jquery.js',
    'nui/scripting/jquery-ui.js',
    'nui/style.css',
    'nui/index.html',
    'nui/qb-banking.js',
    'nui/bankgothic.ttf',
    'nui/images/logo-animado.svg',
    'nui/bankon.ogg',
    'nui/cargado.ogg',
    'nui/spanish.json'

}