fx_version 'cerulean'
game 'gta5'

ui_page 'html/index.html'

files {
    "html/index.html",
    "html/dni.js",
    "html/app.js",
    "html/style.css",
    'html/bankgothic.ttf'
}

shared_script '@qb-core/import.lua'

client_scripts {
    'config.lua',
    'client/*.lua',
}

server_script {
    'server.lua'
}