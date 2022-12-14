fx_version 'cerulean'
game 'gta5'

description 'QB-Skillbar'
version '1.0.0'

ui_page "html/index.html"
shared_script '@qb-core/import.lua'
client_script 'client/main.lua'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/bankgothic.ttf',
    'html/confirm.ogg',
    'html/error.ogg'
}

exports {
    'GetSkillbarObject'
}

dependencies {
    'qb-core'
}
