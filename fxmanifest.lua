fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'dps-bags'
author 'DelPerroSands'
description 'Real bags for ox_inventory: one worn bag at a time, and the bag shows on the back (or the briefcase in hand)'
version '1.0.1'

shared_script '@ox_lib/init.lua'
shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

dependencies { 'ox_lib', 'ox_inventory' }
