fx_version 'cerulean'
games { 'gta5' }

shared_scripts { 'config.lua', '@qb-core/import.lua' }

client_scripts { 'client/*.lua' }

files { 'html/*', 'html/img/*', 'html/sounds/*' }
ui_page 'html/ui.html'

server_scripts {
	"server/*.lua",
}