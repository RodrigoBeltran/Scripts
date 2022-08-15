QBShared = {}

local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(StringCharset, string.char(i)) end
for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

QBShared.RandomStr = function(length) -- QBShared.RandomStr falls under GPL License here: [esxlicense]/LICENSE
	if length > 0 then
		return QBShared.RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]
	else
		return ''
	end
end

QBShared.RandomInt = function(length)
	if length > 0 then
		return QBShared.RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

QBShared.SplitStr = function(str, delimiter)
	local result = { }
	local from  = 1
	local delim_from, delim_to = string.find( str, delimiter, from  )
	while delim_from do
		table.insert( result, string.sub( str, from , delim_from-1 ) )
		from  = delim_to + 1
		delim_from, delim_to = string.find( str, delimiter, from  )
	end
	table.insert( result, string.sub( str, from  ) )
	return result
end

QBShared.StarterItems = {
    ["phone"] = {amount = 1, item = "phone"},
    ["id_card"] = {amount = 1, item = "id_card"},
    ["driver_license"] = {amount = 1, item = "driver_license"},
}

QBShared.Items = {
	-- // WEAPONS
	["weapon_unarmed"] 				 = {["name"] = "weapon_unarmed", 		 	  	["label"] = "Puños", 						["weight"] = 1000, 		["type"] = "weapon",	["ammotype"] = nil, 					["image"] = "placeholder.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Puñetazos"},
	["weapon_knife"] 				 = {["name"] = "weapon_knife", 			 	  	["label"] = "Cuchillo", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_knife.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Instrumento compuesto por una hoja fija en el mango, que se utiliza para cortar o como arma."},
	["weapon_nightstick"] 			 = {["name"] = "weapon_nightstick", 		 	["label"] = "Porra de Policía", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_nightstick.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Arma usada por los policías o empleados de seguridad."},
	["weapon_hammer"] 				 = {["name"] = "weapon_hammer", 			 	["label"] = "Martillo", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_hammer.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Se utiliza para trabajos como romper cosas (piernas) y clavar clavos."},
	["weapon_bat"] 					 = {["name"] = "weapon_bat", 			 	  	["label"] = "Bate", 					    ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_bat.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Se usa para golpear pelotas en deportes (u otras cosas)"},
	["weapon_golfclub"] 			 = {["name"] = "weapon_golfclub", 		 	  	["label"] = "Palo de Golf", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_golfclub.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un palo utilizado para golpear la pelota en el golf."},
	["weapon_crowbar"] 				 = {["name"] = "weapon_crowbar", 		 	  	["label"] = "Palanca", 				    	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_crowbar.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una barra de hierro con un extremo aplanado, utilizada como palanca."},
	["weapon_pistol"] 				 = {["name"] = "weapon_pistol", 			 	["label"] = "Walther P99", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_pistol.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego pequeña diseñada para sostenerse en una mano."},
	["weapon_pistol_mk2"] 			 = {["name"] = "weapon_pistol_mk2", 			["label"] = "Pistola Mk II", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_pistolmk2.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego pequeña mejorada diseñada para sostenerse en una mano"},
	["weapon_combatpistol"] 		 = {["name"] = "weapon_combatpistol", 	 	  	["label"] = "Pistola de Combate", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_combatpistol.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego pequeña en versión de combate diseñada para sostenerse en una mano"},
	["weapon_appistol"] 			 = {["name"] = "weapon_appistol", 		 	  	["label"] = "Pistola AP", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_appistol.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego pequeña diseñada para sostenerse en una mano que es automática."},
	["weapon_pistol50"] 			 = {["name"] = "weapon_pistol50", 		 	  	["label"] = "Pistola .50 Cal", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_pistol50.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego calibre .50 diseñada para sostenerse con ambas manos"},
	["weapon_microsmg"] 			 = {["name"] = "weapon_microsmg", 		 	  	["label"] = "Micro SMG", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_microsmg.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una ametralladora ligera de mano"},
	["weapon_smg"] 				 	 = {["name"] = "weapon_smg", 			 	  	["label"] = "SMG", 							["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_smg.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Una ametralladora ligera de mano"},
	["weapon_assaultsmg"] 			 = {["name"] = "weapon_assaultsmg", 		 	["label"] = "SMG de Asalto", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_assaultsmg.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una versión de asalto de una ametralladora ligera de mano"},
	["weapon_assaultrifle"] 		 = {["name"] = "weapon_assaultrifle", 	 	  	["label"] = "Rifle de Asalto", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_assaultrifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un rifle automático de fuego rápido proporcionado por cargador diseñado para uso de infantería"},
	["weapon_carbinerifle"] 		 = {["name"] = "weapon_carbinerifle", 	 	  	["label"] = "Rifle Carabina", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_carbinerifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un rifle automático ligero"},
	["weapon_advancedrifle"] 		 = {["name"] = "weapon_advancedrifle", 	 	  	["label"] = "Rifle Avanzado", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_advancedrifle.png", ["unique"] = true, 		["useable"] = false, 	["description"] = "Una versión de asalto de un rifle automático de disparo rápido proporcionado por cargador diseñado para uso de militares."},
	["weapon_mg"] 					 = {["name"] = "weapon_mg", 				 	["label"] = "Ametralladora", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "weapon_mg.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma automática que dispara balas en rápida sucesión mientras se aprieta el gatillo."},
	["weapon_combatmg"] 			 = {["name"] = "weapon_combatmg", 		 	  	["label"] = "MG de Combate", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "weapon_combatmg.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una versión de combate de un arma automática que dispara balas en rápida sucesión mientras se aprieta el gatillo."},
	["weapon_pumpshotgun"] 			 = {["name"] = "weapon_pumpshotgun", 	 	  	["label"] = "Escopeta", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_pumpshotgun.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de ánima lisa con acción de bombeo para disparar pequeños tiros a corta distancia"},
	["weapon_sawnoffshotgun"] 		 = {["name"] = "weapon_sawnoffshotgun", 	 	["label"] = "Escopeta Recortada", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_sawnoffshotgun.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma de ánima lisa recortada para disparar pequeños tiros a corta distancia"},
	["weapon_assaultshotgun"] 		 = {["name"] = "weapon_assaultshotgun", 	 	["label"] = "Escopeta de Asalto", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_assaultshotgun.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Una versión de asalto de un arma de ánima lisa para disparar pequeños tiros a corta distancia."},
	["weapon_bullpupshotgun"] 		 = {["name"] = "weapon_bullpupshotgun", 	 	["label"] = "Escopeta Bullpup", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_bullpupshotgun.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma compacta de ánima lisa para disparar pequeños tiros a corta distancia"},
	["weapon_stungun"] 				 = {["name"] = "weapon_stungun", 		 	  	["label"] = "Taser", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_stungun.png", 		 ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma que dispara púas unidas por cables a las baterías, lo que provoca un parálisis temporal."},
	["weapon_sniperrifle"] 			 = {["name"] = "weapon_sniperrifle", 	 	  	["label"] = "Rifle Francotirador", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "weapon_sniperrifle.png", 	 ["unique"] = true, 	["useable"] = false, 	["description"] = "Un rifle de alta precisión y largo alcance."},
	["weapon_heavysniper"] 			 = {["name"] = "weapon_heavysniper", 	 	  	["label"] = "Francotirador Pesado", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "weapon_heavysniper.png", 	 ["unique"] = true, 	["useable"] = false, 	["description"] = "Un rifle mejorado de alta precisión y largo alcance."},
	["weapon_remotesniper"] 		 = {["name"] = "weapon_remotesniper", 	 	  	["label"] = "Francotirador Remoto", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER_REMOTE",	["image"] = "weapon_remotesniper.png", 	 ["unique"] = true, 	["useable"] = false, 	["description"] = "Un rifle portátil de alta precisión y largo alcance."},
	["weapon_grenadelauncher"] 		 = {["name"] = "weapon_grenadelauncher", 	  	["label"] = "Lanzagranadas", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "weapon_grenadelauncher.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma que dispara un proyectil de gran calibre especialmente diseñado, a menudo con una ojiva explosiva, de humo o de gas."},
	["weapon_grenadelauncher_smoke"] = {["name"] = "weapon_grenadelauncher_smoke", 	["label"] = "Lanzagranadas de Humo", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "weapon_smokegrenade.png", 	 ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma bomba que produce mucho humo cuando explota."},
	["weapon_rpg"] 					 = {["name"] = "weapon_rpg", 			      	["label"] = "RPG", 							["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RPG",				["image"] = "weapon_rpg.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Un lanzagranadas propulsado por cohetes"},
	["weapon_minigun"] 				 = {["name"] = "weapon_minigun", 		      	["label"] = "Minigun", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MINIGUN",			["image"] = "weapon_minigun.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una ametralladora portátil que consta de un grupo giratorio de seis cañones y capaz de disparar velocidades variables de hasta 6.000 disparos por minuto."},
	["weapon_grenade"] 				 = {["name"] = "weapon_grenade", 		      	["label"] = "Granada", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_grenade.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una bomba arrojadiza de mano"},
	["weapon_stickybomb"] 			 = {["name"] = "weapon_stickybomb", 		    ["label"] = "C4", 							["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_stickybomb.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una carga explosiva cubierta con un adhesivo que cuando se lanza contra un objeto se pega hasta que explota."},
	["weapon_smokegrenade"] 		 = {["name"] = "weapon_smokegrenade", 	      	["label"] = "Granada de Humo", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_c4.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Una carga explosiva que se puede detonar de forma remota."},
	["weapon_bzgas"] 				 = {["name"] = "weapon_bzgas", 			      	["label"] = "BZ Gas", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_bzgas.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un bote de gas que causa un dolor extremo."},
	["weapon_molotov"] 				 = {["name"] = "weapon_molotov", 		      	["label"] = "Molotov", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_molotov.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una bomba cruda hecha de una botella llena de un líquido inflamable y equipada con una mecha para encender."},
	["weapon_fireextinguisher"] 	 = {["name"] = "weapon_fireextinguisher",      	["label"] = "Extintor de fuego", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_fireextinguisher.png", 	["unique"] = true, 	["useable"] = false, 	["description"] = "Un dispositivo portátil que descarga un chorro de agua, espuma, gas u otro material para extinguir un incendio."},
	["weapon_petrolcan"] 			 = {["name"] = "weapon_petrolcan", 		 	  	["label"] = "Lata de gasolina", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PETROLCAN",		["image"] = "weapon_petrolcan.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un recipiente de líquido fuerte hecho de acero prensado"},
	["weapon_briefcase"] 			 = {["name"] = "weapon_briefcase", 		 	  	["label"] = "Maletin", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_briefcase.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un maletín"},
	["weapon_briefcase_02"] 		 = {["name"] = "weapon_briefcase_02", 	 	  	["label"] = "Maletin 2", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_briefcase2.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un maletín"},
	["weapon_ball"] 				 = {["name"] = "weapon_ball", 			 	  	["label"] = "Pelota", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_BALL",				["image"] = "weapon_ball.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Un objeto sólido o hueco esférico con forma de huevo que se patea, lanza o golpea en un juego."},
	["weapon_flare"] 				 = {["name"] = "weapon_flare", 			 	  	["label"] = "Pistola de Bengalas", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "weapon_flare.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un pequeño dispositivo pirotécnico utilizado para iluminación y señalización."},
	["weapon_snspistol"] 			 = {["name"] = "weapon_snspistol", 		 	  	["label"] = "Pistola SNS", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_snspistol.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego muy pequeña diseñada para ocultarse fácilmente"},
	["weapon_bottle"] 				 = {["name"] = "weapon_bottle", 			 	["label"] = "Botella Rota", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_bottle.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una botella rota"},
	["weapon_gusenberg"] 			 = {["name"] = "weapon_gusenberg", 		 	  	["label"] = "Thompson SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "weapon_gusenberg.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un rifle automático comúnmente conocido como tommy gun"},
	["weapon_specialcarbine"] 		 = {["name"] = "weapon_specialcarbine", 	 	["label"] = "Carabina especial", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_specialcarbine.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un rifle de asalto extremadamente versátil para cualquier situación de combate."},
	["weapon_heavypistol"] 			 = {["name"] = "weapon_heavypistol", 	 	  	["label"] = "Pistola Pesada", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_heavypistol.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego resistente diseñada para sostenerse en una mano."},
	["weapon_bullpuprifle"] 		 = {["name"] = "weapon_bullpuprifle", 	 	  	["label"] = "Rifle Bullpup", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_bullpuprifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un rifle de asalto automático compacto"},
	["weapon_dagger"] 				 = {["name"] = "weapon_dagger", 			 	["label"] = "Daga", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_dagger.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un cuchillo corto con una hoja puntiaguda y afilada, que se usa como arma."},
	["weapon_vintagepistol"] 		 = {["name"] = "weapon_vintagepistol", 	 	  	["label"] = "Pistola Vintage", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_vintagepistol.png", ["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego antigua diseñada para sostenerse en una mano."},
	["weapon_firework"] 			 = {["name"] = "weapon_firework", 		 	  	["label"] = "Lanzador de fuegos artificiales", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_firework.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un dispositivo que contiene pólvora y otros químicos combustibles que causa una explosión espectacular cuando se enciende."},
	["weapon_musket"] 			     = {["name"] = "weapon_musket", 			 	["label"] = "Mosquete", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_musket.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Arma ligera de un soldado militar con un cañón largo, de avancarga y disparada desde el hombro."},
	["weapon_heavyshotgun"] 		 = {["name"] = "weapon_heavyshotgun", 	 	  	["label"] = "Escopeta Pesada", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_heavyshotgun.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un cañón grande de ánima lisa para disparar pequeños tiros a corta distancia"},
	["weapon_marksmanrifle"] 		 = {["name"] = "weapon_marksmanrifle", 	 	  	["label"] = "Rifle Francotirador", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "weapon_marksmanrifle.png", ["unique"] = true, 		["useable"] = false, 	["description"] = "Un rifle de un solo disparo muy preciso"},
	["weapon_hominglauncher"] 		 = {["name"] = "weapon_hominglauncher", 	 	["label"] = "Lanzador Homing", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_STINGER",			["image"] = "weapon_hominglauncher.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma equipada con un dispositivo electrónico que le permite encontrar y alcanzar un objetivo."},
	["weapon_proxmine"] 			 = {["name"] = "weapon_proxmine", 		 	  	["label"] = "Granada de Proximidad", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_proximitymine.png", ["unique"] = true, 		["useable"] = false, 	["description"] = "Una bomba colocada en el suelo que detona al acercarse a su proximidad."},
	["weapon_snowball"] 		     = {["name"] = "weapon_snowball", 		 	  	["label"] = "Bola de Nieve", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_snowball.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una bola de nieve, especialmente una hecha para arrojarla a otras personas por diversión."},
	["weapon_flaregun"] 			 = {["name"] = "weapon_flaregun", 		 	  	["label"] = "Pistola de Bengalas", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "weapon_flaregun.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una pistola para disparar cohetes de señales."},
	["weapon_garbagebag"] 			 = {["name"] = "weapon_garbagebag", 		 	["label"] = "Bolsa de Basura", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_garbagebag.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una bolsa de basura"},
	["weapon_handcuffs"] 			 = {["name"] = "weapon_handcuffs", 		 	  	["label"] = "Esposas", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_handcuffs.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un par de anillos de metal enlazados con cerradura para asegurar las muñecas de un prisionero."},
	["weapon_combatpdw"] 			 = {["name"] = "weapon_combatpdw", 		 	  	["label"] = "PDW de Combate", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_combatpdw.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una versión de combate de una ametralladora ligera de mano."},
	["weapon_marksmanpistol"] 		 = {["name"] = "weapon_marksmanpistol", 	 	["label"] = "Pistola Marksman", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_marksmanpistol.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma de fuego pequeña muy precisa diseñada para sostenerse en una mano"},
	["weapon_knuckle"] 				 = {["name"] = "weapon_knuckle", 		 	  	["label"] = "Puño Americano", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_knuckle.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un instrumento de metal que se usa en los nudillos para las peleas, especialmente para aumentar el efecto de los golpes."},
	["weapon_hatchet"] 				 = {["name"] = "weapon_hatchet", 		 	  	["label"] = "Hacha", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_hatchet.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un hacha pequeña con un mango corto para usar con una mano."},
	["weapon_railgun"] 				 = {["name"] = "weapon_railgun", 		 	  	["label"] = "Pistola de Rayos", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_railgun.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma que usa fuerza electromagnética para lanzar proyectiles de alta velocidad."},
	["weapon_machete"] 				 = {["name"] = "weapon_machete", 		 	  	["label"] = "Machete", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_machete.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un cuchillo ancho y pesado utilizado como arma."},
	["weapon_machinepistol"] 		 = {["name"] = "weapon_machinepistol", 	 	  	["label"] = "Tec-9", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_machinepistol.png", ["unique"] = true, 		["useable"] = false, 	["description"] = "Una pistola de carga automática capaz de disparar en ráfagas o disparar de forma totalmente automática."},
	["weapon_switchblade"] 			 = {["name"] = "weapon_switchblade", 	 	  	["label"] = "Navaja de Mariposa", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_switchblade.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un cuchillo con una hoja afilada que sale del mango cuando se presiona un botón."},
	["weapon_revolver"] 			 = {["name"] = "weapon_revolver", 		 	  	["label"] = "Revolver", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_revolver.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una pistola con cámaras giratorias que permite disparar varios tiros sin recargar."},
	["weapon_dbshotgun"] 			 = {["name"] = "weapon_dbshotgun", 		 	  	["label"] = "Escopeta de doble cañon", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_dbshotgun.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una escopeta con dos cañones paralelos, que permite disparar dos tiros sencillos en rápida sucesión."},
	["weapon_compactrifle"] 		 = {["name"] = "weapon_compactrifle", 	 	  	["label"] = "Rifle Compacto", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_compactrifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una versión compacta de un rifle de asalto."},
	["weapon_autoshotgun"] 			 = {["name"] = "weapon_autoshotgun", 	 	  	["label"] = "Escopeta Automatica", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_autoshotgun.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una escopeta capaz de disparar de forma rápida y continua"},
	["weapon_battleaxe"] 			 = {["name"] = "weapon_battleaxe", 		 	  	["label"] = "Hacha de Batalla", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_battleaxe.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un gran hacha de hoja ancha utilizada en la guerra antigua."},
	["weapon_compactlauncher"] 		 = {["name"] = "weapon_compactlauncher",  	  	["label"] = "Lanzador Compacto", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_compactlauncher.png", 	["unique"] = true, 	["useable"] = false, 	["description"] = "Un lanzagranadas compacto"},
	["weapon_minismg"] 				 = {["name"] = "weapon_minismg", 		 	  	["label"] = "Mini SMG", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_minismg.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una mini ametralladora ligera de mano"},
	["weapon_pipebomb"] 			 = {["name"] = "weapon_pipebomb", 		 	  	["label"] = "Pipe bom", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_pipebomb.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una bomba casera, cuyos componentes están contenidos en una tubería."},
	["weapon_poolcue"] 				 = {["name"] = "weapon_poolcue", 		 	  	["label"] = "Taco de Billar", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_poolcue.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un palo que se usa para golpear una bola, generalmente la bola blanca (u otras cosas)"},
	["weapon_wrench"] 				 = {["name"] = "weapon_wrench", 			 	["label"] = "Llave Inglesa", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_wrench.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una herramienta que se utiliza para sujetar y girar tuercas, pernos, tuberías, etc."},
	["weapon_bread"] 				 = {["name"] = "weapon_bread", 				 	["label"] = "Barra de Pan", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "baquette.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "¿Pan..?"},
	["weapon_flashlight"]			 = {["name"] = "weapon_flashlight",				["label"] = "Linterna",						["weight"] = 1000,		["type"] = "weapon",	["ammotype"] = nil,						["image"] = "weapon_flashlight.png",	["unique"] = true,		["useable"] = false,	["description"] = "Una luz portátil que funciona con baterías"},
	["weapon_katana"]			 	 = {["name"] = "weapon_katana",					["label"] = "Katana",						["weight"] = 1000,		["type"] = "weapon",	["ammotype"] = nil,						["image"] = "weapon_katana.png",		["unique"] = true,		["useable"] = false,	["description"] = "Una katana japonesa"},
	["weapon_doubleaction"]			 = {["name"] = "weapon_doubleaction",			["label"] = "Revolver de doble acción",		["weight"] = 1000,		["type"] = "weapon",	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_doubleaction.png",	["unique"] = true,		["useable"] = false,	["description"] = "Revolver del sheriff"},

	-- // ITEMS //
    ["headbag"] 					 = {["name"] = "headbag",    			 	  	    ["label"] = "Bolsa para la cabeza", 		    			["weight"] = 0, 		["type"] = "item", 		["image"] = "headbag.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Bolsa para la cabeza"},
	["bag"] 					     = {["name"] = "bag",    			 	  	    ["label"] = "Mochila", 		    			["weight"] = 0, 		["type"] = "item", 		["image"] = "bag.png", 					["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Mochila"},
	["c4_bomb"] 					 = {["name"] = "c4_bomb",    			 	  	["label"] = "Explosivo C4", 		    	["weight"] = 0, 		["type"] = "item", 		["image"] = "c4_bank.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Explosivo C4. Altamente inflamable"},
	["zetony"] 					 	 = {["name"] = "zetony", 			 	  	  	["label"] = "Ficha del casino", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "casinochips.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Moneda del casino"},
	["id_card"] 					 = {["name"] = "id_card", 			 	  	  	["label"] = "Tarjeta de Identificacion", 	["weight"] = 0, 		["type"] = "item", 		["image"] = "id_card.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Una tarjeta que contiene toda tu información para identificarte."},
	["driver_license"] 				 = {["name"] = "driver_license", 			  	["label"] = "Licencia de Conducir", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "driver_license.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Permiso para demostrar que puede conducir un vehículo."},
	["lawyerpass"] 					 = {["name"] = "lawyerpass", 			 	  	["label"] = "Pase de Abogado", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "lawyerpass.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Pase exclusivo a abogados para demostrar que pueden representar a un sospechoso."},
	["tosti"] 						 = {["name"] = "tosti", 			 	  	  	["label"] = "Sandwich de queso fundido", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "tosti.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Agradable para comer."},
	["casinochips"] 				 = {["name"] = "casinochips", 			  	  	["label"] = "Fichas de casino", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "casinochips.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,	["combinable"] = nil,   ["description"] = "Fichas para juegos de casino"},
	["water_bottle"] 				 = {["name"] = "water_bottle", 			  	  	["label"] = "Botella de agua", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "water_bottle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Para todos los sedientos que hay"},
	["beer"] 				 		 = {["name"] = "beer", 			  	  			["label"] = "Cerveza", 						["weight"] = 500, 		["type"] = "item", 		["image"] = "beer.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Para todos los sedientos que hay"},
	["whiskey"] 				 	 = {["name"] = "whiskey", 			  	  		["label"] = "Whiskey", 						["weight"] = 500, 		["type"] = "item", 		["image"] = "whiskey.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Para todos los sedientos que hay"},
	["vodka"] 				 		 = {["name"] = "vodka", 			  	  		["label"] = "Vodka", 						["weight"] = 500, 		["type"] = "item", 		["image"] = "vodka.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Para todos los sedientos que hay"},
	["coffee"] 				 		 = {["name"] = "coffee", 			  	  		["label"] = "Cafe", 						["weight"] = 200, 		["type"] = "item", 		["image"] = "coffee.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Bomba de cafeína"},
	["kurkakola"] 				 	 = {["name"] = "kurkakola", 			  	  	["label"] = "Cocacola", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "cola.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Para todos los sedientos que hay"},
	["twerks_candy"] 				 = {["name"] = "twerks_candy", 			  	  	["label"] = "Golosinas", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "twerks_candy.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Unos dulces deliciosos"},
	["snikkel_candy"] 				 = {["name"] = "snikkel_candy", 			  	["label"] = "Snikkel", 						["weight"] = 100, 		["type"] = "item", 		["image"] = "snikkel_candy.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Unos dulces deliciosos"},
	["joint"] 						 = {["name"] = "joint", 			  	  		["label"] = "Porro", 						["weight"] = 0, 		["type"] = "item", 		["image"] = "joint.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sidney estaría muy orgulloso de ti"},
	["cokebaggy"] 					 = {["name"] = "cokebaggy", 			  	  	["label"] = "Bolsa de Coca Cola", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "cocaine_baggy.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Para ser feliz muy rápido."},
	["crack_baggy"] 				 = {["name"] = "crack_baggy", 			  	  	["label"] = "Bolsa de crack", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "crack_baggy.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Para ser feliz más rápido."},
	["xtcbaggy"] 					 = {["name"] = "xtcbaggy", 			  	  		["label"] = "Bolsa de XTC", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "xtc_baggy.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Toma esas pastillas bebé."},
	["plastic"] 					 = {["name"] = "plastic", 			  	  	  	["label"] = "Plástico", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "plastic.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "¡RECICLA! - Greta Thunberg 2019"},
	["metalscrap"] 					 = {["name"] = "metalscrap", 			  	  	["label"] = "Chatarra", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "metalscrap.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Probablemente puedas sacar algo bueno de esto."},
	["copper"] 					 	 = {["name"] = "copper", 			  	  		["label"] = "Cobre", 						["weight"] = 100, 		["type"] = "item", 		["image"] = "copper.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Bonita pieza de metal que probablemente puedas usar para algo."},
	["aluminum"] 					 = {["name"] = "aluminum", 			  	  		["label"] = "Aluminio", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "aluminum.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Bonita pieza de metal que probablemente puedas usar para algo."},
	["aluminumoxide"] 				 = {["name"] = "aluminumoxide", 			  	["label"] = "Polvo de Aluminio", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "aluminumoxide.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Un poco de polvo para mezclar."},
	["iron"] 				 	     = {["name"] = "iron", 			  				["label"] = "Hierro", 						["weight"] = 100, 		["type"] = "item", 		["image"] = "ironplate.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Práctica pieza de metal que probablemente puedas usar para algo."},
	["ironoxide"] 				 	 = {["name"] = "ironoxide", 			  		["label"] = "Polvo de hierro", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "ironoxide.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = {accept = {"aluminumoxide"}, reward = "thermite", anim = {["dict"] = "anim@amb@business@weed@weed_inspecting_high_dry@", ["lib"] = "weed_inspecting_high_base_inspector", ["text"] = "Mixing powder..", ["timeOut"] = 10000}},   ["description"] = "Un poco de polvo para mezclar."},
	["steel"] 				 	 	 = {["name"] = "steel", 			  			["label"] = "Acero", 						["weight"] = 100, 		["type"] = "item", 		["image"] = "steel.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Bonita pieza de metal que probablemente puedas usar para algo."},
	["rubber"] 				 	 	 = {["name"] = "rubber", 			  			["label"] = "Caucho", 						["weight"] = 100, 		["type"] = "item", 		["image"] = "rubber.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Caucho, creo que puedes hacer tu propio patito de goma con él."},
	["glass"] 				 	 	 = {["name"] = "glass", 			  			["label"] = "Cristal", 						["weight"] = 100, 		["type"] = "item", 		["image"] = "glassplate.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Es muy frágil, cuidado."},
	["pistol_ammo"] 				 = {["name"] = "pistol_ammo", 			  	  	["label"] = "Munición de pistola", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "pistol_ammo.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Munición para pistolas"},
	["rifle_ammo"] 				 	 = {["name"] = "rifle_ammo", 			  	  	["label"] = "Munición de rifle", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "rifle_ammo.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Munición para rifles."},
	["smg_ammo"] 				 	 = {["name"] = "smg_ammo", 			  	  		["label"] = "Munición SMG", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "smg_ammo.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Munición para metralletas."},
	["shotgun_ammo"] 				 = {["name"] = "shotgun_ammo", 			  	  	["label"] = "Munición de escopeta", 		["weight"] = 500, 		["type"] = "item", 		["image"] = "shotgun_ammo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Munición para escopetas."},
	["mg_ammo"] 				 	 = {["name"] = "mg_ammo", 			  	  		["label"] = "Munición MG", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "mg_ammo.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Munición para ametralladoras."},
	["snp_ammo"] 				 	 = {["name"] = "snp_ammo", 			  	  		["label"] = "Munición de francotirador", 	["weight"] = 1000, 		["type"] = "item", 		["image"] = "snp_ammo.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Munición para rifles de francotirador."},
	["lockpick"] 					 = {["name"] = "lockpick", 			 	  	  	["label"] = "Ganzúa", 						["weight"] = 300, 		["type"] = "item", 		["image"] = "lockpick.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = {accept = {"screwdriverset"}, reward = "advancedlockpick", anim = {["dict"] = "anim@amb@business@weed@weed_inspecting_high_dry@", ["lib"] = "weed_inspecting_high_base_inspector", ["text"] = "Crafting lockpick", ["timeOut"] = 7500,}},   ["description"] = "Muy útil si pierdes mucho tus llaves ... o si quieres usarlas para otra cosa ..."},
	["advancedlockpick"] 			 = {["name"] = "advancedlockpick", 			 	["label"] = "Ganzúa avanzada", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "advancedlockpick.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Si pierdes mucho tus llaves esto es muy útil .. También útil para abrir cervezas."},
	["repairkit"] 					 = {["name"] = "repairkit", 			 	  	["label"] = "Kit de reparación", 			["weight"] = 2500, 		["type"] = "item", 		["image"] = "repairkit.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una bonita caja de herramientas con cosas para reparar tu vehículo."},
	["advancedrepairkit"] 			 = {["name"] = "advancedrepairkit", 			["label"] = "Kit de reparación avanzado",	["weight"] = 4000, 		["type"] = "item", 		["image"] = "advancedkit.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una bonita caja de herramientas con cosas para reparar tu vehículo... un poco mejor..."},
	["cleaningkit"] 				 = {["name"] = "cleaningkit", 			 	  	["label"] = "Kit de limpieza", 				["weight"] = 250, 		["type"] = "item", 		["image"] = "cleaningkit.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¡Un paño de microfibra con un poco de jabón hará que tu coche vuelva a brillar!"},
	["screwdriverset"] 				 = {["name"] = "screwdriverset", 			    ["label"] = "Kit de herramientas", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "screwdriverset.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Muy útil para atornillar... tornillos..."},
	["drill"] 				 		 = {["name"] = "drill", 			    		["label"] = "Taladro", 						["weight"] = 20000, 	["type"] = "item", 		["image"] = "drill.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "El trato real..."},
	["weed_white-widow"] 			 = {["name"] = "weed_white-widow", 			 	["label"] = "White Widow 2g", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Una bolsa de marihuana con 2g de White Widow"},
	["weed_skunk"] 				  	 = {["name"] = "weed_skunk", 			 		["label"] = "Skunk 2g", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Una bolsa de marihuana con 2g de Skunk"},
	["weed_purple-haze"] 			 = {["name"] = "weed_purple-haze", 			 	["label"] = "Purple Haze 2g", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Una bolsa de hierba con 2g de Purple Haze"},
	["weed_og-kush"] 				 = {["name"] = "weed_og-kush", 			 		["label"] = "OGKush 2g", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Una bolsa de marihuana con 2g de OG Kush"},
	["weed_amnesia"] 				 = {["name"] = "weed_amnesia", 			 		["label"] = "Amnesia 2g", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Una bolsa de marihuana con 2g de Amnesia"},
	["weed_ak47"] 				     = {["name"] = "weed_ak47", 			 		["label"] = "AK47 2g", 						["weight"] = 200, 		["type"] = "item", 		["image"] = "weed-baggie.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Una bolsa de marihuana con 2g de AK47"},
	["weed_white-widow_seed"] 		 = {["name"] = "weed_white-widow_seed", 		["label"] = "Semilla de White Widow", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Una semilla de hierba de White Widow"},
	["weed_skunk_seed"] 			 = {["name"] = "weed_skunk_seed", 			    ["label"] = "Semilla de Skunk", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una semilla de hierba de Skunk"},
	["weed_purple-haze_seed"] 		 = {["name"] = "weed_purple-haze_seed", 		["label"] = "Semilla de Purple Haze", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una semilla de hierba de Purple Haze"},
	["weed_og-kush_seed"] 			 = {["name"] = "weed_og-kush_seed", 			["label"] = "Semilla de OGKush", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una semilla de hierba de OG Kush"},
	["weed_amnesia_seed"] 			 = {["name"] = "weed_amnesia_seed", 			["label"] = "Semilla de Amnesia", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una semilla de hierba de Amnesia"},
	["weed_ak47_seed"] 				 = {["name"] = "weed_ak47_seed", 			    ["label"] = "Semilla de AK47", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-plant-seed.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una semilla de hierba de AK47"},
	["empty_weed_bag"] 				 = {["name"] = "empty_weed_bag", 			    ["label"] = "Bolsa de hierba vacía", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "weed-empty-bag.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una bolsa vacía para cogollos de marihuana."},
	["weed_nutrition"] 				 = {["name"] = "weed_nutrition", 			    ["label"] = "Fertilizante vegetal", 		["weight"] = 2000, 		["type"] = "item", 		["image"] = "weed_nutrition.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Nutrición vegetal"},
	["handcuffs"] 				 	 = {["name"] = "handcuffs", 			    	["label"] = "Esposas", 						["weight"] = 100, 		["type"] = "item", 		["image"] = "handcuffs.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Resulta útil cuando la gente se porta mal. ¿Quizás pueda usarse para otra cosa?"},
	["tunerlaptop"] 				 = {["name"] = "tunerlaptop", 			    	["label"] = "Chip de Tuneo", 				["weight"] = 2000, 		["type"] = "item", 		["image"] = "tunerlaptop.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Con este chip de sintonización puedes conseguir esteroides en tu coche... si sabes lo que estás haciendo"},
	["empty_evidence_bag"] 			 = {["name"] = "empty_evidence_bag", 			["label"] = "Bolsa de pruebas vacía", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "evidence.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Usado mucho para guardar pruebas. Piense en el ADN de sangre, casquillos de bala, etc."},
	["filled_evidence_bag"] 		 = {["name"] = "filled_evidence_bag", 			["label"] = "Bolsa de pruebas", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "evidence.png", 			["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Una bolsa de pruebas llena para ver quién cometió el crimen"},
	["armor"] 		 				 = {["name"] = "armor", 						["label"] = "Chaleco", 						["weight"] = 5000, 	    ["type"] = "item", 		["image"] = "armor.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Un poco de protección no hará daño... ¿verdad? (Un solo uso)"},
	["heavyarmor"] 		 			 = {["name"] = "heavyarmor", 					["label"] = "Chaleco Pesado", 				["weight"] = 5000, 	    ["type"] = "item", 		["image"] = "armor.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Un poco de protección no hará daño... ¿verdad?"},
	["weed_brick"] 		 			 = {["name"] = "weed_brick", 					["label"] = "Brick de Marihuana", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "weed_brick.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Ladrillo de hierba de 1kg para vender a grandes clientes."},
	["coke_brick"] 		 			 = {["name"] = "coke_brick", 					["label"] = "Brick de Cocaina", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "coke_brick.png", 			["unique"] = true, 		["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Paquete pesado de cocaína, usado principalmente para tratos y ocupa mucho espacio."},
	["coke_small_brick"] 		 	 = {["name"] = "coke_small_brick", 				["label"] = "Paquete de cocaina", 			["weight"] = 350, 		["type"] = "item", 		["image"] = "coke_small_brick.png", 	["unique"] = true, 		["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una gran cantidad de gramos de cocaína, que se usa principalmente para ofertas y ocupa mucho espacio."},
	["racioncalabozo"] 				 = {["name"] = "racioncalabozo", 				["label"] = "Ración Calabozo", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "sandwich.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una buena ración para que no pasen hambre esos desgraciados."},
	["proteinas"] 				 	 = {["name"] = "proteinas", 					["label"] = "Proteinas", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "proteinas.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Unas buenas proteinas para ganar más musculo."},
	["kleenex"] 				 	 = {["name"] = "kleenex", 			  	  		["label"] = "Kleenex", 						["weight"] = 200, 		["type"] = "item", 		["image"] = "kleenex.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Seca tus lágrimas."},
	["sandwich"] 				 	 = {["name"] = "sandwich", 			  	  		["label"] = "Sandwich", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "sandwich.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Buen pan para tu estómago."},
	["electronickit"] 				 = {["name"] = "electronickit", 			  	["label"] = "Kit electrónico", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "electronickit.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = {accept = {"gatecrack"}, reward = "trojan_usb", anim = nil}, ["description"] = "Si siempre has querido construir un robot, tal vez puedas empezar aquí..."},
	["gatecrack"] 				 	 = {["name"] = "gatecrack", 			  	  	["label"] = "Gatecrack", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "usb_device.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Software útil para derribar vallas."},
	["rolex"] 				 	 	 = {["name"] = "rolex", 			  	  		["label"] = "Reloj dorado", 				["weight"] = 1500, 		["type"] = "item", 		["image"] = "rolex_watch.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¡Un reloj de oro, me parece el premio gordo!"},
	["diamond_ring"] 				 = {["name"] = "diamond_ring", 			  	  	["label"] = "Anillo de diamantes", 			["weight"] = 1500, 		["type"] = "item", 		["image"] = "diamond_ring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¡Un anillo de diamantes, me parece el premio gordo!"},
	["goldchain"] 				 	 = {["name"] = "goldchain", 			  	  	["label"] = "Cadena de oro", 				["weight"] = 1500, 		["type"] = "item", 		["image"] = "goldchain.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¡Una cadena de oro, me parece el premio gordo!"},
	["10kgoldchain"] 				 = {["name"] = "10kgoldchain", 			  	  	["label"] = "Cadena de oro de 10 k", 		["weight"] = 2000, 		["type"] = "item", 		["image"] = "10kgoldchain.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Cadena de oro de 10 quilates."},
	["trojan_usb"] 				 	 = {["name"] = "trojan_usb", 			  	  	["label"] = "Troyano USB", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "usb_device.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Software útil para apagar algunos sistemas."},
	["security_card_01"] 			 = {["name"] = "security_card_01", 			  	["label"] = "Tarjeta de seguridad A", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "security_card_01.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una tarjeta de seguridad perteneciente a la Caja de Ahorros del Condado de Blaine."},
	["security_card_02"] 			 = {["name"] = "security_card_02", 			  	["label"] = "Tarjeta de seguridad B", 		["weight"] = 0, 		["type"] = "item", 		["image"] = "security_card_02.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una tarjeta de seguridad perteneciente al Pacific Savings Bank."},
	["police_stormram"] 			 = {["name"] = "police_stormram", 			  	["label"] = "Stormram", 					["weight"] = 18000, 	["type"] = "item", 		["image"] = "police_stormram.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Una buena herramienta para irrumpir en puertas."},
	["rolling_paper"] 			 	 = {["name"] = "rolling_paper", 			  	["label"] = "Papel de liar", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "rolling_paper.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = {accept = {"weed_white-widow", "weed_skunk", "weed_purple-haze", "weed_og-kush", "weed_amnesia", "weed_ak47"}, reward = "joint", anim = {["dict"] = "anim@amb@business@weed@weed_inspecting_high_dry@", ["lib"] = "weed_inspecting_high_base_inspector", ["text"] = "Rolling joint", ["timeOut"] = 5000,}},   ["description"] = "Papel de liar, se puede combinar y hacer maravillas."},
	["radio"] 			 	 		 = {["name"] = "radio", 			  			["label"] = "Radio", 						["weight"] = 2000, 		["type"] = "item", 		["image"] = "radio.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Puedes comunicarte con esto a través de una señal."},
	["stickynote"] 			 	 	 = {["name"] = "stickynote", 			  		["label"] = "Nota adhesiva", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "stickynote.png", 			["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A veces es útil recordar algo."},
	["phone"] 			 	 	 	 = {["name"] = "phone", 			  			["label"] = "Telefono", 					["weight"] = 700, 		["type"] = "item", 		["image"] = "phone.png", 				["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Buen teléfono tienes."},
	["speaker"] 			 	 	 = {["name"] = "speaker", 			  			["label"] = "Altavoz", 						["weight"] = 500, 		["type"] = "item", 		["image"] = "speaker.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Escucha la mejor música."},
	["fitbit"] 			 	 	 	 = {["name"] = "fitbit", 			  			["label"] = "SmartWatch", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "fitbit.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Me gusta el SmartWatch"},
	["thermite"] 			 	 	 = {["name"] = "thermite", 			  			["label"] = "Termita", 						["weight"] = 1000, 		["type"] = "item", 		["image"] = "thermite.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A veces querrías que todo se quemara..."},
	["goldbar"] 			 	 	 = {["name"] = "goldbar", 			  			["label"] = "Barra de Oro", 				["weight"] = 7000, 	    ["type"] = "item", 		["image"] = "goldbar.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Parece caro..."},
    ["cryptostick"] 			 	 = {["name"] = "cryptostick", 			  		["label"] = "Stick de Cryptos", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "cryptostick.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "¿Por qué alguien compraría dinero que no existe? ¿Cuántos contendría?"},
    ["radioscanner"] 			 	 = {["name"] = "radioscanner", 			  		["label"] = "Escáner de radio", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "radioscanner.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Con esto puedes recibir algunas alertas policiales. No es 100% efectivo."},
    ["dendrogyra_coral"] 			 = {["name"] = "dendrogyra_coral", 			  	["label"] = "Dendrogyra", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "dendrogyra_coral.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Coral tu propia ola."},
    ["antipatharia_coral"] 			 = {["name"] = "antipatharia_coral", 			["label"] = "Antipatharia", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "antipatharia_coral.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Coral, tu propia ola."},
    ["jerry_can"] 			 		 = {["name"] = "jerry_can", 					["label"] = "Jerrycan 20L", 				["weight"] = 20000, 	["type"] = "item", 		["image"] = "jerry_can.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Combustible, como solo se vive una vez."},
	["moneybag"] 			 		 = {["name"] = "moneybag", 						["label"] = "Bolsa de dinero", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "moneybag.png", 			["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Una bolsa con dinero en efectivo."},
	["diving_gear"] 			     = {["name"] = "diving_gear", 					["label"] = "Equipo de buceo", 				["weight"] = 30000, 	["type"] = "item", 		["image"] = "diving_gear.png", 			["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "¡Vamos a bucear!"},
	["parachute"] 			   		 = {["name"] = "parachute", 					["label"] = "Paracaidas", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "parachute.png", 			["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "¡El cielo es el límite!"},
	["mechero"] 			   		 = {["name"] = "mechero", 						["label"] = "Mechero", 						["weight"] = 0.3, 		["type"] = "item", 		["image"] = "mechero.png", 			["unique"] = false, 	    ["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "¡Enciende el cigarro ostia!"},
	["cigarrillo"] 			   		 = {["name"] = "cigarrillo", 					["label"] = "Cigarrillo", 					["weight"] = 0.1, 		["type"] = "item", 		["image"] = "cigarrillo.png", 			["unique"] = false, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "¿Necesitas desestresarte?"},
	["porro"] 			   			 = {["name"] = "porro", 						["label"] = "Porrillo", 					["weight"] = 0.1, 		["type"] = "item", 		["image"] = "joint.png", 			["unique"] = false, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Que paaaaasaaaa colegaaaaaaaaaaaa"},
	-- ["smoketrailred"] 			 = {["name"] = "smoketrailred", 				["label"] = "Smoke Trail Red", 		["weight"] = 50,	 		["type"] = "item", 		["image"] = "smoketrailred.png",		["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Deja un rastro rojo al volar."},
	["snspistol_part_1"] 			 = {["name"] = "snspistol_part_1", 				["label"] = "Cañon de SNS", 				["weight"] = 1500, 		["type"] = "item", 		["image"] = "snspistol_part_1.png", 	["unique"] = true, 	    ["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Cañon de una pistola SNS"},
	["snspistol_part_2"] 			 = {["name"] = "snspistol_part_2", 				["label"] = "Gatillo de SNS", 				["weight"] = 1500, 		["type"] = "item", 		["image"] = "snspistol_part_2.png", 	["unique"] = true, 	    ["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Gatillo de una pistola SNS"},
	["snspistol_part_3"] 			 = {["name"] = "snspistol_part_3", 				["label"] = "Cargador Ampliado de SNS",	 	["weight"] = 1500, 		["type"] = "item", 		["image"] = "snspistol_part_3.png", 	["unique"] = true, 	    ["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = {accept = {"snspistol_part_1"}, reward = "snspistol_stage_1", anim = {["dict"] = "anim@amb@business@weed@weed_inspecting_high_dry@", ["lib"] = "weed_inspecting_high_base_inspector", ["text"] = "Atttaching attachments", ["timeOut"] = 15000,}},   ["description"] = "Cargador Ampliado de una pistola SNS"},
	["snspistol_stage_1"] 			 = {["name"] = "snspistol_stage_1", 			["label"] = "Cuerpo de SNS", 				["weight"] = 2500, 		["type"] = "item", 		["image"] = "snspistol_stage_1.png", 	["unique"] = true, 	    ["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = {accept = {"snspistol_part_2"}, reward = "weapon_snspistol", anim = {["dict"] = "anim@amb@business@weed@weed_inspecting_high_dry@", ["lib"] = "weed_inspecting_high_base_inspector", ["text"] = "Attaching attachments", ["timeOut"] = 15000,}}, ["description"] = "SNS con cañon y cargador ampliado."},
	["bandage"] 			 		 = {["name"] = "bandage", 						["label"] = "Venda", 						["weight"] = 0, 		["type"] = "item", 		["image"] = "bandage.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "Una venda funciona siempre"},
	["painkillers"] 			 	 = {["name"] = "painkillers", 					["label"] = "Analgésicos", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "painkillers.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "Para el dolor que ya no soportas, toma esta pastilla que te hará a sentir genial"},
	["binoculars"] 			 	 	 = {["name"] = "binoculars", 					["label"] = "Prismáticos", 					["weight"] = 600, 		["type"] = "item", 		["image"] = "binoculars.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "Para ver mejor..."},
	["snowball"] 		     		 = {["name"] = "snowball", 		 	  			["label"] = "Bola de Nieve", 				["weight"] = 0, 		["type"] = "item", 	 	["image"] = "snowball.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil, ["description"] = "Debería haberlo atrapado."},
	["firework1"] 				 	 = {["name"] = "firework1", 			  	  	["label"] = "2Brothers", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "firework1.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fuegos artificiales!"},
	["firework2"] 				 	 = {["name"] = "firework2", 			  	  	["label"] = "Poppelers", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "firework2.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fuegos artificiales!"},
	["firework3"] 				 	 = {["name"] = "firework3", 			  	  	["label"] = "WipeOut", 						["weight"] = 1000, 		["type"] = "item", 		["image"] = "firework3.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fuegos artificiales!"},
	["firework4"] 				 	 = {["name"] = "firework4", 			  	  	["label"] = "Weeping Willow", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "firework4.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Fuegos artificiales!"},
	["iphone"] 				 	 	 = {["name"] = "iphone", 			  	  		["label"] = "iPhone", 				    	["weight"] = 1000, 		["type"] = "item", 		["image"] = "iphone.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Un teléfono muy caro."},
	["samsungphone"] 				 = {["name"] = "samsungphone", 			  	  	["label"] = "Samsung S10", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "samsungphone.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Un teléfono muy caro."},
	["laptop"] 				 		 = {["name"] = "laptop", 			  	  		["label"] = "Portatil", 					["weight"] = 4000, 		["type"] = "item", 		["image"] = "laptop.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Juego caro, ¿verdad?"},
	["tablet"] 				 		 = {["name"] = "tablet", 			  	  		["label"] = "Tablet", 						["weight"] = 2000, 		["type"] = "item", 		["image"] = "tablet.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Juego caro, ¿verdad?"},
	["lighter"] 				 	 = {["name"] = "lighter", 			  	  		["label"] = "Mechero", 						["weight"] = 0, 		["type"] = "item", 		["image"] = "lighter.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "En la víspera de año nuevo, un bonito fuego para estar al lado"},
	["certificate"] 				 = {["name"] = "certificate", 			  	  	["label"] = "Certificado", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "certificate.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Certificado que demuestre que posee ciertas cosas"},
	["nitrous"] 				 	 = {["name"] = "nitrous", 			  	  		["label"] = "Oxido Nitroso", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "nitrous.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¡Acelera, acelerador!"},
	["walkstick"] 				 	 = {["name"] = "walkstick", 			  	  	["label"] = "Walk Stick", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "walkstick.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Bastón para las abuelas que hay..."},
	["harness"] 				 	 = {["name"] = "harness", 			  	  		["label"] = "Arneses de Carreras", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "harness.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Arnés de carreras, no importa lo que te quedes en el coche."},
	["markedbills"] 				 = {["name"] = "markedbills", 			  	  	["label"] = "Dinero marcado", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "markedbills.png", 			["unique"] = false, 		["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¿Dinero?"},
	["pistol_suppressor"] 			 = {["name"] = "pistol_suppressor", 			["label"] = "Silenciador de Pistola", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "pistol_suppressor.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¿Dinero?"},
	["pistol_extendedclip"] 		 = {["name"] = "pistol_extendedclip", 			["label"] = "Cargador Ampliado de Pistola EXT", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "pistol_extendedclip.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¿Dinero?"},
	["smg_extendedclip"] 		 	 = {["name"] = "smg_extendedclip", 				["label"] = "Cargador Ampliado de SMG EXT", ["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_extendedclip.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¿Dinero?"},
	["smg_flashlight"] 		 	 	 = {["name"] = "smg_flashlight", 				["label"] = "Linterna para SMG", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_flashlight.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¿Dinero?"},
	["smg_scope"] 		 	 		 = {["name"] = "smg_scope", 					["label"] = "Mirilla para SMG", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_scope.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¿Dinero?"},
	["smg_suppressor"] 			 	 = {["name"] = "smg_suppressor", 				["label"] = "Silenciador para SMG", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "smg_suppressor.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¿Dinero?"},
	["rifle_extendedclip"] 		 	 = {["name"] = "rifle_extendedclip", 			["label"] = "Cargador Ampliado para Rifle EXT", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "rifle_extendedclip.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¿Dinero?"},
	["rifle_drummag"] 		 	 	 = {["name"] = "rifle_drummag", 				["label"] = "Rifle Drummag", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "rifle_drummag.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¿Dinero?"},
	["rifle_suppressor"] 			 = {["name"] = "rifle_suppressor", 				["label"] = "Silenciador para Rifle", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "rifle_suppressor.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¿Dinero?"},
	["labkey"] 			 			 = {["name"] = "labkey", 						["label"] = "Lave", 						["weight"] = 500, 		["type"] = "item", 		["image"] = "labkey.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "¿Llave para una cerradura...?"},
	["pinger"] 			 			 = {["name"] = "pinger", 						["label"] = "Pinger", 						["weight"] = 1000, 		["type"] = "item", 		["image"] = "pinger.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Con un ping y su teléfono puede enviar su ubicación"},
	["firstaid"] 			 		 = {["name"] = "firstaid", 						["label"] = "Primeros auxilios", 			["weight"] = 2500, 		["type"] = "item", 		["image"] = "firstaid.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Puede usar este botiquín de primeros auxilios para que las personas se recuperen."},
	["printerdocument"] 			 = {["name"] = "printerdocument", 				["label"] = "Documento", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "printerdocument.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Un buen documento."},
	["weaponlicense"] 				 = {["name"] = "weaponlicense",				    ["label"] = "Licencia de Armas",			["weight"] = 0,			["type"] = "item",		["image"] = "weapon_license.png",		["unique"] = true,		["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "Licencia de armas."},
	["oxy"] 				 		 = {["name"] = "oxy",				    		["label"] = "Receta Oxy",					["weight"] = 0,			["type"] = "item",		["image"] = "oxy.png",		["unique"] = false,		["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,				["description"] = "La etiqueta ha sido arrancada."},
	["visa"] 					 	 = {["name"] = "visa", 			 	  	  		["label"] = "Tarjeta Visa", 				["weight"] = 0, 		["type"] = "item", 		["image"] = "visacard.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Visa se puede utilizar a través de un cajero automático"},
	["mastercard"] 					 = {["name"] = "mastercard", 					["label"] = "Master Card", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "mastercard.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "MasterCard se puede utilizar a través de un cajero automático."},
	["ephedrine"] 					 = {["name"] = "ephedrine", 					["label"] = "Ephedrine", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "chemical1.png", 			["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Haz algo de metanfetamina"},
	["hydrochloricacid"] 			 = {["name"] = "hydrochloricacid", 				["label"] = "Ácido Clorhídrico", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "chemical1.png", 			["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Haz algo de metanfetamina"},
	["acetone"] 					 = {["name"] = "acetone", 						["label"] = "Acetona", 						["weight"] = 200, 		["type"] = "item", 		["image"] = "chemical2.png", 			["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Vende algo de metanfetamina"},
	["puremeth"] 					 = {["name"] = "puremeth", 						["label"] = "Metanfetamina", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "meth10g.png", 			    ["unique"] = false, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Vende algo de metanfetamina"},
	["meth"] 					 	 = {["name"] = "meth", 							["label"] = "Metanfetamina", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "meth10g.png", 			    ["unique"] = false, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Vende algo de metanfetamina"},
	["methtray"] 					 = {["name"] = "methtray", 						["label"] = "Bandeja de Metanfetamina", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "methbrick.png", 			["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Ahora debes romper los cristales"},
	["puremethtray"] 				 = {["name"] = "puremethtray", 					["label"] = "Bandeja de metanfetamina pura",["weight"] = 200, 		["type"] = "item", 		["image"] = "methbrick.png", 			["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Ahora sólo falta ponerlo en bolsas"},
	["grape"] 					 	 = {["name"] = "grape", 						["label"] = "Uva", 							["weight"] = 100, 		["type"] = "item", 		["image"] = "grape.png", 		    	["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Mmmm, uvas."},
	["wine"] 					 	 = {["name"] = "wine", 							["label"] = "Vino", 						["weight"] = 300, 		["type"] = "item", 		["image"] = "wine.png", 			    ["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Un buen vino para beber en una buena noche."},
	["grapejuice"] 					 = {["name"] = "grapejuice", 					["label"] = "Jugo de uva", 					["weight"] = 200, 		["type"] = "item", 		["image"] = "grapejuice.png", 			["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Se dice que el jugo de uva es saludable."},
	["cocaleaf"] 					 = {["name"] = "cocaleaf", 						["label"] = "Hoja de cocaína", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "cocaineleaf.png", 			["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Haz esa línea blanca."},
	["gasmask"] 					 = {["name"] = "gasmask", 						["label"] = "Mascara de gas", 				["weight"] = 2000, 		["type"] = "item", 		["image"] = "gasmask.png", 			    ["unique"] = false, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Una mascara anti gas."},
	["cutter"] 					 	 = {["name"] = "cutter", 						["label"] = "Cutter", 						["weight"] = 2000, 		["type"] = "item", 		["image"] = "cutter.png", 			    ["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Un cutter para cortar cosas."},
	["gym_membership"] 				 = {["name"] = "gym_membership", 				["label"] = "Membresía de gimnasio", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "gym_membership.png", 			["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Necesario para usar las instalaciones del gimnasio."},
	["meat"] 					 	 = {["name"] = "meat", 							["label"] = "Carne", 						["weight"] = 1000, 		["type"] = "item", 		["image"] = "meat.png", 		     	["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Carne recién cazada."},
	["leather"] 					 = {["name"] = "leather", 						["label"] = "Cuero", 						["weight"] = 500, 		["type"] = "item", 		["image"] = "leather.png", 		    	["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Cuero de ciervo."},
	["paintinge"] 					 = {["name"] = "paintinge", 					["label"] = "Pintura 1", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "painting.png", 			["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Simplemente arte..."},
	["paintingi"] 					 = {["name"] = "paintingi", 					["label"] = "Pintura 2", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "painting.png", 			["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Simplemente arte..."},
	["paintingh"] 					 = {["name"] = "paintingh", 					["label"] = "Pintura 3", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "painting.png", 			["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Simplemente arte..."},
	["paintingj"] 					 = {["name"] = "paintingj", 					["label"] = "Pintura 4", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "painting.png", 			["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Simplemente arte..."},
	["paintingf"] 					 = {["name"] = "paintingf", 					["label"] = "Pintura 5", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "painting.png", 			["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Simplemente arte..."},
	["paintingg"] 					 = {["name"] = "paintingg", 					["label"] = "Pintura 6", 					["weight"] = 500, 		["type"] = "item", 		["image"] = "painting.png", 			["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Simplemente arte..."},
	["wood"]                         = {["name"] = "wood",                          ["label"] = "Madera",                       ["weight"] = 200,       ["type"] = "item",      ["image"] = "wood.png",             ["unique"] = false,         ["useable"] = false,     ["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Madera recien talada."},
    ["rubber"]                       = {["name"] = "rubber",                        ["label"] = "Caucho",                       ["weight"] = 100,       ["type"] = "item",      ["image"] = "plastic.png",             ["unique"] = false,         ["useable"] = false,     ["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Caucho."},
    ["fizz"]                         = {["name"] = "fizz",                          ["label"] = "Pescado",                      ["weight"] = 100,       ["type"] = "item",      ["image"] = "fizz.png",             ["unique"] = false,         ["useable"] = false,     ["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Pescado fresco."},
    ["rod"]                          = {["name"] = "rod",                           ["label"] = "Caña",                         ["weight"] = 100,       ["type"] = "item",      ["image"] = "rod.png",             ["unique"] = false,         ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Una caña de pescar."},

}


-- // HASH WEAPON ITEMS, NEED SOMETIMES TO GET INFO FOR CLIENT

QBShared.Weapons = {
	-- // WEAPONS
	[`weapon_unarmed`] 				 = {["name"] = "weapon_unarmed", 		 	  	["label"] = "Puños", 						["weight"] = 1000, 		["type"] = "weapon",	["ammotype"] = nil, 					["image"] = "placeholder.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Puñetazos"},
	[`weapon_knife`] 				 = {["name"] = "weapon_knife", 			 	  	["label"] = "Cuchillo", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_knife.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un instrumento compuesto por una hoja fijada en un mango, que se utiliza para cortar o como arma."},
	[`weapon_nightstick`] 			 = {["name"] = "weapon_nightstick", 		 	["label"] = "Porra de policía", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_nightstick.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Arma usada por los policías o seguratas"},
	[`weapon_hammer`] 				 = {["name"] = "weapon_hammer", 			 	["label"] = "Martillo", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_hammer.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Se utiliza para trabajos como romper cosas (piernas) y clavar clavos."},
	[`weapon_bat`] 					 = {["name"] = "weapon_bat", 			 	  	["label"] = "Bate", 					    ["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_bat.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Se usa para golpear una pelota en deportes (u otras cosas)"},
	[`weapon_golfclub`] 			 = {["name"] = "weapon_golfclub", 		 	  	["label"] = "Palo de Golf", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_golfclub.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un palo utilizado para golpear la pelota en el golf."},
	[`weapon_crowbar`] 				 = {["name"] = "weapon_crowbar", 		 	  	["label"] = "Palanca", 				    	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_crowbar.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una barra de hierro con un extremo aplanado, utilizada como palanca."},
	[`weapon_pistol`] 				 = {["name"] = "weapon_pistol", 			 	["label"] = "Walther P99", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_pistol.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego pequeña diseñada para sostenerse en una mano."},
	[`weapon_pistol_mk2`] 			 = {["name"] = "weapon_pistol_mk2", 			["label"] = "Pistola Mk II", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_pistolmk2.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego pequeña mejorada diseñada para sostenerse en una mano."},
	[`weapon_combatpistol`] 		 = {["name"] = "weapon_combatpistol", 	 	  	["label"] = "Pistola de Combate", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_combatpistol.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego pequeña en versión de combate diseñada para sostenerse en una mano."},
	[`weapon_appistol`] 			 = {["name"] = "weapon_appistol", 		 	  	["label"] = "Pistola AP", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_appistol.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego pequeña diseñada para sostenerse en una mano, es automática."},
	[`weapon_pistol50`] 			 = {["name"] = "weapon_pistol50", 		 	  	["label"] = "Pistola .50 Cal", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_pistol50.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego calibre .50 diseñada para sostenerse con ambas manos."},
	[`weapon_microsmg`] 			 = {["name"] = "weapon_microsmg", 		 	  	["label"] = "Micro SMG", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_microsmg.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una ametralladora ligera de mano"},
	[`weapon_smg`] 				 	 = {["name"] = "weapon_smg", 			 	  	["label"] = "SMG", 							["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_smg.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Una ametralladora ligera de mano"},
	[`weapon_assaultsmg`] 			 = {["name"] = "weapon_assaultsmg", 		 	["label"] = "SMG de Asalto", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_assaultsmg.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una versión de asalto de una ametralladora ligera de mano"},
	[`weapon_assaultrifle`] 		 = {["name"] = "weapon_assaultrifle", 	 	  	["label"] = "Rifle de Asalto", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_assaultrifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un rifle automático de fuego rápido alimentado por cargador diseñado para uso militar."},
	[`weapon_carbinerifle`] 		 = {["name"] = "weapon_carbinerifle", 	 	  	["label"] = "Rifle Carabina", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_carbinerifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un rifle automático ligero"},
	[`weapon_advancedrifle`] 		 = {["name"] = "weapon_advancedrifle", 	 	  	["label"] = "Rifle Avanzado", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_advancedrifle.png", ["unique"] = true, 		["useable"] = false, 	["description"] = "Una versión de asalto de un rifle automático de disparo rápido alimentado por cargador diseñado para uso militar."},
	[`weapon_mg`] 					 = {["name"] = "weapon_mg", 				 	["label"] = "Ametralladora", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "weapon_mg.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma automática que dispara balas en rápida sucesión mientras se aprieta el gatillo."},
	[`weapon_combatmg`] 			 = {["name"] = "weapon_combatmg", 		 	  	["label"] = "MG de combate", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "weapon_combatmg.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una versión de combate de un arma automática que dispara balas en rápida sucesión mientras se aprieta el gatillo."},
	[`weapon_pumpshotgun`] 			 = {["name"] = "weapon_pumpshotgun", 	 	  	["label"] = "Escopeta", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_pumpshotgun.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de ánima lisa con acción de bombeo para disparar pequeños tiros a corta distancia."},
	[`weapon_sawnoffshotgun`] 		 = {["name"] = "weapon_sawnoffshotgun", 	 	["label"] = "Escopeta recortada", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_sawnoffshotgun.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma de ánima lisa recortada para disparar pequeños tiros a corta distancia."},
	[`weapon_assaultshotgun`] 		 = {["name"] = "weapon_assaultshotgun", 	 	["label"] = "Escopeta de asalto", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_assaultshotgun.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Una versión de asalto de un arma de ánima lisa para disparar pequeños tiros a corta distancia."},
	[`weapon_bullpupshotgun`] 		 = {["name"] = "weapon_bullpupshotgun", 	 	["label"] = "Escopeta Bullpup", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_bullpupshotgun.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma compacta de ánima lisa para disparar pequeños tiros a corta distancia."},
	[`weapon_stungun`] 				 = {["name"] = "weapon_stungun", 		 	  	["label"] = "Taser", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_taser.png", 		 ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma que dispara púas unidas por cables a las baterías, lo que provoca una parálisis temporal."},
	[`weapon_sniperrifle`] 			 = {["name"] = "weapon_sniperrifle", 	 	  	["label"] = "Rifle de francotirador", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "weapon_sniperrifle.png", 	 ["unique"] = true, 	["useable"] = false, 	["description"] = "Un rifle de alta precisión y largo alcance."},
	[`weapon_heavysniper`] 			 = {["name"] = "weapon_heavysniper", 	 	  	["label"] = "Francotirador pesado", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "weapon_heavysniper.png", 	 ["unique"] = true, 	["useable"] = false, 	["description"] = "Un rifle mejorado de alta precisión y largo alcance."},
	[`weapon_remotesniper`] 		 = {["name"] = "weapon_remotesniper", 	 	  	["label"] = "Francotirador remoto", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER_REMOTE",	["image"] = "weapon_remotesniper.png", 	 ["unique"] = true, 	["useable"] = false, 	["description"] = "Un rifle portátil de alta precisión y largo alcance."},
	[`weapon_grenadelauncher`] 		 = {["name"] = "weapon_grenadelauncher", 	  	["label"] = "Lanzagranadas", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "weapon_grenadelauncher.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma que dispara un proyectil de gran calibre especialmente diseñado, a menudo con una ojiva explosiva, de humo o de gas."},
	[`weapon_grenadelauncher_smoke`] = {["name"] = "weapon_grenadelauncher_smoke", 	["label"] = "Lanzagranadas de humo", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "weapon_smokegrenade.png", 	 ["unique"] = true, 	["useable"] = false, 	["description"] = "Una bomba que produce mucho humo cuando explota."},
	[`weapon_rpg`] 					 = {["name"] = "weapon_rpg", 			      	["label"] = "RPG", 							["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RPG",				["image"] = "weapon_rpg.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Un lanzagranadas propulsado por cohetes"},
	[`weapon_minigun`] 				 = {["name"] = "weapon_minigun", 		      	["label"] = "Minigun", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MINIGUN",			["image"] = "weapon_minigun.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una ametralladora portátil que consta de un grupo giratorio de seis cañones y capaz de disparar velocidades variables de hasta 6.000 disparos por minuto."},
	[`weapon_grenade`] 				 = {["name"] = "weapon_grenade", 		      	["label"] = "Granada", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_grenade.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una bomba arrojadiza de mano"},
	[`weapon_stickybomb`] 			 = {["name"] = "weapon_stickybomb", 		    ["label"] = "C4", 							["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_stickybomb.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una carga explosiva cubierta con un adhesivo que cuando se lanza contra un objeto se pega hasta que explota."},
	[`weapon_smokegrenade`] 		 = {["name"] = "weapon_smokegrenade", 	      	["label"] = "Granada de humoe", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_c4.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Una carga explosiva que se puede detonar de forma remota."},
	[`weapon_bzgas`] 				 = {["name"] = "weapon_bzgas", 			      	["label"] = "BZ Gas", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_bzgas.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un bote de gas que causa un dolor extremo."},
	[`weapon_molotov`] 				 = {["name"] = "weapon_molotov", 		      	["label"] = "Molotov", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_molotov.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una bomba cruda hecha de una botella llena de un líquido inflamable y equipada con una mecha para encender."},
	[`weapon_fireextinguisher`] 	 = {["name"] = "weapon_fireextinguisher",      	["label"] = "Extintor de incendios", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_fireextinguisher.png", 	["unique"] = true, 	["useable"] = false, 	["description"] = "Un dispositivo portátil que descarga un chorro de agua, espuma, gas u otro material para extinguir un incendio"},
	[`weapon_petrolcan`] 			 = {["name"] = "weapon_petrolcan", 		 	  	["label"] = "Lata de gasolina", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PETROLCAN",		["image"] = "weapon_petrolcan.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un recipiente de líquido robusto hecho de acero prensado"},
	[`weapon_briefcase`] 			 = {["name"] = "weapon_briefcase", 		 	  	["label"] = "Maletín", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_briefcase.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un maletín."},
	[`weapon_briefcase_02`] 		 = {["name"] = "weapon_briefcase_02", 	 	  	["label"] = "Maletín2", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_briefcase2.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un maletín."},
	[`weapon_ball`] 				 = {["name"] = "weapon_ball", 			 	  	["label"] = "Pelota", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_BALL",				["image"] = "weapon_ball.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "Un objeto sólido o hueco esférico con forma de huevo que se patea, lanza o golpea en un juego."},
	[`weapon_flare`] 				 = {["name"] = "weapon_flare", 			 	  	["label"] = "Pistola de bengalas", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "weapon_flare.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un pequeño dispositivo pirotécnico utilizado para iluminación y señalización."},
	[`weapon_snspistol`] 			 = {["name"] = "weapon_snspistol", 		 	  	["label"] = "Pistola SNS", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_snspistol.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego muy pequeña diseñada para ocultarse fácilmente."},
	[`weapon_bottle`] 				 = {["name"] = "weapon_bottle", 			 	["label"] = "Botella rota", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_bottle.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una botella rota"},
	[`weapon_gusenberg`] 			 = {["name"] = "weapon_gusenberg", 		 	  	["label"] = "Thompson SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "weapon_gusenberg.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un rifle automático comúnmente conocido como tommy gun."},
	[`weapon_specialcarbine`] 		 = {["name"] = "weapon_specialcarbine", 	 	["label"] = "Carabina Especial", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_specialcarbine.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un rifle de asalto extremadamente versátil para cualquier situación de combate."},
	[`weapon_heavypistol`] 			 = {["name"] = "weapon_heavypistol", 	 	  	["label"] = "Pistola Pesada", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_heavypistol.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego robusta diseñada para sostenerse en una mano."},
	[`weapon_bullpuprifle`] 		 = {["name"] = "weapon_bullpuprifle", 	 	  	["label"] = "Rifle Bullpup", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_bullpuprifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un rifle de asalto automático compacto"},
	[`weapon_dagger`] 				 = {["name"] = "weapon_dagger", 			 	["label"] = "Daga", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_dagger.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un cuchillo corto con una hoja puntiaguda y afilada, que se usa como arma."},
	[`weapon_vintagepistol`] 		 = {["name"] = "weapon_vintagepistol", 	 	  	["label"] = "Pistola Vintage", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_vintagepistol.png", ["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma de fuego antigua diseñada para sostenerse en una mano."},
	[`weapon_firework`] 			 = {["name"] = "weapon_firework", 		 	  	["label"] = "Lanzador de fuegos artificiales", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_firework.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un dispositivo que contiene pólvora y otros químicos combustibles que causa una explosión espectacular cuando se enciende."},
	[`weapon_musket`] 			     = {["name"] = "weapon_musket", 			 	["label"] = "Mosquete", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_musket.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Arma ligera de un soldado militar con un cañón largo, típicamente aburrido, de avancarga y disparada desde el hombro."},
	[`weapon_heavyshotgun`] 		 = {["name"] = "weapon_heavyshotgun", 	 	  	["label"] = "Escopeta pesada", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_heavyshotgun.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un cañón grande de ánima lisa para disparar pequeños tiros a corta distancia"},
	[`weapon_marksmanrifle`] 		 = {["name"] = "weapon_marksmanrifle", 	 	  	["label"] = "Rifle de tirador", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "weapon_marksmanrifle.png", ["unique"] = true, 		["useable"] = false, 	["description"] = "Un rifle de un solo disparo muy preciso"},
	[`weapon_hominglauncher`] 		 = {["name"] = "weapon_hominglauncher", 	 	["label"] = "Lanzador Homing", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_STINGER",			["image"] = "weapon_hominglauncher.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma equipada con un dispositivo electrónico que le permite encontrar y alcanzar un objetivo."},
	[`weapon_proxmine`] 			 = {["name"] = "weapon_proxmine", 		 	  	["label"] = "Granada de Proximidad", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_proximitymine.png", ["unique"] = true, 		["useable"] = false, 	["description"] = "Una bomba colocada en el suelo que detona al acercarse a su proximidad."},
	[`weapon_snowball`] 		     = {["name"] = "weapon_snowball", 		 	  	["label"] = "Bola de nieve", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_snowball.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una bola de nieve compacta, especialmente una hecha para arrojarla a otras personas por diversión."},
	[`weapon_flaregun`] 			 = {["name"] = "weapon_flaregun", 		 	  	["label"] = "Pistola de bengalas", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "weapon_flaregun.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una pistola para disparar cohetes de señales."},
	[`weapon_garbagebag`] 			 = {["name"] = "weapon_garbagebag", 		 	["label"] = "Bolsa de basura", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_garbagebag.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una bolsa de basura"},
	[`weapon_handcuffs`] 			 = {["name"] = "weapon_handcuffs", 		 	  	["label"] = "Eposas", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_handcuffs.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un par de anillos de metal enlazados con cerradura para asegurar las muñecas de un prisionero."},
	[`weapon_combatpdw`] 			 = {["name"] = "weapon_combatpdw", 		 	  	["label"] = "PDW de Combate", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_combatpdw.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una versión de combate de una ametralladora ligera de mano."},
	[`weapon_marksmanpistol`] 		 = {["name"] = "weapon_marksmanpistol", 	 	["label"] = "Pistola de tirador", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_marksmanpistol.png", ["unique"] = true, 	["useable"] = false, 	["description"] = "Un arma de fuego pequeña muy precisa diseñada para sostenerse en una mano"},
	[`weapon_knuckle`] 				 = {["name"] = "weapon_knuckle", 		 	  	["label"] = "Puño Americano", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_knuckle.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un protector de metal que se usa sobre los nudillos en las peleas, especialmente para aumentar el efecto de los golpes."},
	[`weapon_hatchet`] 				 = {["name"] = "weapon_hatchet", 		 	  	["label"] = "Hacha", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_hatchet.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un hacha pequeña con un mango corto para usar con una mano."},
	[`weapon_railgun`] 				 = {["name"] = "weapon_railgun", 		 	  	["label"] = "Raygun", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_railgun.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un arma que usa fuerza electromagnética para lanzar proyectiles de alta velocidad."},
	[`weapon_machete`] 				 = {["name"] = "weapon_machete", 		 	  	["label"] = "Machete", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_machete.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un cuchillo ancho y pesado utilizado como arma."},
	[`weapon_machinepistol`] 		 = {["name"] = "weapon_machinepistol", 	 	  	["label"] = "Tec-9", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_machinepistol.png", ["unique"] = true, 		["useable"] = false, 	["description"] = "Una pistola de carga automática capaz de disparar en ráfagas o disparar de forma totalmente automática."},
	[`weapon_switchblade`] 			 = {["name"] = "weapon_switchblade", 	 	  	["label"] = "Navaja Mariposa", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_switchblade.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un cuchillo con una hoja afilada que sale del mango cuando se presiona un botón."},
	[`weapon_revolver`] 			 = {["name"] = "weapon_revolver", 		 	  	["label"] = "Revolver", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_revolver.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una pistola con cámaras giratorias que permite disparar varios tiros sin recargar."},
	[`weapon_dbshotgun`] 			 = {["name"] = "weapon_dbshotgun", 		 	  	["label"] = "Escopeta de doble cañón", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_dbshotgun.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una escopeta con dos cañones paralelos, que permite disparar dos tiros sencillos en rápida sucesión."},
	[`weapon_compactrifle`] 		 = {["name"] = "weapon_compactrifle", 	 	  	["label"] = "Rifle compacto", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "weapon_compactrifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una versión compacta de un rifle de asalto."},
	[`weapon_autoshotgun`] 			 = {["name"] = "weapon_autoshotgun", 	 	  	["label"] = "Escopeta automática", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "weapon_autoshotgun.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Una escopeta capaz de disparar de forma rápida y continua."},
	[`weapon_battleaxe`] 			 = {["name"] = "weapon_battleaxe", 		 	  	["label"] = "Hacha de batalla", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_battleaxe.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "Un gran hacha de hoja ancha utilizada en la guerra antigua."},
	[`weapon_compactlauncher`] 		 = {["name"] = "weapon_compactlauncher",  	  	["label"] = "Lanzador compacto", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_compactlauncher.png", 	["unique"] = true, 	["useable"] = false, 	["description"] = "Un lanzagranadas compacto."},
	[`weapon_minismg`] 				 = {["name"] = "weapon_minismg", 		 	  	["label"] = "Mini SMG", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_minismg.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una mini ametralladora ligera de mano"},
	[`weapon_pipebomb`] 			 = {["name"] = "weapon_pipebomb", 		 	  	["label"] = "Pipe bom", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_pipebomb.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una bomba casera, cuyos componentes están contenidos en una tubería."},
	[`weapon_poolcue`] 				 = {["name"] = "weapon_poolcue", 		 	  	["label"] = "Taco de billar", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_poolcue.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Un palo que se usa para golpear una bola, generalmente la bola blanca (a veces)"},
	[`weapon_wrench`] 				 = {["name"] = "weapon_wrench", 			 	["label"] = "Llave inglesa", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_wrench.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una herramienta que se utiliza para sujetar y girar tuercas, pernos, tuberías, etc"},
	[`weapon_bread`] 				 = {["name"] = "weapon_bread", 				 	["label"] = "Barra de pan", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "baquette.png", 			["unique"] = true, 		["useable"] = false, 	["description"] = "¿Pan...?"},
	[`weapon_katana`] 				 = {["name"] = "weapon_katana", 				["label"] = "Katana", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "weapon_katana.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Una katana japonesa"},
	[`weapon_doubleaction`] 	     = {["name"] = "weapon_doubleaction", 			["label"] = "Revolver de doble acción", 	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_doubleaction.png",	["unique"] = true, 		["useable"] = false, 	["description"] = "Revolver del sheriff"},


}

-- Gangs
QBShared.Gangs = {
	["none"] = {
		label = "No Gang"
	},
	["lostmc"] = {
		label = "The Lost MC"
	},
	["ballas"] = {
		label = "Ballas"
	},
	["vagos"] = {
		label = "Vagos"
	},
	["cartel"] = {
		label = "Cartel"
	},
	["familes"] = {
		label = "Families"
	},
	["triads"] = {
		label = "Triads"
	}
}

-- Jobs
QBShared.Jobs = {
	["unemployed"] = {
		label = "Civil",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Desempleado",
                payment = 100
            },
        },
	},
	["police"] = {
		label = "SAPD",
		defaultDuty = false,
		bossmenu = vector3(448.4, -973.2, 30.6),
		grades = {
            ['0'] = {
                name = "Cadete LSPD",
                payment = 250
            },
			['1'] = {
                name = "Oficial I",
                payment = 275
            },
			['2'] = {
                name = "Oficial II",
                payment = 300
            },
			['3'] = {
                name = "Oficial III",
                payment = 350
            },
			['4'] = {
                name = "Oficial III+",
                payment = 375
            },
			['5'] = {
                name = "Sargento I LSPD",
                payment = 425
            },
			['6'] = {
                name = "Sargento II LSPD",
                payment = 475
            },
			['7'] = {
                name = "Detective I LSPD",
                payment = 500
            },
			['8'] = {
                name = "Detective II LSPD",
                payment = 550
            },
			['9'] = {
                name = "Teniente I LSPD",
                payment = 600
            },
			['10'] = {
                name = "Teniente II LSPD",
                payment = 650
            },
			['11'] = {
                name = "Capitán I LSPD",
                payment = 675
            },
			['12'] = {
                name = "Capitán II LSPD",
                payment = 700
            },
			['13'] = {
                name = "Comandante LSPD",
                payment = 725
            },
			['14'] = {
                name = "Jefe Supervisor",
				isboss = true,
                payment = 750
            },
			['15'] = {
                name = "Jefe Adjunto",
				isboss = true,
                payment = 775
            },
			['16'] = {
                name = "Jefe de Policía",
				isboss = true,
                payment = 800
            },
			['17'] = {
                name = "Director SAPD",
				isboss = true,
                payment = 1
            },
			['18'] = {
                name = "Cadete BCSD",
                payment = 250
            },
			['19'] = {
                name = "Ranger I",
                payment = 275
            },
			['20'] = {
                name = "Ranger II",
                payment = 300
            },
			['21'] = {
                name = "Ranger III",
                payment = 350
            },
			['22'] = {
                name = "Ranger III+",
                payment = 375
            },
			['23'] = {
                name = "Sargento I BCSD",
                payment = 425
            },
			['24'] = {
                name = "Sargento II BCSD",
                payment = 475
            },
			['25'] = {
                name = "Detective I BCSD",
                payment = 500
            },
			['26'] = {
                name = "Detective II BCSD",
                payment = 550
            },
			['27'] = {
                name = "Teniente I BCSD",
                payment = 600
            },
			['28'] = {
                name = "Teniente II BCSD",
                payment = 650
            },
			['29'] = {
                name = "Capitán I BCSD",
                payment = 675
            },
			['30'] = {
                name = "Capitán II BCSD",
                payment = 700
            },
			['31'] = {
                name = "Comandante BCSD",
                payment = 725
            },
			['32'] = {
                name = "Asistente del Sheriff",
				isboss = true,
                payment = 774
            },
			['33'] = {
                name = "Sheriff",
				isboss = true,
                payment = 800
            },
			['34'] = {
                name = "Medico",
				isboss = true,
                payment = 400
            },
			['35'] = {
                name = "Estudiante",
                payment = 100
            },
			['36'] = {
                name = "Secretaria",
                payment = 275
            },
        },
	},
	["ambulance"] = {
		label = "EMS",
		defaultDuty = false,
		bossmenu = vector3(270.5, -1363.0, 23.5),
		grades = {
            ['0'] = {
                name = "Estudiante",
                payment = 300
            },
			['1'] = {
                name = "Auxiliar",
                payment = 350
            },
			['2'] = {
                name = "Enfermero",
                payment = 450
            },
			['3'] = {
                name = "Médico",
                payment = 550
            },
			['4'] = {
                name = "Cirujano",
                payment = 650
            },
			['5'] = {
                name = "Supervisor de Personal",
                payment = 700
            },
			['6'] = {
                name = "Subjefe",
                payment = 750
            },
			['7'] = {
                name = "Jefe",
				isboss = true,
                payment = 800
            },
        },
	},
	["compraventagypsy"] = {
		label = "Compra Venta Gypsy",
		defaultDuty = false,
		bossmenu = vector3(270.5, -1363.0, 23.5),
		grades = {
            ['0'] = {
                name = "Trabajador",
                payment = 300
            },
			['1'] = {
                name = "Jefe",
				isboss = true,
                payment = 800
            },
        },
	},
	["pacificbluff"] = {
		label = "Pacific Bluff",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["realestate"] = {
		label = "Real Estate",
		defaultDuty = false,
		bossmenu = vector3(-124.786, -641.486, 167.820),
		grades = {
            ['0'] = {
                name = "Recruit",
                payment = 50
            },
			['1'] = {
                name = "House Sales",
                payment = 75
            },
			['2'] = {
                name = "Business Sales",
                payment = 100
            },
			['3'] = {
                name = "Broker",
                payment = 125
            },
			['4'] = {
                name = "Manager",
				isboss = true,
                payment = 150
            },
        },
	},
	["taxi"] = {
		label = "Taxi",
		defaultDuty = false,
		bossmenu = vector3(903.32, -170.55, 74.0),
		grades = {
            ['0'] = {
                name = "Taxista en prácticas",
                payment = 350
            },
			['1'] = {
                name = "Taxista Fijo",
                payment = 400
            },
			['2'] = {
                name = "Secretario",
                payment = 450
            },
			['3'] = {
                name = "Encargado",
                payment = 500
            },
			['4'] = {
                name = "Subjefe",
                payment = 600
            },
			['5'] = {
                name = "Jefe",
				isboss = true,
                payment = 650
            },
        },
	},
	["mechanic"] = {
		label = "Mecanico",
		defaultDuty = false,
		bossmenu = vector3(-342.291, -133.370, 39.009),
		grades = {
            ['0'] = {
                name = "Recruit",
                payment = 50
            },
			['1'] = {
                name = "Novice",
                payment = 75
            },
			['2'] = {
                name = "Experienced",
                payment = 100
            },
			['3'] = {
                name = "Advanced",
                payment = 125
            },
			['4'] = {
                name = "Manager",
				isboss = true,
                payment = 150
            },
        },
	},
	["judge"] = {
		label = "Honorario",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Juez",
                payment = 100
            },
        },
	},
	["lawyer"] = {
		label = "Bufete de abogados",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Abogado",
                payment = 50
            },
        },
	},
	["reporter"] = {
		label = "Reportero",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 50
            },
        },
	},
	["trucker"] = {
		label = "Camionero",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Conductor",
                payment = 50
            },
        },
	},
	["repartidor_badulake"] = {
		label = "Repartidor",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 50
            },
        },
	},
	["tow"] = {
		label = "Remolcador",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Conductor",
                payment = 50
            },
        },
	},
	["garbage"] = {
		label = "Basurero",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 50
            },
        },
	},
	["vineyard"] = {
		label = "Viñedos",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 50
            },
        },
	},
	["hotdog"] = {
		label = "Vendedor de Hotdogs",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Vendedor",
                payment = 50
            },
        },
	},
	["minero"] = {
		label = "Minero",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Trabajador",
                payment = 50
            },
        },
	},
	["badu"] = {
		label = "Badulaque Vanilla",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu2"] = {
		label = "Badulaque Ruta 68",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu3"] = {
		label = "Badulaque Central",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu4"] = {
		label = "Badulaque Sandy",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu5"] = {
		label = "Badulaque Mirror Park",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu6"] = {
		label = "Badu Paleto",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu7"] = {
		label = "Licorería Marina Drive",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu8"] = {
		label = "Licorería Vice City",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu9"] = {
		label = "Badulaque Groove",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu10"] = {
		label = "Badulaque Vinewood",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu11"] = {
		label = "Licorería del Perro",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu12"] = {
		label = "Badulaque Ruta15",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu13"] = {
		label = "Badulaque Ruta1",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["badu14"] = {
		label = "Licorería Vespucci",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["weazelnews"] = {
		label = "7 News",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["vanilla"] = {
		label = "Vanilla",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["pearls"] = {
		label = "Pearls",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["tequila"] = {
		label = "Tequila",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["yellowjack"] = {
		label = "Yellow Jack",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["bahamas"] = {
		label = "Bahamas",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["blackwoods"] = {
		label = "BlackWoods",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["pubcasino"] = {
		label = "Pub Casino",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["terrazacasino"] = {
		label = "Terraza Casino",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["barrecreativo"] = {
		label = "Bar Recreativo",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["galaxy"] = {
		label = "Galaxy",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["cardealer"] = {
		label = "Concesionario",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["compraVenta"] = {
		label = "CompraVenta",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["bennys"] = {
		label = "Bennys",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["nortwayautos"] = {
		label = "NorthWay Autos",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["paletomonkey"] = {
		label = "Paleto Monkey",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["hayesauto"] = {
		label = "Hayes auto",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["mayerautos"] = {
		label = "Mayer Autos",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["lscustom"] = {
		label = "Los Santos Custom",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["circuitosur"] = {
		label = "Circuito del Sur",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["circuitosandy"] = {
		label = "Circuito Sandy",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["sedemotera"] = {
		label = "Bar Motero",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["electronica"] = {
		label = "Tienda de Electronica",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["casino"] = {
		label = "Casino",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["ammuciudad"] = {
		label = "Ammu Ciudad",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["ammuvinewood"] = {
		label = "Ammunation Vinewood",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["ammupaleto"] = {
		label = "Ammu Paleto",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["ammuvespucci"] = {
		label = "Ammunation Vespucci",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["ammusandy"] = {
		label = "Ammu Sandy",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["ammuzancudo"] = {
		label = "Ammu Zancudo",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["ammulittleseoul"] = {
		label = "Ammu Little Seoul",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["airlanda"] = {
		label = "Airlanda",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["gimnasio"] = {
		label = "Gimnasio",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["thepatriot"] = {
		label = "The Patriot",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["merryweather"] = {
		label = "Merryweather",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["theirishsky"] = {
		label = "The Irish Sky",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["heredia"] = {
		label = "Heredia",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["lasanta"] = {
		label = "La Santa",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 300
            },
			['1'] = {
                name = "Encargado",
                payment = 350
            },
			['2'] = {
                name = "Jefe",
				isboss = true,
                payment = 500
            },
        },
	},
	["portuario"] = {
		label = "Portuario",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 125
            },
        },
	},
	["electricista"] = {
		label = "Electricista",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 125
            },
        },
	},
	["granjero"] = {
		label = "Granjero",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 125
            },
        },
	},
	["ganadero"] = {
		label = "Ganadero",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Empleado",
                payment = 125
            },
        },
	},
}

-- Vehicles
QBShared.Vehicles = {
	["adder"] = {
		["name"] = "Adder",
		["brand"] = "Truffade",
		["model"] = "adder",
		["price"] = 297000,
		["category"] = "super",
		["hash"] = "-1216765807",
		["shop"] = "pdm",
	},
	["alpha"] = {
		["name"] = "Alpha",
		["brand"] = "Albany",
		["model"] = "alpha",
		["price"] = 24000,
		["category"] = "sports",
		["hash"] = "767087018",
		["shop"] = "pdm",
	},
	["ardent"] = {
		["name"] = "Ardent",
		["brand"] = "Ocelot",
		["model"] = "ardent",
		["price"] = 11500000,
		["category"] = "sportsclassics",
		["hash"] = `ardent`,
		["shop"] = "pdm",
	},
	["asea"] = {
		["name"] = "Asea",
		["brand"] = "Declasse",
		["model"] = "asea",
		["price"] = 7500,
		["category"] = "sedans",
		["hash"] = "-1809822327",
		["shop"] = "pdm",
	},
	["autarch"] = {
		["name"] = "Autarch",
		["brand"] = "Överflöd",
		["model"] = "autarch",
		["price"] = 419000,
		["category"] = "super",
		["hash"] = "-313185164",
		["shop"] = "pdm",
	},
	["avarus"] = {
		["name"] = "Avarus",
		["brand"] = "LCC",
		["model"] = "avarus",
		["price"] = 15500,
		["category"] = "motorcycles",
		["hash"] = "-2115793025",
		["shop"] = "pdm",
	},
	["bagger"] = {
		["name"] = "Bagger",
		["brand"] = "WMC",
		["model"] = "bagger",
		["price"] = 15000,
		["category"] = "motorcycles",
		["hash"] = "-2140431165",
		["shop"] = "pdm",
	},
	["baller2"] = {
		["name"] = "Baller",
		["brand"] = "Gallivanter",
		["model"] = "baller2",
		["price"] = 42000,
		["category"] = "suvs",
		["hash"] = "142944341",
		["shop"] = "pdm",
	},
	["baller3"] = {
		["name"] = "Baller LE",
		["brand"] = "Gallivanter",
		["model"] = "baller3",
		["price"] = 50900,
		["category"] = "suvs",
		["hash"] = "1878062887",
		["shop"] = "pdm",
	},
	["banshee"] = {
		["name"] = "Banshee",
		["brand"] = "Bravado",
		["model"] = "banshee",
		["price"] = 36000,
		["category"] = "sports",
		["hash"] = "-1041692462",
		["shop"] = "pdm",
	},
	["banshee2"] = {
		["name"] = "Banshee 900R",
		["brand"] = "Bravado",
		["model"] = "banshee2",
		["price"] = 121000,
		["category"] = "super",
		["hash"] = "633712403",
		["shop"] = "pdm",
	},
	["bati"] = {
		["name"] = "Bati 801",
		["brand"] = "Pegassi",
		["model"] = "bati",
		["price"] = 33200,
		["category"] = "motorcycles",
		["hash"] = "-114291515",
		["shop"] = "pdm",
	},
	["bestiagts"] = {
		["name"] = "Bestia GTS",
		["brand"] = "Grotti",
		["model"] = "bestiagts",
		["price"] = 37000,
		["category"] = "sports",
		["hash"] = "1274868363",
		["shop"] = "pdm",
	},
	["bfinjection"] = {
		["name"] = 'Bf Injection', 
		["brand"] = "Annis",
		["price"] = 16900,
		["category"] = "offroad",
		["model"] = "bfinjection",
		["hash"] = `bfinjection`,
		["shop"] = "pdm",
	},
	["bifta"] = {
		["name"] = 'Bifta', 
		["brand"] = "Annis",
		["price"] = 21500,
		["category"] = "offroad",
		["model"] = "bifta",
		["hash"] = `bifta`,
		["shop"] = "pdm",
	},
	["bison"] = {
		["name"] = "Bison",
		["brand"] = "Bravado",
		["model"] = "bison",
		["price"] = 56000,
		["category"] = "vans",
		["hash"] = "-16948145",
		["shop"] = "pdm",
	},
	["bjxl"] = {
		["name"] = "BeeJay XL",
		["brand"] = "Karin",
		["model"] = "bjxl",
		["price"] = 40000,
		["category"] = "suvs",
		["hash"] = "850565707",
		["shop"] = "pdm",
	},
	["blade"] = {
		["name"] = "Blade",
		["brand"] = "Vapid",
		["model"] = "blade",
		["price"] = 10350,
		["category"] = "muscle",
		["hash"] = "-1205801634",
		["shop"] = "pdm",
	},
	["blazer"] = {
		["name"] = 'Blazer', 
		["price"] = 8000,
		["category"] = "offroad",
		["model"] = "blazer",
		["hash"] = `blazer`,
		["shop"] = "pdm",
	},
	["blazer4"] = {
		["name"] = 'Blazer Sport',
		["brand"] = "Annis",
		["price"] = 18000,
		["category"] = "offroad",
		["model"] = "blazer4",
		["hash"] = `blazer4`,
		["shop"] = "pdm",
	},
	["blista"] = {
		["name"] = "Blista",
		["brand"] = "Dinka",
		["model"] = "blista",
		["price"] = 8100,
		["category"] = "compacts",
		["hash"] = "-344943009",
		["shop"] = "pdm",
	},
	["blista2"] = {
		["name"] = "Blista Compact",
		["brand"] = "Dinka",
		["model"] = "blista2",
		["price"] = 21000,
		["category"] = "compacts",
		["hash"] = "1039032026",
		["shop"] = "pdm",
	},
	["bobcatxl"] = {
		["name"] = "Bobcat XL Open",
		["brand"] = "Vapid",
		["model"] = "bobcatxl",
		["price"] = 43000,
		["category"] = "vans",
		["hash"] = "1069929536",
		["shop"] = "pdm",
	},
	["brawler"] = {
		["name"] = 'Brawler', 
		["brand"] = "Annis",
		["price"] = 24500,
		["category"] = "offroad",
		["model"] = "brawler",
		["hash"] = `brawler`,
		["shop"] = "pdm",
	},
	["brioso"] = {
		["name"] = "Brioso R/A",
		["brand"] = "Grotti",
		["model"] = "brioso",
		["price"] = 16000,
		["category"] = "compacts",
		["hash"] = "1549126457",
		["shop"] = "pdm",
	},
	["btype"] = {
		["name"] = "Roosevelt",
		["brand"] = "Albany",
		["model"] = "btype",
		["price"] = 325000,
		["category"] = "sportsclassics",
		["hash"] = "117401876",
		["shop"] = "pdm",
	},
	["btype2"] = {
		["name"] = "Franken Stange",
		["brand"] = "Albany",
		["model"] = "btype2",
		["price"] = 350000,
		["category"] = "sportsclassics",
		["hash"] = "-831834716",
		["shop"] = "pdm",
	},
	["btype3"] = {
		["name"] = "Roosevelt Valor",
		["brand"] = "Albany",
		["model"] = "btype3",
		["price"] = 375000,
		["category"] = "sportsclassics",
		["hash"] = "-602287871",
		["shop"] = "pdm",
	},
	["buccaneer"] = {
		["name"] = "Buccaneer",
		["brand"] = "Albany",
		["model"] = "buccaneer",
		["price"] = 18500,
		["category"] = "muscle",
		["hash"] = "-682211828",
		["shop"] = "pdm",
	},
	["buccaneer2"] = {
		["name"] = "Buccaneer Rider",
		["brand"] = "Albany",
		["model"] = "buccaneer2",
		["price"] = 29500,
		["category"] = "muscle",
		["hash"] = "-1013450936",
		["shop"] = "pdm",
	},
	["buffalo"] = {
		["name"] = "Buffalo",
		["brand"] = "Bravado",
		["model"] = "buffalo",
		["price"] = 17500,
		["category"] = "sports",
		["hash"] = "-304802106",
		["shop"] = "pdm",
	},
	["buffalo2"] = {
		["name"] = "Buffalo S",
		["brand"] = "Bravado",
		["model"] = "buffalo2",
		["price"] = 22500,
		["category"] = "sports",
		["hash"] = "736902334",
		["shop"] = "pdm",
	},
	["bullet"] = {
		["name"] = "Bullet",
		["brand"] = "Vapid",
		["model"] = "bullet",
		["price"] = 86000,
		["category"] = "super",
		["hash"] = "-1696146015",
		["shop"] = "pdm",
	},
	["burrito3"] = {
		["name"] = "Burrito",
		["brand"] = "Declasse",
		["model"] = "burrito3",
		["price"] = 20000,
		["category"] = "vans",
		["hash"] = "-1743316013",
		["shop"] = "pdm",
	},
	["gburrito2"] = {
		["name"] = "Burrito Custom",
		["brand"] = "Declasse",
		["model"] = "gburrito2",
		["price"] = 30000,
		["category"] = "vans",
		["hash"] = "296357396",
		["shop"] = "pdm",
	},
	["carbonizzare"] = {
		["name"] = "Carbonizzare",
		["brand"] = "Grotti",
		["model"] = "carbonizzare",
		["price"] = 48300,
		["category"] = "sports",
		["hash"] = "2072687711",
		["shop"] = "pdm",
	},
	["carbonrs"] = {
		["name"] = "Carbon RS",
		["brand"] = "Nagasaki",
		["model"] = "carbonrs",
		["price"] = 38800,
		["category"] = "motorcycles",
		["hash"] = "11251904",
		["shop"] = "pdm",
	},
	["casco"] = {
		["name"] = "Casco",
		["brand"] = "Lampadati",
		["model"] = "casco",
		["price"] = 66000,
		["category"] = "sportsclassics",
		["hash"] = "941800958",
		["shop"] = "pdm",
	},
	["cavalcade2"] = {
		["name"] = "Cavalcade",
		["brand"] = "Albany",
		["model"] = "cavalcade2",
		["price"] = 33800,
		["category"] = "suvs",
		["hash"] = "-789894171",
		["shop"] = "pdm",
	},
	["cheetah"] = {
		["name"] = "Cheetah",
		["brand"] = "Grotti",
		["model"] = "cheetah",
		["price"] = 161000,
		["category"] = "super",
		["hash"] = "-1311154784",
		["shop"] = "pdm",
	},
	["cheetah2"] = {
		["name"] = "Cheetah Classic",
		["brand"] = "Grotti",
		["model"] = "cheetah2",
		["price"] = 200000,
		["category"] = "sports",
		["hash"] = "223240013",
		["shop"] = "pdm",
	},
	["chimera"] = {
		["name"] = "Chimera",
		["brand"] = "Nagasaki",
		["model"] = "chimera",
		["price"] = 18900,
		["category"] = "motorcycles",
		["hash"] = "6774487",
		["shop"] = "pdm",
	},
	["chino"] = {
		["name"] = "Chino",
		["brand"] = "Vapid",
		["model"] = "chino",
		["price"] = 14100,
		["category"] = "muscle",
		["hash"] = "349605904",
		["shop"] = "pdm",
	},
	["chino2"] = {
		["name"] = "Chino Luxe",
		["brand"] = "Vapid",
		["model"] = "chino2",
		["price"] = 17800,
		["category"] = "muscle",
		["hash"] = "-1361687965",
		["shop"] = "pdm",
	},
	["cogcabrio"] = {
		["name"] = "Cognoscenti Cabrio",
		["brand"] = "Enus",
		["model"] = "cogcabrio",
		["price"] = 18000,
		["category"] = "coupes",
		["hash"] = "330661258",
		["shop"] = "pdm",
	},
	["cognoscenti"] = {
		["name"] = "Cognoscenti",
		["brand"] = "Enus",
		["model"] = "cognoscenti",
		["price"] = 25600,
		["category"] = "sedans",
		["hash"] = "-2030171296",
		["shop"] = "pdm",
	},
	["comet2"] = {
		["name"] = "Comet",
		["brand"] = "Pfister",
		["model"] = "comet2",
		["price"] = 51500,
		["category"] = "sports",
		["hash"] = "-1045541610",
		["shop"] = "pdm",
	},
	["comet3"] = {
		["name"] = "Comet Retro Custom",
		["brand"] = "Pfister",
		["model"] = "comet3",
		["price"] = 56000,
		["category"] = "sports",
		["hash"] = "-2022483795",
		["shop"] = "pdm",
	},
	["comet5"] = {
		["name"] = "Comet SR",
		["brand"] = "Pfister",
		["model"] = "comet5",
		["price"] = 95000,
		["category"] = "sports",
		["hash"] = "661493923",
		["shop"] = "pdm",
	},
	["coquette"] = {
		["name"] = "Coquette",
		["brand"] = "Invetero",
		["model"] = "coquette",
		["price"] = 81000,
		["category"] = "sports",
		["hash"] = "108773431",
		["shop"] = "pdm",
	},
	["coquette2"] = {
		["name"] = "Coquette Classic",
		["brand"] = "Invetero",
		["model"] = "coquette2",
		["price"] = 49000,
		["category"] = "sportsclassics",
		["hash"] = "1011753235",
		["shop"] = "pdm",
	},
	["coquette3"] = {
		["name"] = "Coquette BlackFin",
		["brand"] = "Invetero",
		["model"] = "coquette3",
		["price"] = 45000,
		["category"] = "muscle",
		["hash"] = "784565758",
		["shop"] = "pdm",
	},
	["cyclone"] = {
		["name"] = "Cyclone",
		["brand"] = "Coil",
		["model"] = "cyclone",
		["price"] = 211000,
		["category"] = "super",
		["hash"] = "1392481335",
		["shop"] = "pdm",
	},
	["daemon"] = {
		["name"] = "Daemon",
		["brand"] = "WMC",
		["model"] = "daemon",
		["price"] = 16200,
		["category"] = "motorcycles",
		["hash"] = "2006142190",
		["shop"] = "pdm",
	},
	["defiler"] = {
		["name"] = "Defiler",
		["brand"] = "Shitzu",
		["model"] = "defiler",
		["price"] = 19700,
		["category"] = "motorcycles",
		["hash"] = "822018448",
		["shop"] = "pdm",
	},
	["dilettante"] = {
		["name"] = "Dilettante",
		["brand"] = "Karin",
		["model"] = "dilettante",
		["price"] = 13000,
		["category"] = "compacts",
		["hash"] = "-1130810103",
		["shop"] = "pdm",
	},
	["dominator"] = {
		["name"] = "Dominator",
		["brand"] = "Vapid",
		["model"] = "dominator",
		["price"] = 31000,
		["category"] = "muscle",
		["hash"] = "80636076",
		["shop"] = "pdm",
	},
	["dubsta2"] = {
		["name"] = "Dubsta Luxuary",
		["brand"] = "Benefactor",
		["model"] = "dubsta2",
		["price"] = 61000,
		["category"] = "suvs",
		["hash"] = "-394074634",
		["shop"] = "pdm",
	},
	["dubsta3"] = {
		["name"] = 'Bubsta 6x6', 
		["brand"] = "Annis",
		["price"] = 100000,
		["category"] = "offroad",
		["model"] = "dubsta3",
		["hash"] = `dubsta3`,
		["shop"] = "pdm",
	},
	["dukes"] = {
		["name"] = "Dukes",
		["brand"] = "Imponte",
		["model"] = "dukes",
		["price"] = 13600,
		["category"] = "muscle",
		["hash"] = "723973206",
		["shop"] = "pdm",
	},
	["dune"] = {
		["name"] = 'Dune Buggy', 
		["brand"] = "Annis",
		["price"] = 19800,
		["category"] = "offroad",
		["model"] = "dune",
		["hash"] = `dune`,
		["shop"] = "pdm",
	},
	["elegy"] = {
		["name"] = "Elegy Retro Custom",
		["brand"] = "Annis",
		["model"] = "elegy",
		["price"] = 46000,
		["category"] = "sports",
		["hash"] = "196747873 ",
		["shop"] = "pdm",
	},
	["elegy2"] = {
		["name"] = "Elegy RH8",
		["brand"] = "Annis",
		["model"] = "elegy2",
		["price"] = 49000,
		["category"] = "sports",
		["hash"] = "-566387422",
		["shop"] = "pdm",
	},
	["ellie"] = {
		["name"] = "Ellie",
		["brand"] = "Vapid",
		["model"] = "ellie",
		["price"] = 50500,
		["category"] = "muscle",
		["hash"] = "-1267543371",
		["shop"] = "pdm",
	},
	["emperor"] = {
		["name"] = "Emperor",
		["brand"] = "Albany",
		["model"] = "emperor",
		["price"] = 7200,
		["category"] = "sedans",
		["hash"] = "-685276541",
		["shop"] = "pdm",
	},
	["entity2"] = {
		["name"] = "Entity XXR",
		["brand"] = "Överflöd",
		["model"] = "entity2",
		["price"] = 176000,
		["category"] = "super",
		["hash"] = "-2120700196",
		["shop"] = "pdm",
	},
	["entityxf"] = {
		["name"] = "Entity XF",
		["brand"] = "Överflöd",
		["model"] = "entityxf",
		["price"] = 161000,
		["category"] = "super",
		["hash"] = "-1291952903",
		["shop"] = "pdm",
	},
	["esskey"] = {
		["name"] = "Esskey",
		["brand"] = "Pegassi",
		["model"] = "esskey",
		["price"] = 10350,
		["category"] = "motorcycles",
		["hash"] = "2035069708",
		["shop"] = "pdm",
	},
	["exemplar"] = {
		["name"] = "Exemplar",
		["brand"] = "Dewbauchee",
		["model"] = "exemplar",
		["price"] = 20000,
		["category"] = "coupes",
		["hash"] = "-5153954",
		["shop"] = "pdm",
	},
	["f620"] = {
		["name"] = "F620",
		["brand"] = "Ocelot",
		["model"] = "f620",
		["price"] = 23000,
		["category"] = "coupes",
		["hash"] = "-591610296",
		["shop"] = "pdm",
	},
	["faction"] = {
		["name"] = "Faction",
		["brand"] = "Willard",
		["model"] = "faction",
		["price"] = 12000,
		["category"] = "muscle",
		["hash"] = "-2119578145",
		["shop"] = "pdm",
	},
	["faction2"] = {
		["name"] = "Faction Rider",
		["brand"] = "Willard",
		["model"] = "faction2",
		["price"] = 20700,
		["category"] = "muscle",
		["hash"] = "-1790546981",
		["shop"] = "pdm",
	},
	["fagaloa"] = {
		["name"] = "Fagaloa",
		["brand"] = "Vulcar",
		["model"] = "fagaloa",
		["price"] = 35000,
		["category"] = "sportsclassics",
		["hash"] = `fagaloa`,
		["shop"] = "pdm",
	},
	["faggio"] = {
		["name"] = "Faggio Sport",
		["brand"] = "Pegassi",
		["model"] = "faggio",
		["price"] = 3900,
		["category"] = "motorcycles",
		["hash"] = "55628203",
		["shop"] = "pdm",
	},
	["faggio3"] = {
		["name"] = "Faggio Mod",
		["brand"] = "Pegassi",
		["model"] = "faggio3",
		["price"] = 14200,
		["category"] = "motorcycles",
		["hash"] = "-1289178744",
		["shop"] = "pdm",
	},
	["felon"] = {
		["name"] = "Felon",
		["brand"] = "Lampadati",
		["model"] = "felon",
		["price"] = 18000,
		["category"] = "coupes",
		["hash"] = "-391594584",
		["shop"] = "pdm",
	},
	["felon2"] = {
		["name"] = "Felon GT",
		["brand"] = "Lampadati",
		["model"] = "felon2",
		["price"] = 23000,
		["category"] = "coupes",
		["hash"] = "-89291282",
		["shop"] = "pdm",
	},
	["feltzer2"] = {
		["name"] = "Feltzer",
		["brand"] = "Benefactor",
		["model"] = "feltzer2",
		["price"] = 42000,
		["category"] = "sports",
		["hash"] = "-1995326987",
		["shop"] = "pdm",
	},
	["feltzer3"] = {
		["name"] = "Stirling GT",
		["brand"] = "Benefactor",
		["model"] = "feltzer3",
		["price"] = 60000,
		["category"] = "sportsclassics",
		["hash"] = "-1566741232",
		["shop"] = "pdm",
	},
	["flashgt"] = {
		["name"] = "Flash GT",
		["brand"] = "Vapid",
		["model"] = "flashgt",
		["price"] = 63000,
		["category"] = "sports",
		["hash"] = "-1259134696",
		["shop"] = "pdm",
	},
	["fmj"] = {
		["name"] = "FMJ",
		["brand"] = "Vapid",
		["model"] = "fmj",
		["price"] = 242000,
		["category"] = "super",
		["hash"] = "1426219628",
		["shop"] = "pdm",
	},
	["fq2"] = {
		["name"] = "FQ2",
		["brand"] = "Fathom",
		["model"] = "fq2",
		["price"] = 38000,
		["category"] = "suvs",
		["hash"] = "-1137532101",
		["shop"] = "pdm",
	},
	["fugitive"] = {
		["name"] = "Fugitive",
		["brand"] = "Cheval",
		["model"] = "fugitive",
		["price"] = 17600,
		["category"] = "sedans",
		["hash"] = "1909141499",
		["shop"] = "pdm",
	},
	["furoregt"] = {
		["name"] = "Furore GT",
		["brand"] = "Lampadati",
		["model"] = "furoregt",
		["price"] = 42000,
		["category"] = "sports",
		["hash"] = "-1089039904",
		["shop"] = "pdm",
	},
	["futo"] = {
		["name"] = "Futo",
		["brand"] = "Karin",
		["model"] = "futo",
		["price"] = 33000,
		["category"] = "coupes",
		["hash"] = "2016857647",
		["shop"] = "pdm",
	},
	["gauntlet"] = {
		["name"] = "Gauntlet",
		["brand"] = "Bravado",
		["model"] = "gauntlet",
		["price"] = 37000,
		["category"] = "muscle",
		["hash"] = "-1800170043",
		["shop"] = "pdm",
	},
	["glendale"] = {
		["name"] = "Glendale",
		["brand"] = "Benefactor",
		["model"] = "glendale",
		["price"] = 11500,
		["category"] = "sedans",
		["hash"] = "75131841",
		["shop"] = "pdm",
	},
	["gp1"] = {
		["name"] = "GP1",
		["brand"] = "Progen",
		["model"] = "gp1",
		["price"] = 462000,
		["category"] = "super",
		["hash"] = "1234311532",
		["shop"] = "pdm",
	},
	["granger"] = {
		["name"] = "Granger",
		["brand"] = "Declasse",
		["model"] = "granger",
		["price"] = 63000,
		["category"] = "suvs",
		["hash"] = "-1775728740",
		["shop"] = "pdm",
	},
	["gresley"] = {
		["name"] = "Gresley",
		["brand"] = "Bravado",
		["model"] = "gresley",
		["price"] = 40500,
		["category"] = "suvs",
		["hash"] = "-1543762099",
		["shop"] = "pdm",
	},
	["gt500"] = {
		["name"] = "GT500",
		["brand"] = "Grotti",
		["model"] = "gt500",
		["price"] = 38000,
		["category"] = "sportsclassics",
		["hash"] = "-2079788230",
		["shop"] = "pdm",
	},
	["guardian"] = {
		["name"] = 'Guardian', 
		["brand"] = "Annis",
		["price"] = 65700,
		["category"] = "offroad",
		["model"] = "guardian",
		["hash"] = `guardian`,
		["shop"] = "pdm",
	},
	["hakuchou"] = {
		["name"] = "Hakuchou",
		["brand"] = "Shitzu",
		["model"] = "hakuchou",
		["price"] = 53000,
		["category"] = "motorcycles",
		["hash"] = "1265391242",
		["shop"] = "pdm",
	},
	["hexer"] = {
		["name"] = "Hexer",
		["brand"] = "LCC",
		["model"] = "hexer",
		["price"] = 13000,
		["category"] = "motorcycles",
		["hash"] = "301427732",
		["shop"] = "pdm",
	},
	["hotknife"] = {
		["name"] = "Hotknife",
		["brand"] = "Vapid",
		["model"] = "hotknife",
		["price"] = 16200,
		["category"] = "muscle",
		["hash"] = "37348240",
		["shop"] = "pdm",
	},
	["huntley"] = {
		["name"] = "Huntley S",
		["brand"] = "Enus",
		["model"] = "huntley",
		["price"] = 39000,
		["category"] = "suvs",
		["hash"] = "486987393",
		["shop"] = "pdm",
	},
	["hustler"] = {
		["name"] = "Hustler",
		["brand"] = "Vapid",
		["model"] = "hustler",
		["price"] = 29000,
		["category"] = "muscle",
		["hash"] = "600450546",
		["shop"] = "pdm",
	},
	["infernus"] = {
		["name"] = "Infernus",
		["brand"] = "Pegassi",
		["model"] = "infernus",
		["price"] = 99000,
		["category"] = "super",
		["hash"] = "418536135",
		["shop"] = "pdm",
	},
	["infernus2"] = {
		["name"] = "Infernus Classic",
		["brand"] = "Pegassi",
		["model"] = "infernus2",
		["price"] = 175000,
		["category"] = "sportsclassics",
		["hash"] = "-1405937764",
		["shop"] = "pdm",
	},
	["intruder"] = {
		["name"] = "Intruder",
		["brand"] = "Karin",
		["model"] = "intruder",
		["price"] = 14850,
		["category"] = "sedans",
		["hash"] = "886934177",
		["shop"] = "pdm",
	},
	["issi2"] = {
		["name"] = "Issi",
		["brand"] = "Weeny",
		["model"] = "issi2",
		["price"] = 11500,
		["category"] = "compacts",
		["hash"] = "-1177863319",
		["shop"] = "pdm",
	},
	["issi3"] = {
		["name"] = "Issi Classic",
		["brand"] = "Weeny",
		["model"] = "issi3",
		["price"] = 16500,
		["category"] = "compacts",
		["hash"] = "931280609",
		["shop"] = "pdm",
	},
	["italigtb"] = {
		["name"] = "Itali GTB",
		["brand"] = "Progen",
		["model"] = "italigtb",
		["price"] = 271000,
		["category"] = "super",
		["hash"] = "-482719877",
		["shop"] = "pdm",
	},
	["jackal"] = {
		["name"] = "Jackal",
		["brand"] = "Ocelot",
		["model"] = "jackal",
		["price"] = 19900,
		["category"] = "coupes",
		["hash"] = "-624529134",
		["shop"] = "pdm",
	},
	["jester"] = {
		["name"] = "Jester",
		["brand"] = "Dinka",
		["model"] = "jester",
		["price"] = 84000,
		["category"] = "sports",
		["hash"] = "-1297672541",
		["shop"] = "pdm",
	},
	["jester3"] = {
		["name"] = "Jester Classic",
		["brand"] = "Dinka",
		["model"] = "jester3",
		["price"] = 94000,
		["category"] = "sports",
		["hash"] = "-214906006",
		["shop"] = "pdm",
	},
	["khamelion"] = {
		["name"] = "Khamelion",
		["brand"] = "Hijak",
		["model"] = "khamelion",
		["price"] = 46000,
		["category"] = "sports",
		["hash"] = "544021352",
		["shop"] = "pdm",
	},
	["kuruma"] = {
		["name"] = "Kuruma",
		["brand"] = "Karin",
		["model"] = "kuruma",
		["price"] = 93000,
		["category"] = "sports",
		["hash"] = "-1372848492",
		["shop"] = "pdm",
	},
	["landstalker"] = {
		["name"] = "Landstalker",
		["brand"] = "Dundreary",
		["model"] = "landstalker",
		["price"] = 34200,
		["category"] = "suvs",
		["hash"] = "1269098716",
		["shop"] = "pdm",
	},
	["lynx"] = {
		["name"] = "Lynx",
		["brand"] = "Ocelot",
		["model"] = "lynx",
		["price"] = 58000,
		["category"] = "sports",
		["hash"] = "482197771",
		["shop"] = "pdm",
	},
	["mamba"] = {
		["name"] = "Mamba",
		["brand"] = "Declasse",
		["model"] = "mamba",
		["price"] = 55000,
		["category"] = "sportsclassics",
		["hash"] = "-1660945322",
		["shop"] = "pdm",
	},
	["massacro"] = {
		["name"] = "Massacro",
		["brand"] = "Dewbauchee",
		["model"] = "massacro",
		["price"] = 88000,
		["category"] = "sports",
		["hash"] = "-142942670",
		["shop"] = "pdm",
	},
	["monroe"] = {
		["name"] = "Monroe",
		["brand"] = "Pegassi",
		["model"] = "monroe",
		["price"] = 40000,
		["category"] = "sportsclassics",
		["hash"] = "-433375717",
		["shop"] = "pdm",
	},
	["moonbeam"] = {
		["name"] = "Moonbeam",
		["brand"] = "Declasse",
		["model"] = "moonbeam",
		["price"] = 29000,
		["category"] = "vans",
		["hash"] = "525509695",
		["shop"] = "pdm",
	},
	["nemesis"] = {
		["name"] = "Nemesis",
		["brand"] = "Principe",
		["model"] = "nemesis",
		["price"] = 11400,
		["category"] = "motorcycles",
		["hash"] = "-634879114",
		["shop"] = "pdm",
	},
	["neon"] = {
		["name"] = "Neon",
		["brand"] = "Pfister",
		["model"] = "neon",
		["price"] = 115000,
		["category"] = "sports",
		["hash"] = "-1848994066",
		["shop"] = "pdm",
	},
	["nero"] = {
		["name"] = "Nero",
		["brand"] = "Truffade",
		["model"] = "nero",
		["price"] = 229000,
		["category"] = "super",
		["hash"] = "1034187331",
		["shop"] = "pdm",
	},
	["nightblade"] = {
		["name"] = "Nightblade",
		["brand"] = "WMC",
		["model"] = "nightblade",
		["price"] = 21000,
		["category"] = "motorcycles",
		["hash"] = "-1606187161",
		["shop"] = "pdm",
	},
	["nightshade"] = {
		["name"] = "Nightshade",
		["brand"] = "Imponte",
		["model"] = "nightshade",
		["price"] = 30500,
		["category"] = "muscle",
		["hash"] = "-1943285540",
		["shop"] = "pdm",
	},
	["ninef"] = {
		["name"] = "9F",
		["brand"] = "Obey",
		["model"] = "ninef",
		["price"] = 76000,
		["category"] = "sports",
		["hash"] = "1032823388",
		["shop"] = "pdm",
	},
	["ninef2"] = {
		["name"] = "9F Cabrio",
		["brand"] = "Obey",
		["model"] = "ninef2",
		["price"] = 74500,
		["category"] = "sports",
		["hash"] = "-1461482751",
		["shop"] = "pdm",
	},
	["omnis"] = {
		["name"] = "Omnis",
		["brand"] = "Wow",
		["model"] = "omnis",
		["price"] = 80000,
		["category"] = "sports",
		["hash"] = `omnis`,
		["shop"] = "pdm",
	},
	["oracle"] = {
		["name"] = "Oracle",
		["brand"] = "Ubermacht",
		["model"] = "oracle",
		["price"] = 25000,
		["category"] = "sedans",
		["hash"] = `oracle`,
		["shop"] = "pdm",
	},
	["oracle2"] = {
		["name"] = "Oracle XS",
		["brand"] = "Übermacht",
		["model"] = "oracle2",
		["price"] = 18300,
		["category"] = "coupes",
		["hash"] = "-511601230",
		["shop"] = "pdm",
	},
	["osiris"] = {
		["name"] = "Osiris",
		["brand"] = "Pegassi",
		["model"] = "osiris",
		["price"] = 159000,
		["category"] = "super",
		["hash"] = "1987142870",
		["shop"] = "pdm",
	},
	["panto"] = {
		["name"] = "Panto",
		["brand"] = "Benefactor",
		["model"] = "panto",
		["price"] = 11000,
		["category"] = "compacts",
		["hash"] = "-431692672",
		["shop"] = "pdm",
	},
	["pariah"] = {
		["name"] = "Pariah",
		["brand"] = "Ocelot",
		["model"] = "pariah",
		["price"] = 116000,
		["category"] = "sports",
		["hash"] = "867799010",
		["shop"] = "pdm",
	},
	["patriot"] = {
		["name"] = "Patriot",
		["brand"] = "Mammoth",
		["model"] = "patriot",
		["price"] = 59000,
		["category"] = "suvs",
		["hash"] = "-808457413",
		["shop"] = "pdm",
	},
	["pcj"] = {
		["name"] = "PCJ-600",
		["brand"] = "Shitzu",
		["model"] = "pcj",
		["price"] = 15500,
		["category"] = "motorcycles",
		["hash"] = "-909201658",
		["shop"] = "pdm",
	},
	["penetrator"] = {
		["name"] = "Penetrator",
		["brand"] = "Ocelot",
		["model"] = "penetrator",
		["price"] = 450000,
		["category"] = "super",
		["hash"] = "-1758137366",
		["shop"] = "pdm",
	},
	["pfister811"] = {
		["name"] = "811",
		["brand"] = "Pfister",
		["model"] = "pfister811",
		["price"] = 216000,
		["category"] = "super",
		["hash"] = "-1829802492",
		["shop"] = "pdm",
	},
	["phoenix"] = {
		["name"] = "Phoenix",
		["brand"] = "Imponte",
		["model"] = "phoenix",
		["price"] = 27800,
		["category"] = "muscle",
		["hash"] = "-2095439403",
		["shop"] = "pdm",
	},
	["picador"] = {
		["name"] = "Picador",
		["brand"] = "Cheval",
		["model"] = "picador",
		["price"] = 11700,
		["category"] = "muscle",
		["hash"] = "1507916787",
		["shop"] = "pdm",
	},
	["pigalle"] = {
		["name"] = "Pigalle",
		["brand"] = "Lampadati",
		["model"] = "pigalle",
		["price"] = 20800,
		["category"] = "sportsclassics",
		["hash"] = "1078682497",
		["shop"] = "pdm",
	},
	["prairie"] = {
		["name"] = "Prairie",
		["brand"] = "Bollokan",
		["model"] = "prairie",
		["price"] = 13000,
		["category"] = "compacts",
		["hash"] = "-1450650718",
		["shop"] = "pdm",
	},
	["premier"] = {
		["name"] = "Premier",
		["brand"] = "Declasse",
		["model"] = "premier",
		["price"] = 13000,
		["category"] = "sedans",
		["hash"] = "-1883869285",
		["shop"] = "pdm",
	},
	["primo2"] = {
		["name"] = "Primo Custom",
		["brand"] = "Albany",
		["model"] = "primo2",
		["price"] = 18800,
		["category"] = "sedans",
		["hash"] = "-2040426790",
		["shop"] = "pdm",
	},
	["prototipo"] = {
		["name"] = "X80 Proto",
		["brand"] = "Grotti",
		["model"] = "prototipo",
		["price"] = 547000,
		["category"] = "super",
		["hash"] = "2123327359",
		["shop"] = "pdm",
	},
	["radi"] = {
		["name"] = "Radius",
		["brand"] = "Vapid",
		["model"] = "radi",
		["price"] = 29200,
		["category"] = "suvs",
		["hash"] = "-1651067813",
		["shop"] = "pdm",
	},
	["rapidgt"] = {
		["name"] = "Rapid GT",
		["brand"] = "Dewbauchee",
		["model"] = "rapidgt",
		["price"] = 67000,
		["category"] = "sports",
		["hash"] = "-1934452204",
		["shop"] = "pdm",
	},
	["rapidgt2"] = {
		["name"] = "Rapid GT Convertible",
		["brand"] = "Dewbauchee",
		["model"] = "rapidgt2",
		["price"] = 69200,
		["category"] = "sports",
		["hash"] = "1737773231",
		["shop"] = "pdm",
	},
	["rapidgt3"] = {
		["name"] = "Rapid GT",
		["brand"] = "Dewbauchee",
		["model"] = "rapidgt3",
		["price"] = 85800,
		["category"] = "sportsclassics",
		["hash"] = "2049897956",
		["shop"] = "pdm",
	},
	["reaper"] = {
		["name"] = "Reaper",
		["brand"] = "Pegassi",
		["model"] = "reaper",
		["price"] = 186000,
		["category"] = "super",
		["hash"] = "234062309",
		["shop"] = "pdm",
	},
	["rebel2"] = {
		["name"] = 'Rebel', 
		["brand"] = "Annis",
		["model"] = "rebel2",
		["price"] = 14900,
		["category"] = "offroad",
		["hash"] = `rebel2`,
		["shop"] = "pdm",
	},
	["regina"] = {
		["name"] = "Regina",
		["brand"] = "Dundreary",
		["model"] = "regina",
		["price"] = 6500,
		["category"] = "sedans",
		["hash"] = "-14495224",
		["shop"] = "pdm",
	},
	["revolter"] = {
		["name"] = "Revolter",
		["brand"] = "Ubermacht",
		["model"] = "revolter",
		["price"] = 57000,
		["category"] = "sports",
		["hash"] = "-410205223",
		["shop"] = "pdm",
	},
	["rhapsody"] = {
		["name"] = "Rhapsody",
		["brand"] = "Declasse",
		["model"] = "rhapsody",
		["price"] = 12500,
		["category"] = "compacts",
		["hash"] = "841808271",
		["shop"] = "pdm",
	},
	["rocoto"] = {
		["name"] = "Rocoto",
		["brand"] = "Obey",
		["model"] = "rocoto",
		["price"] = 39500,
		["category"] = "suvs",
		["hash"] = "2136773105",
		["shop"] = "pdm",
	},
	["ruffian"] = {
		["name"] = "Ruffian",
		["brand"] = "Pegassi",
		["model"] = "ruffian",
		["price"] = 14300,
		["category"] = "motorcycles",
		["hash"] = "-893578776",
		["shop"] = "pdm",
	},
	["rumpo"] = {
		["name"] = "Rumpo",
		["brand"] = "Bravado",
		["model"] = "rumpo",
		["price"] = 26000,
		["category"] = "vans",
		["hash"] = "1162065741",
		["shop"] = "pdm",
	},
	["ruston"] = {
		["name"] = "Ruston",
		["brand"] = "Hijak",
		["model"] = "ruston",
		["price"] = 135000,
		["category"] = "sports",
		["hash"] = "719660200",
		["shop"] = "pdm",
	},
	["sabregt"] = {
		["name"] = "Sabre Turbo",
		["brand"] = "Declasse",
		["model"] = "sabregt",
		["price"] = 16500,
		["category"] = "muscle",
		["hash"] = "-1685021548",
		["shop"] = "pdm",
	},
	["sabregt2"] = {
		["name"] = "Sabre GT",
		["brand"] = "Declasse",
		["model"] = "sabregt2",
		["price"] = 30000,
		["category"] = "muscle",
		["hash"] = "223258115",
		["shop"] = "pdm",
	},
	["sandking"] = {
		["name"] = 'Sandking', 
		["brand"] = "Annis",
		["price"] = 31000,
		["category"] = "offroad",
		["model"] = "sandking",
		["hash"] = `sandking`,
		["shop"] = "pdm",
	},
	["sc1"] = {
		["name"] = "SC1",
		["brand"] = "Übermacht",
		["model"] = "sc1",
		["price"] = 452000,
		["category"] = "super",
		["hash"] = "1352136073",
		["shop"] = "pdm",
	},
	["schafter2"] = {
		["name"] = "Schafter",
		["brand"] = "Benefactor",
		["model"] = "schafter2",
		["price"] = 21750,
		["category"] = "sedans",
		["hash"] = "-1255452397",
		["shop"] = "pdm",
	},
	["schafter3"] = {
		["name"] = "Schafter V12",
		["brand"] = "Benefactor",
		["model"] = "schafter3",
		["price"] = 48500,
		["category"] = "sports",
		["hash"] = "-1485523546",
		["shop"] = "pdm",
	},
	["seminole"] = {
		["name"] = "Seminole",
		["brand"] = "Canis",
		["model"] = "seminole",
		["price"] = 32900,
		["category"] = "suvs",
		["hash"] = "1221512915",
		["shop"] = "pdm",
	},
	["sentinel"] = {
		["name"] = "Sentinel",
		["brand"] = "Übermacht",
		["model"] = "sentinel",
		["price"] = 17000,
		["category"] = "coupes",
		["hash"] = "1349725314",
		["shop"] = "pdm",
	},
	["sentinel2"] = {
		["name"] = "Sentinel XS",
		["brand"] = " Übermacht",
		["model"] = "sentinel2",
		["price"] = 20000,
		["category"] = "coupes",
		["hash"] = "873639469",
		["shop"] = "pdm",
	},
	["sentinel3"] = {
		["name"] = "Sentinel Classic",
		["brand"] = "Übermacht",
		["model"] = "sentinel3",
		["price"] = 56000,
		["category"] = "coupes",
		["hash"] = `sentinel3`,
		["shop"] = "pdm",
	},
	["seven70"] = {
		["name"] = "Seven-70",
		["brand"] = "Dewbauchee",
		["model"] = "seven70",
		["price"] = 81000,
		["category"] = "sports",
		["hash"] = "-1757836725",
		["shop"] = "pdm",
	},
	["slamvan3"] = {
		["name"] = "Slam Van Custom",
		["brand"] = "Vapid",
		["model"] = "slamvan3",
		["price"] = 25000,
		["category"] = "muscle",
		["hash"] = "1119641113",
		["shop"] = "pdm",
	},
	["sovereign"] = {
		["name"] = "Sovereign",
		["brand"] = "WMC",
		["model"] = "sovereign",
		["price"] = 27000,
		["category"] = "motorcycles",
		["hash"] = "743478836",
		["shop"] = "pdm",
	},
	["specter"] = {
		["name"] = "Specter",
		["brand"] = "Dewbauchee",
		["model"] = "specter",
		["price"] = 135000,
		["category"] = "sports",
		["hash"] = "1886268224",
		["shop"] = "pdm",
	},
	["stafford"] = {
		["name"] = "Stafford",
		["brand"] = "Enus",
		["model"] = "stafford",
		["price"] = 28500,
		["category"] = "sedans",
		["hash"] = `stafford`,
		["shop"] = "pdm",
	},
	["stalion"] = {
		["name"] = "Stallion",
		["brand"] = "Declasse",
		["model"] = "stalion",
		["price"] = 23500,
		["category"] = "muscle",
		["hash"] = "1923400478",
		["shop"] = "pdm",
	},
	["stingergt"] = {
		["name"] = "Stinger GT",
		["brand"] = "Grotti",
		["model"] = "stingergt",
		["price"] = 32200,
		["category"] = "sportsclassics",
		["hash"] = "-2098947590",
		["shop"] = "pdm",
	},
	["streiter"] = {
		["name"] = "Streiter",
		["brand"] = "Benefactor",
		["model"] = "streiter",
		["price"] = 98000,
		["category"] = "sports",
		["hash"] = "1741861769",
		["shop"] = "pdm",
	},
	["sultan"] = {
		["name"] = "Sultan",
		["brand"] = "Karin",
		["model"] = "sultan",
		["price"] = 63000,
		["category"] = "sports",
		["hash"] = "970598228",
		["shop"] = "pdm",
	},
	["sultanrs"] = {
		["name"] = "Sultan RS",
		["brand"] = "Karin",
		["model"] = "sultanrs",
		["price"] = 77000,
		["category"] = "sports",
		["hash"] = "-295689028",
		["shop"] = "pdm",
	},
	["superd"] = {
		["name"] = "Super Diamond",
		["brand"] = "Enus",
		["model"] = "superd",
		["price"] = 30400,
		["category"] = "sedans",
		["hash"] = "1123216662",
		["shop"] = "pdm",
	},
	["surano"] = {
		["name"] = "Surano",
		["brand"] = " Benefactor",
		["model"] = "surano",
		["price"] = 47000,
		["category"] = "sports",
		["hash"] = "384071873",
		["shop"] = "pdm",
	},
	["surge"] = {
		["name"] = "Surge",
		["brand"] = "Cheval",
		["model"] = "surge",
		["price"] = 28500,
		["category"] = "sedans",
		["hash"] = "-1894894188",
		["shop"] = "pdm",
	},
	["t20"] = {
		["name"] = "T20",
		["brand"] = "Progen",
		["model"] = "t20",
		["price"] = 231000,
		["category"] = "super",
		["hash"] = "1663218586",
		["shop"] = "pdm",
	},
	["tailgater"] = {
		["name"] = "Tailgater",
		["brand"] = "Obey",
		["model"] = "tailgater",
		["price"] = 13000,
		["category"] = "sedans",
		["hash"] = "-1008861746",
		["shop"] = "pdm",
	},
	["taipan"] = {
		["name"] = "Taipan",
		["brand"] = "Cheval",
		["model"] = "taipan",
		["price"] = 1650000,
		["category"] = "super",
		["hash"] = "-1134706562",
		["shop"] = "pdm",
	},
	["tampa"] = {
		["name"] = "Tampa",
		["brand"] = "Declasse",
		["model"] = "tampa",
		["price"] = 18800,
		["category"] = "muscle",
		["hash"] = "972671128",
		["shop"] = "pdm",
	},
	["tampa2"] = {
		["name"] = "Drift Tampa",
		["brand"] = "Declasse",
		["model"] = "tampa2",
		["price"] = 111000,
		["category"] = "muscle",
		["hash"] = `tampa2`,
		["shop"] = "pdm",
	},
	["tempesta"] = {
		["name"] = "Tempesta",
		["brand"] = "Pegassi",
		["model"] = "tempesta",
		["price"] = 450000,
		["category"] = "super",
		["hash"] = "272929391",
		["shop"] = "pdm",
	},
	["tezeract"] = {
		["name"] = "Tezeract",
		["brand"] = "Pegassi",
		["model"] = "tezeract",
		["price"] = 594000,
		["category"] = "super",
		["hash"] = "1031562256",
		["shop"] = "pdm",
	},
	["thrust"] = {
		["name"] = "Thrust",
		["brand"] = "Dinka",
		["model"] = "thrust",
		["price"] = 17000,
		["category"] = "motorcycles",
		["hash"] = "1836027715",
		["shop"] = "pdm",
	},
	["torero"] = {
		["name"] = "Torero",
		["brand"] = "Pegassi",
		["model"] = "torero",
		["price"] = 285500,
		["category"] = "sportsclassics",
		["hash"] = "1504306544",
		["shop"] = "pdm",
	},
	["trophytruck"] = {
		["name"] = 'Trophy Truck', 
		["brand"] = "Annis",
		["price"] = 45800,
		["category"] = "offroad",
		["model"] = "trophytruck",
		["hash"] = `trophytruck`,
		["shop"] = "pdm",
	},
	["trophytruck2"] = {
		["name"] = 'Trophy Truck Limited',
		["brand"] = "Annis",
		["price"] = 48000,
		["category"] = "offroad",
		["model"] = "trophytruck2",
		["hash"] = `trophytruck2`,
		["shop"] = "pdm",
	},
	["turismor"] = {
		["name"] = "Turismo R",
		["brand"] = "Grotti",
		["model"] = "turismor",
		["price"] = 241000,
		["category"] = "super",
		["hash"] = "408192225",
		["shop"] = "pdm",
	},
	["tyrant"] = {
		["name"] = "Tyrant",
		["brand"] = " Överflöd",
		["model"] = "tyrant",
		["price"] = 368000,
		["category"] = "super",
		["hash"] = "-376434238",
		["shop"] = "pdm",
	},
	["vacca"] = {
		["name"] = "Vacca",
		["brand"] = "Pegassi",
		["model"] = "vacca",
		["price"] = 149500,
		["category"] = "super",
		["hash"] = "338562499",
		["shop"] = "pdm",
	},
	["vagner"] = {
		["name"] = "Vagner",
		["brand"] = "Dewbauchee",
		["model"] = "vagner",
		["price"] = 391000,
		["category"] = "super",
		["hash"] = "1939284556",
		["shop"] = "pdm",
	},
	["verlierer2"] = {
		["name"] = "Verlierer",
		["brand"] = "Bravado",
		["model"] = "verlierer2",
		["price"] = 90500,
		["category"] = "sports",
		["hash"] = "1102544804",
		["shop"] = "pdm",
	},
	["vigero"] = {
		["name"] = "Vigero",
		["brand"] = "Declasse",
		["model"] = "vigero",
		["price"] = 14100,
		["category"] = "muscle",
		["hash"] = "-825837129",
		["shop"] = "pdm",
	},
	["virgo"] = {
		["name"] = "Virgo",
		["brand"] = "Albany",
		["model"] = "virgo",
		["price"] = 11400,
		["category"] = "muscle",
		["hash"] = "-498054846",
		["shop"] = "pdm",
	},
	["visione"] = {
		["name"] = "Visione",
		["brand"] = "Grotti",
		["model"] = "visione",
		["price"] = 291000,
		["category"] = "sports",
		["hash"] = "-998177792",
		["shop"] = "pdm",
	},
	["voltic"] = {
		["name"] = "Voltic",
		["brand"] = "Coil",
		["model"] = "voltic",
		["price"] = 120000,
		["category"] = "super",
		["hash"] = "-1622444098",
		["shop"] = "pdm",
	},
	["voodoo"] = {
		["name"] = "Voodoo",
		["brand"] = "Declasse",
		["model"] = "voodoo",
		["price"] = 15500,
		["category"] = "muscle",
		["hash"] = "523724515",
		["shop"] = "pdm",
	},
	["washington"] = {
		["name"] = "Washington",
		["brand"] = "Albany",
		["model"] = "washington",
		["price"] = 16000,
		["category"] = "sedans",
		["hash"] = "1777363799",
		["shop"] = "pdm",
	},
	["windsor"] = {
		["name"] = "Windsor",
		["brand"] = "Enus",
		["model"] = "windsor",
		["price"] = 28000,
		["category"] = "coupes",
		["hash"] = "1581459400",
		["shop"] = "pdm",
	},
	["windsor2"] = {
		["name"] = "Windsor Drop",
		["brand"] = "Enus",
		["model"] = "windsor2",
		["price"] = 33500,
		["category"] = "coupes",
		["hash"] = "-1930048799",
		["shop"] = "pdm",
	},
	["xa21"] = {
		["name"] = "XA-21",
		["brand"] = "Ocelot",
		["model"] = "xa21",
		["price"] = 174000,
		["category"] = "super",
		["hash"] = "917809321",
		["shop"] = "pdm",
	},
	["xls"] = {
		["name"] = "XLS",
		["brand"] = "Benefactor",
		["model"] = "xls",
		["price"] = 37000,
		["category"] = "suvs",
		["hash"] = "1203490606",
		["shop"] = "pdm",
	},
	["yosemite"] = {
		["name"] = "Yosemite",
		["brand"] = "Declasse",
		["model"] = "yosemite",
		["price"] = 25000,
		["category"] = "muscle",
		["hash"] = "1871995513",
		["shop"] = "pdm",
	},
	["z190"] = {
		["name"] = "190Z",
		["brand"] = "Karin",
		["model"] = "z190",
		["price"] = 43500,
		["category"] = "sportsclassics",
		["hash"] = "838982985",
		["shop"] = "pdm",
	},
	["zentorno"] = {
		["name"] = "Zentorno",
		["brand"] = "Pegassi",
		["model"] = "zentorno",
		["price"] = 215000,
		["category"] = "super",
		["hash"] = "-1403128555",
		["shop"] = "pdm",
	},
	["zion"] = {
		["name"] = "Zion",
		["brand"] = "Übermacht",
		["model"] = "zion",
		["price"] = 20500,
		["category"] = "coupes",
		["hash"] = "-1122289213",
		["shop"] = "pdm",
	},
	["zion2"] = {
		["name"] = "Zion Cabrio",
		["brand"] = "Übermacht",
		["model"] = "zion2",
		["price"] = 21500,
		["category"] = "coupes",
		["hash"] = "-1193103848",
		["shop"] = "pdm",
	},
	["zombieb"] = {
		["name"] = "Zombie Chopper",
		["brand"] = "Western",
		["model"] = "zombieb",
		["price"] = 24000,
		["category"] = "motorcycles",
		["hash"] = `zombieb`,
		["shop"] = "pdm",
	},
	["ztype"] = {
		["name"] = "Z-Type",
		["brand"] = "Truffade",
		["model"] = "ztype",
		["price"] = 109900,
		["category"] = "sportsclassics",
		["hash"] = "758895617",
		["shop"] = "pdm",
	},
----------MUST BE ENABLED FOR THE BELOW VEHICLES-------------+set sv_enforceGameBuild 2189-------------------------------
----------MUST BE ENABLED FOR THE BELOW VEHICLES-------------+set sv_enforceGameBuild 2189-------------------------------
----------MUST BE ENABLED FOR THE BELOW VEHICLES-------------+set sv_enforceGameBuild 2189-------------------------------
----------MUST BE ENABLED FOR THE BELOW VEHICLES-------------+set sv_enforceGameBuild 2189-------------------------------
----------MUST BE ENABLED FOR THE BELOW VEHICLES-------------+set sv_enforceGameBuild 2189-------------------------------
----------MUST BE ENABLED FOR THE BELOW VEHICLES-------------+set sv_enforceGameBuild 2189-------------------------------
----------MUST BE ENABLED FOR THE BELOW VEHICLES-------------+set sv_enforceGameBuild 2189-------------------------------
----------MUST BE ENABLED FOR THE BELOW VEHICLES-------------+set sv_enforceGameBuild 2189-------------------------------
	["akuma"] = {
		["name"] = "Akuma",
		["brand"] = "Dinka",
		["model"] = "akuma",
		["price"] = 67000,
		["category"] = "motorcycles",
		["hash"] = `akuma`,
		["shop"] = "pdm",
	},
	["asbo"] = {
		["name"] = "Asbo",
		["brand"] = "Maxwell",
		["model"] = "asbo",
		["price"] = 9500,
		["category"] = "compacts",
		["hash"] = `asbo`,
		["shop"] = "pdm",
	},
	["asterope"] = {
		["name"] = "Asterope",
		["brand"] = "Karin",
		["model"] = "asterope",
		["price"] = 12800,
		["category"] = "sedans",
		["hash"] = `asterope`,
		["shop"] = "pdm",
	},
	["baller"] = {
		["name"] = "Baller",
		["brand"] = "Gallivanter",
		["model"] = "baller",
		["price"] = 42000,
		["category"] = "suvs",
		["hash"] = `baller`,
		["shop"] = "pdm",
	},
	["baller4"] = {
		["name"] = "Baller LE LWB",
		["brand"] = "Gallivanter",
		["model"] = "baller4",
		["price"] = 50900,
		["category"] = "suvs",
		["hash"] = `baller4`,
		["shop"] = "pdm",
	},
	["bati2"] = {
		["name"] = "Bati 801RR",
		["brand"] = "Pegassi",
		["model"] = "bati2",
		["price"] = 33200,
		["category"] = "motorcycles",
		["hash"] = `bati2`,
		["shop"] = "pdm",
	},
	["bf400"] = {
		["name"] = "BF400",
		["brand"] = "Nagasaki",
		["model"] = "bf400",
		["price"] = 47500,
		["category"] = "motorcycles",
		["hash"] = `bf400`,
		["shop"] = "pdm",
	},
	-- ["blazer2"] = {
	-- 	["name"] = "Blazer Lifeguard",
	-- 	["brand"] = "Nagasaki",
	-- 	["model"] = "blazer2",
	-- 	["price"] = 9200,
	-- 	["category"] = "offroad",
	-- 	["hash"] = `blazer2`,
	-- 	["shop"] = "pdm",
	-- },
	["blazer3"] = {
		["name"] = "Blazer Hot Rod",
		["brand"] = "Nagasaki",
		["model"] = "blazer3",
		["price"] = 9800,
		["category"] = "offroad",
		["hash"] = `blazer3`,
		["shop"] = "pdm",
	},
	-- ["blazer5"] = {
	-- 	["name"] = "Blazer Aqua",
	-- 	["brand"] = "Nagasaki",
	-- 	["model"] = "blazer5",
	-- 	["price"] = 12000,
	-- 	["category"] = "offroad",
	-- 	["hash"] = `blazer5`,
	-- 	["shop"] = "pdm",
	-- },
	["blista3"] = {
		["name"] = "Blista Go Go Monkey",
		["brand"] = "Dinka",
		["model"] = "blista3",
		["price"] = 12000,
		["category"] = "compacts",
		["hash"] = `blista3`,
		["shop"] = "pdm",
	},
	["bmx"] = {
		["name"] = "BMX",
		["model"] = "bmx",
		["price"] = 550,
		["category"] = "cycles",
		["hash"] = `bmx`,
		["shop"] = "pdm",
	},
	["brioso2"] = {
		["name"] = "Brioso 300",
		["brand"] = "Grotti",
		["model"] = "brioso2",
		["price"] = 16000,
		["category"] = "compacts",
		["hash"] = `brioso2`,
		["shop"] = "pdm",
	},
	-- ["caracara"] = {
	-- 	["name"] = "Caracara",
	-- 	["brand"] = "Vapid",
	-- 	["model"] = "caracara",
	-- 	["price"] = 55000,
	-- 	["category"] = "offroad",
	-- 	["hash"] = `caracara`,
	-- 	["shop"] = "pdm",
	-- },
	["caracara2"] = {
		["name"] = "Caracara 4x4",
		["brand"] = "Vapid",
		["model"] = "caracara2",
		["price"] = 500000,
		["category"] = "offroad",
		["hash"] = `caracara2`,
		["shop"] = "pdm",
	},
	["cavalcade"] = {
		["name"] = "Cavalcade",
		["brand"] = "Albany",
		["model"] = "cavalcade",
		["price"] = 33800,
		["category"] = "suvs",
		["hash"] = `cavalcade`,
		["shop"] = "pdm",
	},
	["cheburek"] = {
		["name"] = "Cheburek",
		["brand"] = "Rune",
		["model"] = "cheburek",
		["price"] = 26600,
		["category"] = "sportsclassic",
		["hash"] = `cheburek`,
		["shop"] = "pdm",
	},
	["cliffhanger"] = {
		["name"] = "Cliffhanger",
		["brand"] = "Western",
		["model"] = "cliffhanger",
		["price"] = 24200,
		["category"] = "motorcycles",
		["hash"] = `cliffhanger`,
		["shop"] = "pdm",
	},
	["clique"] = {
		["name"] = "Clique",
		["brand"] = "Vapid",
		["model"] = "clique",
		["price"] = 20000,
		["category"] = "muscle",
		["hash"] = `clique`,
		["shop"] = "pdm",
	},
	["club"] = {
		["name"] = "Club",
		["brand"] = "BF",
		["model"] = "club",
		["price"] = 14000,
		["category"] = "compacts",
		["hash"] = `club`,
		["shop"] = "pdm",
	},
	["cog55"] = {
		["name"] = "Cognoscenti 55",
		["brand"] = "Enus",
		["model"] = "cog55",
		["price"] = 25600,
		["category"] = "sedans",
		["hash"] = `cog55`,
		["shop"] = "pdm",
	},
	["comet4"] = {
		["name"] = "Comet Safari",
		["brand"] = "Pfister",
		["model"] = "comet4",
		["price"] = 54000,
		["category"] = "sports",
		["hash"] = `comet4`,
		["shop"] = "pdm",
	},
	["contender"] = {
		["name"] = "Contender",
		["brand"] = "Vapid",
		["model"] = "contender",
		["price"] = 67000,
		["category"] = "suvs",
		["hash"] = `contender`,
		["shop"] = "pdm",
	},
	["coquette4"] = {
		["name"] = "Coquette D10",
		["brand"] = "Invetero",
		["model"] = "coquette4",
		["price"] = 45000,
		["category"] = "sports",
		["hash"] = `coquette4`,
		["shop"] = "pdm",
	},
	["cruiser"] = {
		["name"] = "Cruiser",
		["model"] = "cruiser",
		["price"] = 500,
		["category"] = "cycles",
		["hash"] = `cruiser`,
		["shop"] = "pdm",
	},
	["daemon2"] = {
		["name"] = "Daemon Custom",
		["brand"] = "Western",
		["model"] = "daemon2",
		["price"] = 16200,
		["category"] = "motorcycles",
		["hash"] = `daemon2`,
		["shop"] = "pdm",
	},
	["deluxo"] = {
		["name"] = "Deluxo",
		["brand"] = "Imponte",
		["model"] = "deluxo",
		["price"] = 4721500,
		["category"] = "sportsclassic",
		["hash"] = `deluxo`,
		["shop"] = "pdm",
	},
	["deveste"] = {
		["name"] = "Deveste",
		["brand"] = "Principe",
		["model"] = "deveste",
		["price"] = 303000,
		["category"] = "super",
		["hash"] = `deveste`,
		["shop"] = "pdm",
	},
	["deviant"] = {
		["name"] = "Deviant",
		["brand"] = "Schyster",
		["model"] = "deviant",
		["price"] = 60000,
		["category"] = "muscle",
		["hash"] = `deviant`,
		["shop"] = "pdm",
	},
	["diablous"] = {
		["name"] = "Diablous",
		["brand"] = "Principe",
		["model"] = "diablous",
		["price"] = 35000,
		["category"] = "motorcycles",
		["hash"] = `diablous`,
		["shop"] = "pdm",
	},
	["diablous2"] = {
		["name"] = "Diablous Custom",
		["brand"] = "Principe",
		["model"] = "diablous2",
		["price"] = 35000,
		["category"] = "motorcycles",
		["hash"] = `diablous2`,
		["shop"] = "pdm",
	},
	-- ["dilettante2"] = {
	-- 	["name"] = "Dilettante Patrol",
	-- 	["brand"] = "Karin",
	-- 	["model"] = "dilettante2",
	-- 	["price"] = 15000,
	-- 	["category"] = "compacts",
	-- 	["hash"] = `dilettante2`,
	-- 	["shop"] = "pdm",
	-- },
	["dominator2"] = {
		["name"] = "Pißwasser Dominator",
		["brand"] = "Vapid",
		["model"] = "dominator2",
		["price"] = 40000,
		["category"] = "muscle",
		["hash"] = `dominator2`,
		["shop"] = "pdm",
	},
	["dominator3"] = {
		["name"] = "Dominator GTX",
		["brand"] = "Vapid",
		["model"] = "dominator3",
		["price"] = 37800,
		["category"] = "muscle",
		["hash"] = `dominator3`,
		["shop"] = "pdm",
	},
	-- ["dominator4"] = {
	-- 	["name"] = "Dominator Arena",
	-- 	["brand"] = "Vapid",
	-- 	["model"] = "dominator4",
	-- 	["price"] = 80000,
	-- 	["category"] = "muscle",
	-- 	["hash"] = `dominator4`,
	-- 	["shop"] = "pdm",
	-- },
	["double"] = {
		["name"] = "Double-T",
		["brand"] = "Dinka",
		["model"] = "double",
		["price"] = 54200,
		["category"] = "motorcycles",
		["hash"] = `double`,
		["shop"] = "pdm",
	},
	["drafter"] = {
		["name"] = "8F Drafter",
		["brand"] = "Obey",
		["model"] = "drafter",
		["price"] = 55000,
		["category"] = "sports",
		["hash"] = `drafter`,
		["shop"] = "pdm",
	},
	["dubsta"] = {
		["name"] = "Dubsta",
		["brand"] = "Benefactor",
		["model"] = "dubsta",
		["price"] = 46000,
		["category"] = "suvs",
		["hash"] = `dubsta`,
		["shop"] = "pdm",
	},
	-- ["dukes2"] = {
	-- 	["name"] = "Dukes Nightrider",
	-- 	["brand"] = "Imponte",
	-- 	["model"] = "dukes2",
	-- 	["price"] = 13600,
	-- 	["category"] = "muscle",
	-- 	["hash"] = `dukes2`,
	-- 	["shop"] = "pdm",
	-- },
	["dukes3"] = {
		["name"] = "Beater Dukes",
		["brand"] = "Imponte",
		["model"] = "dukes3",
		["price"] = 13600,
		["category"] = "muscle",
		["hash"] = `dukes3`,
		["shop"] = "pdm",
	},
	["dynasty"] = {
		["name"] = "Dynasty",
		["brand"] = "Weeny",
		["model"] = "dynasty",
		["price"] = 18000,
		["category"] = "sportsclassic",
		["hash"] = `dynasty`,
		["shop"] = "pdm",
	},
	["emerus"] = {
		["name"] = "Emerus",
		["brand"] = "Progen",
		["model"] = "emerus",
		["price"] = 281000,
		["category"] = "super",
		["hash"] = `emerus`,
		["shop"] = "pdm",
	},
	["enduro"] = {
		["name"] = "Enduro",
		["brand"] = "Dinka",
		["model"] = "enduro",
		["price"] = 9500,
		["category"] = "motorcycles",
		["hash"] = `enduro`,
		["shop"] = "pdm",
	},
	["everon"] = {
		["name"] = "Everon",
		["brand"] = "Karin",
		["model"] = "everon",
		["price"] = 48000,
		["category"] = "offroad",
		["hash"] = `everon`,
		["shop"] = "pdm",
	},
	["faction3"] = {
		["name"] = "Faction Custom Donk",
		["brand"] = "Willard",
		["model"] = "faction3",
		["price"] = 40000,
		["category"] = "muscle",
		["hash"] = `faction3`,
		["shop"] = "pdm",
	},
	["faggio2"] = {
		["name"] = "Faggio",
		["brand"] = "Pegassi",
		["model"] = "faggio2",
		["price"] = 3900,
		["category"] = "motorcycles",
		["hash"] = `faggio2`,
		["shop"] = "pdm",
	},
	["fcr"] = {
		["name"] = "FCR 1000",
		["brand"] = "Pegassi",
		["model"] = "fcr",
		["price"] = 12000,
		["category"] = "motorcycles",
		["hash"] = `fcr`,
		["shop"] = "pdm",
	},
	["fcr2"] = {
		["name"] = "FCR 1000 Custom",
		["brand"] = "Pegassi",
		["model"] = "fcr2",
		["price"] = 16000,
		["category"] = "motorcycles",
		["hash"] = `fcr2`,
		["shop"] = "pdm",
	},
	["fixter"] = {
		["name"] = "Fixter",
		["model"] = "fixter",
		["price"] = 650,
		["category"] = "cycles",
		["hash"] = `fixter`,
		["shop"] = "pdm",
	},
	["freecrawler"] = {
		["name"] = "Freecrawler",
		["brand"] = "Canis",
		["model"] = "freecrawler",
		["price"] = 25000,
		["category"] = "offroad",
		["hash"] = `freecrawler`,
		["shop"] = "pdm",
	},
	["furia"] = {
		["name"] = "Furia",
		["brand"] = "Grotti",
		["model"] = "furia",
		["price"] = 291000,
		["category"] = "super",
		["hash"] = `furia`,
		["shop"] = "pdm",
	},
	["gargoyle"] = {
		["name"] = "Gargoyle",
		["brand"] = "Western",
		["model"] = "gargoyle",
		["price"] = 44000,
		["category"] = "motorcycles",
		["hash"] = `gargoyle`,
		["shop"] = "pdm",
	},
	["gauntlet2"] = {
		["name"] = "Redwood Gauntlet",
		["brand"] = "Bravado",
		["model"] = "gauntlet",
		["price"] = 35000,
		["category"] = "muscle",
		["hash"] = "-1800170043",
		["shop"] = "pdm",
	},
	["gauntlet3"] = {
		["name"] = "Classic Gauntlet",
		["brand"] = "Bravado",
		["model"] = "gauntlet",
		["price"] = 29000,
		["category"] = "muscle",
		["hash"] = "-1800170043",
		["shop"] = "pdm",
	},
	["gauntlet4"] = {
		["name"] = "Gauntlet Hellfire",
		["brand"] = "Bravado",
		["model"] = "gauntlet",
		["price"] = 50000,
		["category"] = "muscle",
		["hash"] = "-1800170043",
		["shop"] = "pdm",
	},
	["gauntlet5"] = {
		["name"] = "Gauntlet Classic Custom",
		["brand"] = "Bravado",
		["model"] = "gauntlet5",
		["price"] = 16500,
		["category"] = "muscle",
		["hash"] = `gauntlet5`,
		["shop"] = "pdm",
	},
	["gb200"] = {
		["name"] = "GB 200",
		["brand"] = "Vapid",
		["model"] = "gb200",
		["price"] = 50000,
		["category"] = "sports",
		["hash"] = `gb200`,
		["shop"] = "pdm",
	},
	["glendale2"] = {
		["name"] = "Glendale",
		["brand"] = "Benefactor",
		["model"] = "glendale2",
		["price"] = 11500,
		["category"] = "sedans",
		["hash"] = `glendale2`,
		["shop"] = "pdm",
	},
	["habanero"] = {
		["name"] = "Habanero",
		["brand"] = "Emperor",
		["model"] = "habanero",
		["price"] = 50000,
		["category"] = "suvs",
		["hash"] = `habanero`,
		["shop"] = "pdm",
	},
	["hakuchou2"] = {
		["name"] = "Hakuchou Drag",
		["brand"] = "Shitzu",
		["model"] = "hakuchou2",
		["price"] = 60500,
		["category"] = "motorcycles",
		["hash"] = `hakuchou2`,
		["shop"] = "pdm",
	},
	["hellion"] = {
		["name"] = "Hellion",
		["brand"] = "Annis",
		["model"] = "hellion",
		["price"] = 23000,
		["category"] = "offroad",
		["hash"] = `hellion`,
		["shop"] = "pdm",
	},
	["hermes"] = {
		["name"] = "Hermes",
		["brand"] = "Albany",
		["model"] = "hermes",
		["price"] = 31500,
		["category"] = "muscle",
		["hash"] = `hermes`,
		["shop"] = "pdm",
	},
	["imorgon"] = {
		["name"] = "Imorgon",
		["brand"] = "Overflod",
		["model"] = "imorgon",
		["price"] = 76000,
		["category"] = "sports",
		["hash"] = `imorgon`,
		["shop"] = "pdm",
	},
	["ingot"] = {
		["name"] = "Ingot",
		["brand"] = "Vulcar",
		["model"] = "ingot",
		["price"] = 4999,
		["category"] = "sedans",
		["hash"] = `ingot`,
		["shop"] = "pdm",
	},
	["innovation"] = {
		["name"] = "Innovation",
		["brand"] = "LLC",
		["model"] = "innovation",
		["price"] = 15200,
		["category"] = "motorcycles",
		["hash"] = `innovation`,
		["shop"] = "pdm",
	},
	-- ["issi4"] = {
	-- 	["name"] = "Issi Arena",
	-- 	["brand"] = "Weeny",
	-- 	["model"] = "issi4",
	-- 	["price"] = 50000,
	-- 	["category"] = "compacts",
	-- 	["hash"] = `issi4`,
	-- 	["shop"] = "pdm",
	-- },
	["issi7"] = {
		["name"] = "Issi Sport",
		["brand"] = "Weeny",
		["model"] = "issi7",
		["price"] = 122000,
		["category"] = "compacts",
		["hash"] = `issi7`,
		["shop"] = "pdm",
	},
	["italigtb2"] = {
		["name"] = "Itali GTB",
		["brand"] = "Progen",
		["model"] = "italigtb2",
		["price"] = 271000,
		["category"] = "super",
		["hash"] = `italigtb2`,
		["shop"] = "pdm",
	},
	["italigto"] = {
		["name"] = "Itali GTO",
		["brand"] = "Progen",
		["model"] = "italigto",
		["price"] = 33200,
		["category"] = "sports",
		["hash"] = `italigto`,
		["shop"] = "pdm",
	},
	["italirsx"] = {
		["name"] = "Itali RSX",
		["brand"] = "Progen",
		["model"] = "italirsx",
		["price"] = 50000,
		["category"] = "sports",
		["hash"] = `italirsx`,
		["shop"] = "pdm",
	},
	["jb700"] = {
		["name"] = "JB 700",
		["brand"] = "Dewbauchee",
		["model"] = "jb700",
		["price"] = 400000,
		["category"] = "sportsclassic",
		["hash"] = `jb700`,
		["shop"] = "pdm",
	},
	["jb7002"] = {
		["name"] = "JB 700W",
		["brand"] = "Dewbauchee",
		["model"] = "jb7002",
		["price"] = 33000,
		["category"] = "sportsclassic",
		["hash"] = `jb7002`,
		["shop"] = "pdm",
	},
	["jester2"] = {
		["name"] = "Jester Racecar",
		["brand"] = "Dinka",
		["model"] = "jester2",
		["price"] = 84000,
		["category"] = "sports",
		["hash"] = `jester2`,
		["shop"] = "pdm",
	},
	["journey"] = {
		["name"] = "Journey",
		["brand"] = "Zirconium",
		["model"] = "journey",
		["price"] = 27500,
		["category"] = "vans",
		["hash"] = `journey`,
		["shop"] = "pdm",
	},
	["jugular"] = {
		["name"] = "Jugular",
		["brand"] = "Ocelot",
		["model"] = "jugular",
		["price"] = 43000,
		["category"] = "sports",
		["hash"] = `jugular`,
		["shop"] = "pdm",
	},
	["kalahari"] = {
		["name"] = "Kalahari",
		["brand"] = "Canis",
		["model"] = "kalahari",
		["price"] = 20000,
		["category"] = "offroad",
		["hash"] = `kalahari`,
		["shop"] = "pdm",
	},
	["kamacho"] = {
		["name"] = "Kamacho",
		["brand"] = "Canis",
		["model"] = "kamacho",
		["price"] = 188000,
		["category"] = "offroad",
		["hash"] = `kamacho`,
		["shop"] = "pdm",
	},
	["kanjo"] = {
		["name"] = "Blista Kanjo",
		["brand"] = "Dinka",
		["model"] = "kanjo",
		["price"] = 21000,
		["category"] = "compacts",
		["hash"] = `kanjo`,
		["shop"] = "pdm",
	},
	["komoda"] = {
		["name"] = "Komoda",
		["brand"] = "Lampadati",
		["model"] = "komoda",
		["price"] = 68000,
		["category"] = "sports",
		["hash"] = `komoda`,
		["shop"] = "pdm",
	},
	["krieger"] = {
		["name"] = "Krieger",
		["brand"] = "Benefactor",
		["model"] = "krieger",
		["price"] = 40000,
		["category"] = "super",
		["hash"] = `krieger`,
		["shop"] = "pdm",
	},
	["landstalker2"] = {
		["name"] = "Landstalker XL",
		["brand"] = "Dundreary",
		["model"] = "landstalker2",
		["price"] = 49000,
		["category"] = "suvs",
		["hash"] = `landstalker2`,
		["shop"] = "pdm",
	},
	["le7b"] = {
		["name"] = "RE-7B",
		["brand"] = "Annis",
		["model"] = "le7b",
		["price"] = 267000,
		["category"] = "super",
		["hash"] = `le7b`,
		["shop"] = "pdm",
	},
	["lectro"] = {
		["name"] = "Lectro",
		["brand"] = "Principe",
		["model"] = "lectro",
		["price"] = 10000,
		["category"] = "motorcycles",
		["hash"] = `lectro`,
		["shop"] = "pdm",
	},
	["locust"] = {
		["name"] = "Locust",
		["brand"] = "Ocelot",
		["model"] = "locust",
		["price"] = 50000,
		["category"] = "sports",
		["hash"] = `locust`,
		["shop"] = "pdm",
	},
	["lurcher"] = {
		["name"] = "Gauntlet Classic Custom",
		["brand"] = "Bravado",
		["model"] = "lurcher",
		["price"] = 29000,
		["category"] = "muscle",
		["hash"] = `lurcher`,
		["shop"] = "pdm",
	},
	["manana"] = {
		["name"] = "Manana",
		["brand"] = "Albany",
		["model"] = "manana",
		["price"] = 29000,
		["category"] = "muscle",
		["hash"] = `manana`,
		["shop"] = "pdm",
	},
	["manana2"] = {
		["name"] = "Manana Custom",
		["brand"] = "Albany",
		["model"] = "manana2",
		["price"] = 29000,
		["category"] = "muscle",
		["hash"] = `manana2`,
		["shop"] = "pdm",
	},
	["manchez"] = {
		["name"] = "Manchez",
		["brand"] = "Maibatsu",
		["model"] = "manchez",
		["price"] = 12500,
		["category"] = "motorcycles",
		["hash"] = `manchez`,
		["shop"] = "pdm",
	},
	["manchez2"] = {
		["name"] = "Manchez",
		["brand"] = "Maibatsu",
		["model"] = "manchez2",
		["price"] = 12500,
		["category"] = "motorcycles",
		["hash"] = `manchez2`,
		["shop"] = "pdm",
	},
	["massacro2"] = {
		["name"] = "Massacro Racecar",
		["brand"] = "Dewbauchee",
		["model"] = "massacro2",
		["price"] = 235000,
		["category"] = "sports",
		["hash"] = `massacro2`,
		["shop"] = "pdm",
	},
	["mesa"] = {
		["name"] = "Mesa",
		["brand"] = "Canis",
		["model"] = "mesa",
		["price"] = 37000,
		["category"] = "offroad",
		["hash"] = `mesa`,
		["shop"] = "pdm",
	},
	["mesa3"] = {
		["name"] = "Mesa Merryweather",
		["brand"] = "Canis",
		["model"] = "mesa3",
		["price"] = 57000,
		["category"] = "offroad",
		["hash"] = `mesa3`,
		["shop"] = "pdm",
	},
	["michelli"] = {
		["name"] = "Michelli GT",
		["brand"] = "Lampadati",
		["model"] = "michelli",
		["price"] = 60000,
		["category"] = "sportsclassic",
		["hash"] = `michelli`,
		["shop"] = "pdm",
	},
	["minivan"] = {
		["name"] = "Minivan",
		["brand"] = "Vapid",
		["model"] = "minivan",
		["price"] = 23000,
		["category"] = "vans",
		["hash"] = `minivan`,
		["shop"] = "pdm",
	},
	["minivan2"] = {
		["name"] = "Minivan Custom",
		["brand"] = "Vapid",
		["model"] = "minivan2",
		["price"] = 28000,
		["category"] = "vans",
		["hash"] = `minivan2`,
		["shop"] = "pdm",
	},
	["moonbeam2"] = {
		["name"] = "Moonbeam Custom",
		["brand"] = "Declasse",
		["model"] = "moonbeam2",
		["price"] = 46000,
		["category"] = "vans",
		["hash"] = `moonbeam2`,
		["shop"] = "pdm",
	},
	["nebula"] = {
		["name"] = "Nebula",
		["brand"] = "Vulcar",
		["model"] = "nebula",
		["price"] = 28500,
		["category"] = "sportsclassic",
		["hash"] = `nebula`,
		["shop"] = "pdm",
	},
	["neo"] = {
		["name"] = "Neo",
		["brand"] = "Vysser",
		["model"] = "neo",
		["price"] = 56000,
		["category"] = "sports",
		["hash"] = `neo`,
		["shop"] = "pdm",
	},
	["nero2"] = {
		["name"] = "Nero Custom",
		["brand"] = "Truffade",
		["model"] = "nero2",
		["price"] = 391000,
		["category"] = "super",
		["hash"] = `nero2`,
		["shop"] = "pdm",
	},
	["novak"] = {
		["name"] = "Novak",
		["brand"] = "Lampadati",
		["model"] = "novak",
		["price"] = 121000,
		["category"] = "suvs",
		["hash"] = `novak`,
		["shop"] = "pdm",
	},
	-- ["oppressor"] = {
	-- 	["name"] = "Oppressor",
	-- 	["brand"] = "Pegassi",
	-- 	["model"] = "oppressor",
	-- 	["price"] = 3524500,
	-- 	["category"] = "super",
	-- 	["hash"] = `oppressor`,
	-- 	["shop"] = "pdm",
	-- },
	["outlaw"] = {
		["name"] = "Outlaw",
		["brand"] = "Nagasaki",
		["model"] = "outlaw",
		["price"] = 15000,
		["category"] = "offroad",
		["hash"] = `outlaw`,
		["shop"] = "pdm",
	},
	["paradise"] = {
		["name"] = "Paradise",
		["brand"] = "Bravado",
		["model"] = "paradise",
		["price"] = 19000,
		["category"] = "vans",
		["hash"] = `paradise`,
		["shop"] = "pdm",
	},
	["paragon"] = {
		["name"] = "Paragon",
		["brand"] = "Enus",
		["model"] = "paragon",
		["price"] = 400000,
		["category"] = "sports",
		["hash"] = `paragon`,
		["shop"] = "pdm",
	},
	["penumbra"] = {
		["name"] = "Penumbra",
		["brand"] = "Maibatsu",
		["model"] = "penumbra",
		["price"] = 27000,
		["category"] = "sports",
		["hash"] = `penumbra`,
		["shop"] = "pdm",
	},
	["penumbra2"] = {
		["name"] = "Penumbra FF",
		["brand"] = "Maibatsu",
		["model"] = "penumbra2",
		["price"] = 30000,
		["category"] = "sports",
		["hash"] = `penumbra2`,
		["shop"] = "pdm",
	},
	["peyote"] = {
		["name"] = "Peyote",
		["brand"] = "Vapid",
		["model"] = "peyote",
		["price"] = 30000,
		["category"] = "sportsclassic",
		["hash"] = `peyote`,
		["shop"] = "pdm",
	},
	["peyote2"] = {
		["name"] = "Peyote Gasser",
		["brand"] = "Vapid",
		["model"] = "peyote2",
		["price"] = 50000,
		["category"] = "sportsclassic",
		["hash"] = `peyote2`,
		["shop"] = "pdm",
	},
	["peyote3"] = {
		["name"] = "Peyote Custom",
		["brand"] = "Vapid",
		["model"] = "peyote3",
		["price"] = 34000,
		["category"] = "sportsclassic",
		["hash"] = `peyote3`,
		["shop"] = "pdm",
	},
	["primo"] = {
		["name"] = "Primo",
		["brand"] = "Albany",
		["model"] = "primo",
		["price"] = 4000,
		["category"] = "sedans",
		["hash"] = `primo`,
		["shop"] = "pdm",
	},
	["rancherxl"] = {
		["name"] = "Rancher XL",
		["brand"] = "Declasse",
		["model"] = "rancherxl",
		["price"] = 50000,
		["category"] = "offroad",
		["hash"] = `rancherxl`,
		["shop"] = "pdm",
	},
	["raptor"] = {
		["name"] = "Raptor",
		["brand"] = "BF",
		["model"] = "raptor",
		["price"] = 50000,
		["category"] = "sports",
		["hash"] = `raptor`,
		["shop"] = "pdm",
	},
	["ratbike"] = {
		["name"] = "Rat Bike",
		["brand"] = "Western",
		["model"] = "ratbike",
		["price"] = 9100,
		["category"] = "motorcycles",
		["hash"] = `ratbike`,
		["shop"] = "pdm",
	},
	["rebla"] = {
		["name"] = "Rebla GTS",
		["brand"] = "Übermacht",
		["model"] = "rebla",
		["price"] = 53000,
		["category"] = "suvs",
		["hash"] = `rebla`,
		["shop"] = "pdm",
	},
	["retinue"] = {
		["name"] = "Retinue",
		["brand"] = "Vapid",
		["model"] = "retinue",
		["price"] = 28800,
		["category"] = "sportsclassic",
		["hash"] = `retinue`,
		["shop"] = "pdm",
	},
	["retinue2"] = {
		["name"] = "Retinue MKII",
		["brand"] = "Vapid",
		["model"] = "retinue2",
		["price"] = 41000,
		["category"] = "sportsclassic",
		["hash"] = `retinue2`,
		["shop"] = "pdm",
	},
	["riata"] = {
		["name"] = "Riata",
		["brand"] = "Vapid",
		["model"] = "riata",
		["price"] = 33000,
		["category"] = "offroad",
		["hash"] = `riata`,
		["shop"] = "pdm",
	},
	["ruiner"] = {
		["name"] = "Ruiner",
		["brand"] = "Imponte",
		["model"] = "ruiner",
		["price"] = 5000000,
		["category"] = "muscle",
		["hash"] = `ruiner`,
		["shop"] = "pdm",
	},
	["rumpo3"] = {
		["name"] = "Rumpo Custom",
		["brand"] = "Bravado",
		["model"] = "rumpo3",
		["price"] = 40500,
		["category"] = "vans",
		["hash"] = `rumpo3`,
		["shop"] = "pdm",
	},
	["s80"] = {
		["name"] = "S80RR",
		["brand"] = "Annis",
		["model"] = "s80",
		["price"] = 500000,
		["category"] = "super",
		["hash"] = `s80`,
		["shop"] = "pdm",
	},
	["sadler"] = {
		["name"] = "Sadler",
		["brand"] = "Vapid",
		["model"] = "sadler",
		["price"] = 50000,
		["category"] = "offroad",
		["hash"] = `sadler`,
		["shop"] = "pdm",
	},
	["sanchez"] = {
		["name"] = "Sanchez Livery",
		["brand"] = "Maibatsu",
		["model"] = "sanchez",
		["price"] = 19000,
		["category"] = "motorcycles",
		["hash"] = `sanchez`,
		["shop"] = "pdm",
	},
	["sanchez2"] = {
		["name"] = "Sanchez",
		["brand"] = "Maibatsu",
		["model"] = "sanchez2",
		["price"] = 21000,
		["category"] = "motorcycles",
		["hash"] = `sanchez2`,
		["shop"] = "pdm",
	},
	["sanctus"] = {
		["name"] = "Sanctus",
		["brand"] = "LCC",
		["model"] = "sanctus",
		["price"] = 74500,
		["category"] = "motorcycles",
		["hash"] = `sanctus`,
		["shop"] = "pdm",
	},
	["sandking2"] = {
		["name"] = 'Sandking SWB', 
		["brand"] = "Annis",
		["price"] = 31000,
		["category"] = "offroad",
		["model"] = "sandking2",
		["hash"] = `sandking2`,
		["shop"] = "pdm",
	},
	["savestra"] = {
		["name"] = "Savestra",
		["brand"] = "Annis",
		["model"] = "savestra",
		["price"] = 27900,
		["category"] = "sportsclassic",
		["hash"] = `savestra`,
		["shop"] = "pdm",
	},
	["schafter4"] = {
		["name"] = "Schafter LWB",
		["brand"] = "Benefactor",
		["model"] = "schafter4",
		["price"] = 48500,
		["category"] = "sports",
		["hash"] = `schafter4`,
		["shop"] = "pdm",
	},
	["schlagen"] = {
		["name"] = "Schlagen GT",
		["brand"] = "Benefactor",
		["model"] = "schlagen",
		["price"] = 40000,
		["category"] = "sports",
		["hash"] = `schlagen`,
		["shop"] = "pdm",
	},
	["schwarzer"] = {
		["name"] = "Schwartzer",
		["brand"] = "Benefactor",
		["model"] = "schwarzer",
		["price"] = 60000,
		["category"] = "sports",
		["hash"] = `schwarzer`,
		["shop"] = "pdm",
	},
	["scorcher"] = {
		["name"] = "Scorcher",
		["model"] = "scorcher",
		["price"] = 850,
		["category"] = "cycles",
		["hash"] = `scorcher`,
		["shop"] = "pdm",
	},
	["seminole2"] = {
		["name"] = "Seminole Frontier",
		["brand"] = "Canis",
		["model"] = "seminole2",
		["price"] = 32900,
		["category"] = "suvs",
		["hash"] = `seminole2`,
		["shop"] = "pdm",
	},
	["serrano"] = {
		["name"] = "Serrano",
		["brand"] = "Benefactor",
		["model"] = "serrano",
		["price"] = 40000,
		["category"] = "suvs",
		["hash"] = `serrano`,
		["shop"] = "pdm",
	},
	["sheava"] = {
		["name"] = "ETR1",
		["brand"] = "Emperor",
		["model"] = "sheava",
		["price"] = 188000,
		["category"] = "super",
		["hash"] = `sheava`,
		["shop"] = "pdm",
	},
	["shotaro"] = {
		["name"] = "Shotaro Concept",
		["brand"] = "Nagasaki",
		["model"] = "shotaro",
		["price"] = 320000,
		["category"] = "motorcycles",
		["hash"] = `shotaro`,
		["shop"] = "pdm",
	},
	-- ["slamtruck"] = {
	-- 	["name"] = "Slam Truck",
	-- 	["brand"] = "Vapid",
	-- 	["model"] = "slamtruck",
	-- 	["price"] = 15000,
	-- 	["category"] = "muscle",
	-- 	["hash"] = `slamtruck`,
	-- 	["shop"] = "pdm",
	-- },
	["slamvan"] = {
		["name"] = "Slam Van",
		["brand"] = "Vapid",
		["model"] = "slamvan",
		["price"] = 15000,
		["category"] = "muscle",
		["hash"] = `slamvan`,
		["shop"] = "pdm",
	},
	-- ["slamvan2"] = {
	-- 	["name"] = "Lost Slam Van",
	-- 	["brand"] = "Vapid",
	-- 	["model"] = "slamvan2",
	-- 	["price"] = 25000,
	-- 	["category"] = "muscle",
	-- 	["hash"] = `slamvan2`,
	-- 	["shop"] = "pdm",
	-- },
	["speedo"] = {
		["name"] = "Speedo",
		["brand"] = "Vapid",
		["model"] = "speedo",
		["price"] = 20000,
		["category"] = "vans",
		["hash"] = `speedo`,
		["shop"] = "pdm",
	},
	["speedo4"] = {
		["name"] = "Speedo Custom",
		["brand"] = "Vapid",
		["model"] = "speedo4",
		["price"] = 25000,
		["category"] = "vans",
		["hash"] = `speedo4`,
		["shop"] = "pdm",
	},
	["stalion2"] = {
		["name"] = "Stallion Burgershot",
		["brand"] = "Declasse",
		["model"] = "stalion2",
		["price"] = 25000,
		["category"] = "muscle",
		["hash"] = `stalion2`,
		["shop"] = "pdm",
	},
	["stanier"] = {
		["name"] = "Stanier",
		["brand"] = "Vapid",
		["model"] = "stanier",
		["price"] = 39999,
		["category"] = "sedans",
		["hash"] = `stanier`,
		["shop"] = "pdm",
	},
	["stinger"] = {
		["name"] = "Stinger",
		["brand"] = "Grotti",
		["model"] = "stinger",
		["price"] = 30200,
		["category"] = "sportsclassic",
		["hash"] = `stinger`,
		["shop"] = "pdm",
	},
	["stratum"] = {
		["name"] = "Stratum",
		["brand"] = "Zirconium",
		["model"] = "stratum",
		["price"] = 70000,
		["category"] = "sedans",
		["hash"] = `stratum`,
		["shop"] = "pdm",
	},
	-- ["stretch"] = {
	-- 	["name"] = "Stretch",
	-- 	["brand"] = "Dundreary",
	-- 	["model"] = "stretch",
	-- 	["price"] = 900coq00,
	-- 	["category"] = "sedans",
	-- 	["hash"] = `stretch`,
	-- 	["shop"] = "pdm",
	-- },
	["stromberg"] = {
		["name"] = "Stromberg",
		["brand"] = "Ocelot",
		["model"] = "stromberg",
		["price"] = 3185350,
		["category"] = "sportsclassic",
		["hash"] = `stromberg`,
		["shop"] = "pdm",
	},
	["stryder"] = {
		["name"] = "Stryder",
		["brand"] = "Nagasaki",
		["model"] = "stryder",
		["price"] = 21000,
		["category"] = "motorcycles",
		["hash"] = `stryder`,
		["shop"] = "pdm",
	},
	["sugoi"] = {
		["name"] = "Sugoi",
		["brand"] = "Dinka",
		["model"] = "sugoi",
		["price"] = 39500,
		["category"] = "sports",
		["hash"] = `sugoi`,
		["shop"] = "pdm",
	},
	["sultan2"] = {
		["name"] = "Sultan Custom",
		["brand"] = "Karin",
		["model"] = "sultan2",
		["price"] = 67000,
		["category"] = "sports",
		["hash"] = `sultan2`,
		["shop"] = "pdm",
	},
	["surfer"] = {
		["name"] = "Surfer",
		["brand"] = "BF",
		["model"] = "surfer",
		["price"] = 23000,
		["category"] = "vans",
		["hash"] = `surfer`,
		["shop"] = "pdm",
	},
	["swinger"] = {
		["name"] = "Swinger",
		["brand"] = "Ocelot",
		["model"] = "swinger",
		["price"] = 500000,
		["category"] = "sportsclassic",
		["hash"] = `swinger`,
		["shop"] = "pdm",
	},
	["thrax"] = {
		["name"] = "Thrax",
		["brand"] = "Truffade",
		["model"] = "thrax",
		["price"] = 251000,
		["category"] = "super",
		["hash"] = `thrax`,
		["shop"] = "pdm",
	},
	["tigon"] = {
		["name"] = "Tigon",
		["brand"] = "Lampadati",
		["model"] = "tigon",
		["price"] = 691000,
		["category"] = "super",
		["hash"] = `tigon`,
		["shop"] = "pdm",
	},
	["toreador"] = {
		["name"] = "Toreador",
		["brand"] = "Pegassi",
		["model"] = "toreador",
		["price"] = 50000,
		["category"] = "sportsclassic",
		["hash"] = `toreador`,
		["shop"] = "pdm",
	},
	["tornado"] = {
		["name"] = "Tornado",
		["brand"] = "Declasse",
		["model"] = "tornado",
		["price"] = 500000,
		["category"] = "sportsclassic",
		["hash"] = `tornado`,
		["shop"] = "pdm",
	},
	["tornado2"] = {
		["name"] = "Tornado Gang",
		["brand"] = "Declasse",
		["model"] = "tornado2",
		["price"] = 50000,
		["category"] = "sportsclassic",
		["hash"] = `tornado2`,
		["shop"] = "pdm",
	},
	["tornado5"] = {
		["name"] = "Tornado Custom",
		["brand"] = "Declasse",
		["model"] = "tornado5",
		["price"] = 50000,
		["category"] = "sportsclassic",
		["hash"] = `tornado5`,
		["shop"] = "pdm",
	},
	["toros"] = {
		["name"] = "Toros",
		["brand"] = "Pegassi",
		["model"] = "toros",
		["price"] = 74900,
		["category"] = "suvs",
		["hash"] = `toros`,
		["shop"] = "pdm",
	},
	["tribike"] = {
		["name"] = "Tri Bike",
		["model"] = "tribike",
		["price"] = 750,
		["category"] = "cycles",
		["hash"] = `tribike`,
		["shop"] = "pdm",
	},
	["tribike2"] = {
		["name"] = "Tri Bike 2",
		["model"] = "tribike2",
		["price"] = 750,
		["category"] = "cycles",
		["hash"] = `tribike2`,
		["shop"] = "pdm",
	},
	["tribike3"] = {
		["name"] = "Tri Bike 3",
		["model"] = "tribike3",
		["price"] = 750,
		["category"] = "cycles",
		["hash"] = `tribike3`,
		["shop"] = "pdm",
	},
	["tropos"] = {
		["name"] = "Tropos Rallye",
		["brand"] = "Lampadati",
		["model"] = "tropos",
		["price"] = 68000,
		["category"] = "sports",
		["hash"] = `tropos`,
		["shop"] = "pdm",
	},
	["tulip"] = {
		["name"] = "Tulip",
		["brand"] = "Declasse",
		["model"] = "tulip",
		["price"] = 20000,
		["category"] = "muscle",
		["hash"] = `tulip`,
		["shop"] = "pdm",
	},
	["turismo2"] = {
		["name"] = "Turismo Classic",
		["brand"] = "Grotti",
		["model"] = "turismo2",
		["price"] = 600000,
		["category"] = "sportsclassic",
		["hash"] = `turismo2`,
		["shop"] = "pdm",
	},
	["coquette3"] = {
		["name"] = "Coquette Backflinn",
		["brand"] = "Invetero",
		["model"] = "coquette3",
		["price"] = 50000,
		["category"] = "sportsclassic",
		["hash"] = `coquette3`,
		["shop"] = "pdm",
	},
	["tyrus"] = {
		["name"] = "Tyrus",
		["brand"] = "Progen",
		["model"] = "tyrus",
		["price"] = 211000,
		["category"] = "super",
		["hash"] = `tyrus`,
		["shop"] = "pdm",
	},
	["vader"] = {
		["name"] = "Vader",
		["brand"] = "Shitzu",
		["model"] = "vader",
		["price"] = 14100,
		["category"] = "motorcycles",
		["hash"] = `vader`,
		["shop"] = "pdm",
	},
	["vagrant"] = {
		["name"] = 'Vagrant', 
		["brand"] = "Maxwell",
		["price"] = 200000,
		["category"] = "offroad",
		["model"] = "vagrant",
		["hash"] = `vagrant`,
		["shop"] = "pdm",
	},
	["vamos"] = {
		["name"] = "Vamos",
		["brand"] = "Declasse",
		["model"] = "vamos",
		["price"] = 20000,
		["category"] = "muscle",
		["hash"] = `vamos`,
		["shop"] = "pdm",
	},
	["verus"] = {
		["name"] = 'Verus', 
		["brand"] = "Dinka",
		["price"] = 100000,
		["category"] = "offroad",
		["model"] = "verus",
		["hash"] = `verus`,
		["shop"] = "pdm",
	},
	["vindicator"] = {
		["name"] = "Vindicator",
		["brand"] = "Dinka",
		["model"] = "vindicator",
		["price"] = 10000,
		["category"] = "motorcycles",
		["hash"] = `vindicator`,
		["shop"] = "pdm",
	},
	["virgo2"] = {
		["name"] = "Virgo Custom Classic",
		["brand"] = "Dundreary",
		["model"] = "virgo2",
		["price"] = 19900,
		["category"] = "muscle",
		["hash"] = `virgo2`,
		["shop"] = "pdm",
	},
	["viseris"] = {
		["name"] = "Viseris",
		["brand"] = "Lampadati",
		["model"] = "viseris",
		["price"] = 35000,
		["category"] = "sportsclassic",
		["hash"] = `viseris`,
		["shop"] = "pdm",
	},
	-- ["voltic2"] = {
	-- 	["name"] = "Rocket Voltic",
	-- 	["brand"] = "Coil",
	-- 	["model"] = "voltic2",
	-- 	["price"] = 3830400,
	-- 	["category"] = "super",
	-- 	["hash"] = `voltic2`,
	-- 	["shop"] = "pdm",
	-- },
	["vortex"] = {
		["name"] = "Vortex",
		["brand"] = "Pegassi",
		["model"] = "vortex",
		["price"] = 13000,
		["category"] = "motorcycles",
		["hash"] = `vortex`,
		["shop"] = "pdm",
	},
	["vstr"] = {
		["name"] = "V-STR",
		["brand"] = "Albany",
		["model"] = "vstr",
		["price"] = 46000,
		["category"] = "sports",
		["hash"] = `vstr`,
		["shop"] = "pdm",
	},
	["warrener"] = {
		["name"] = "Warrener",
		["brand"] = "Vulcar",
		["model"] = "warrener",
		["price"] = 14000,
		["category"] = "sedans",
		["hash"] = `warrener`,
		["shop"] = "pdm",
	},
	["weevil"] = {
		["name"] = "Weevil",
		["brand"] = "BF",
		["model"] = "weevil",
		["price"] = 10000,
		["category"] = "compacts",
		["hash"] = `weevil`,
		["shop"] = "pdm",
	},
	["winky"] = {
		["name"] = 'Winky', 
		["brand"] = "Vapid",
		["price"] = 10000,
		["category"] = "offroad",
		["model"] = "winky",
		["hash"] = `winky`,
		["shop"] = "pdm",
	},
	["wolfsbane"] = {
		["name"] = "Wolfsbane",
		["brand"] = "Western",
		["model"] = "wolfsbane",
		["price"] = 11300,
		["category"] = "motorcycles",
		["hash"] = `wolfsbane`,
		["shop"] = "pdm",
	},
	["yosemite2"] = {
		["name"] = "Yosemite Drift",
		["brand"] = "Declasse",
		["model"] = "yosemite2",
		["price"] = 28000,
		["category"] = "muscle",
		["hash"] = `yosemite2`,
		["shop"] = "pdm",
	},
	["yosemite3"] = {
		["name"] = 'Yosemite Rancher', 
		["brand"] = "Declasse",
		["price"] = 33000,
		["category"] = "offroad",
		["model"] = "yosemite3",
		["hash"] = `yosemite3`,
		["shop"] = "pdm",
	},
	["youga"] = {
		["name"] = "Youga",
		["brand"] = "Bravado",
		["model"] = "youga",
		["price"] = 21800,
		["category"] = "vans",
		["hash"] = `youga`,
		["shop"] = "pdm",
	},
	["youga2"] = {
		["name"] = "Youga Classic",
		["brand"] = "Bravado",
		["model"] = "youga2",
		["price"] = 25500,
		["category"] = "vans",
		["hash"] = `youga2`,
		["shop"] = "pdm",
	},
	["youga3"] = {
		["name"] = "Youga Classic 4x4",
		["brand"] = "Bravado",
		["model"] = "youga3",
		["price"] = 26000,
		["category"] = "vans",
		["hash"] = `youga3`,
		["shop"] = "pdm",
	},
	["zion3"] = {
		["name"] = "Zion Classic",
		["brand"] = "Übermacht",
		["model"] = "zion3",
		["price"] = 24000,
		["category"] = "sportsclassic",
		["hash"] = `zion3`,
		["shop"] = "pdm",
	},
	["zombiea"] = {
		["name"] = "Zombie Bobber",
		["brand"] = "Western",
		["model"] = "zombiea",
		["price"] = 20500,
		["category"] = "motorcycles",
		["hash"] = `zombiea`,
		["shop"] = "pdm",
	},
	["zorrusso"] = {
		["name"] = "Zorrusso",
		["brand"] = "Pegassi",
		["model"] = "zorrusso",
		["price"] = 480000,
		["category"] = "super",
		["hash"] = `zorrusso`,
		["shop"] = "pdm",
	},
}
