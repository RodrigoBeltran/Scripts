fx_version 'adamant'
lua54 'yes'


game 'gta5'

client_scripts {
	'NativeUI.lua',
	'Config.lua',
	'Client/*.lua'
}

server_scripts {
	'Config.lua',
	'@qb-core/import.lua',
	'Server/*.lua'
}
