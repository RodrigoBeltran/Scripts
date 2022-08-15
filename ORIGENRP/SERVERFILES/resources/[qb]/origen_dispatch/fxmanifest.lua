fx_version 'adamant'
game 'gta5'

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

shared_scripts {
    'config.lua',
    '@qb-core/import.lua'
}

ui_page 'ui/index.html'

files {
    'ui/*.html',
    'ui/*.js',
    'ui/vehicles/*.png',
    'ui/*.css',
    'ui/*.svg',
    'ui/*.png',
    'ui/*.ttf'
}