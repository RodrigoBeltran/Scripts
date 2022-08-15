fx_version 'cerulean'

game 'gta5'

lua54 'yes'

server_scripts { 'server.lua' }

client_scripts { '@dpemotes/Config.lua', '@dpemotes/Client/AnimationList.lua', 'client.lua' }

ui_page 'build/index.html'

files {
    'build/*.json',
    'build/*.png',
    'build/*.html',
    'build/*.txt',
    'build/static/css/*.css',
    'build/static/js/*.js',
    'build/static/media/*.TTF',
    'build/static/media/*.otf',
    'build/static/media/*.png',
}