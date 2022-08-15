fx_version 'adamant'

game 'gta5'

author 'okok#3488'
description 'okokTalkToNPC'

ui_page 'web/ui.html'

files {
	'web/*.*'
}

shared_scripts {
	'config.lua',
	'@qb-core/import.lua',
}

client_scripts {
	'client.lua',
}

server_scripts {
	'server.lua',
}