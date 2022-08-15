ConfigPollero                            = {}

ConfigPollero.DrawDistance               = 10.0
ConfigPollero.MarkerType                 = 27
ConfigPollero.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
ConfigPollero.MarkerColor                = {r = 50, g = 50, b = 204}
ConfigPollero.MaxInService               = -1
ConfigPollero.Jobs = {

	Pollero = {

        jobName = 'pollero',

        Vehicles = {
            SpawnPoint   = { x = -1058.2, y = -2026.84, z = 13.16 },
            Heading      = 121.02,
            Vehicle = 'benson',
        }, 
		
		CloackRoom = {
			vector3(-1071.01, -2003.5, 14.82) 
        },
        
        VehicleDeleter = {
			vector3(-1063.05, -2010.27, 12.16) 
        },

        Recolecta = {
			vector3(-62.76, 6241.58, 30.12),
            vector3(-64.76, 6235.19, 30.12) 
        },

        Sacrificar = {
			vector3(-77.67, 6229.75, 30.12) 
        },

        Empaquetar = {
			vector3(-101.59, 6208.57, 30.05) 
        },

        Sell = {
			vector3(-591.69, -892.63, 24.94) 
        },

    },
}

ConfigPollero.UniformsPollero = {
	empleado_outfit = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 384,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 68,
			['pants_1'] = 142,   ['pants_2'] = 0,
			['shoes_1'] = 97,   ['shoes_2'] = 3,
			['chain_1'] = 0,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1'] = 409,    ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 83,
			['pants_1'] = 154,   ['pants_2'] = 0,
			['shoes_1'] = 72,    ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0
		},
	}
}

ConfigMinero = {
    pricexd = {
        -- ['item'] = {min, max} --
        steel = math.random(2, 6),
        iron = math.random(2, 6),
        copper = math.random(2, 6),
        diamond = math.random(5, 9),
        emerald = math.random(5, 9)
    },
    NPCs = {
        {x = -97.12, y = -1013.8, z = 27.28, h = 166.89, hash = 0x14D7B4E0, top = "",anim = ''}
    },
    ChanceToGetItem = 20, -- if math.random(0, 100) <= ChanceToGetItem then give item
    Items = {'steel','steel','steel','steel','iron', 'iron', 'iron', 'copper', 'copper', 'emerald'},
    Sell = vector3(-97.12, -1013.8, 26.3),
    Objects = {
        ['pickaxe'] = 'prop_tool_pickaxe',
    },
    MiningPositions = {
        {coords = vector3(2992.77, 2750.64, 42.78), heading = 209.29},
        {coords = vector3(2983.03, 2750.9, 42.02), heading = 214.08},
        {coords = vector3(2976.74, 2740.94, 43.63), heading = 246.21},
        {coords = vector3(2934.265, 2742.695, 43.1), heading = 96.1},
        {coords = vector3(2907.25, 2788.27, 45.4), heading = 109.39}
    },
}
Strings = {
    ['not_job'] = "You don't have the trucker job!",
    ['somebody_doing'] = 'Ahora mismo no hay ninguna mercancia disponible para esta ruta',
    ['menu_title'] = 'Camionero - Reparte la Mercancía',
    ['e_browse_jobs'] = 'Presiona ~y~E~s~ para trabajar de Camionero',
    ['start_job'] = 'Actividad - Camionero', 
    ['truck'] = 'Camion',
    ['trailer'] = 'Trailer', 
    ['get_to_truck'] = 'Montate en el ~y~camión~w~!',
    ['get_to_trailer'] = 'Engancha el ~y~trailer~w~ en tu camión!',
    ['destination'] = 'Destino',
    ['get_out'] = 'Sal del ~y~camión~w~!',
    ['park'] = 'Entrega el ~y~trailer~w~ en el destino.',
    ['park_truck'] = 'Entrega el ~y~camión~w~ para cobrar tu pago.',
    ['drive_destination'] = 'Conduce hacia el ~b~destino~w~.',
    ['reward'] = 'Has recibido ~g~$~w~%s',
    ['paid_damages'] = 'Conduce mejor la proxima vez! Has recibido un pago ~r~$~w~%s por los daños causados!',
    ['drive_back'] = 'Devuelve el ~y~camión ~w~para cobrar tu salario.', 
    ['detach'] = 'Manten presionada la ~y~H~s~ para dejar el Trailer',
	['press_mine'] = 'Presiona ~INPUT_CONTEXT~ para minar.',
    ['mining_info'] = 'Presiona ~y~Retroceso~w~ para parar.',
    ['you_sold'] = 'Has vendido %sx %s por %s',
    ['e_sell'] = 'Presiona ~INPUT_CONTEXT~ para vender tus minerales',
    ['someone_close'] = 'No puedes picar con un jugador cerca!',
    ['mining'] = 'Mina',
    ['sell_mine'] = 'Vender Minerales' 
}  


-- ----Config PizzaJob
--Puntos
Config = {}
Config.Base = {
	coords  = {x = -1285.8394775391, y = -1387.5504150391, z = 4.4498672485352},
	scooter = {x = -1285.8394775391, y = -1387.5504150391, z = 4.4498672485352},
	retveh  = {x =  -1288.3156738281, y = -1392.4390869141, z = 4.3659410476685},
	deleter = {x = -1291.4326171875, y = -1395.4713134766, z = 4.4703178405762},
	heading = 286.56
}

--No toque
Config.DecorCode = 0

--Cantidad de entregas
Config.Deliveries = {
	min = 5,
	max = 6
} 

-- Dinero por cada entrega
Config.Rewards = {
	scooter = 22
}

-- Modelo del vehiculo a spawnear 
Config.Models = {
	scooter = 'faggio3'
}

--Escala de los blips indicadores
Config.Scales = {
	scooter = 0.6
}

--Dinero de seguridad (se cobra al sacar la moto, se recupera si completas la entrega)
Config.Safe = {
	scooter = 10
}

--Zonas de spawn de la motillo
Config.ParkingSpawns = {
	{x = -1276.82, y = -1387.19, z = 4.21, h = 285.12},
	{x = -1280.34, y = -1388.42, z = 4.24, h = 281.84}, 
	{x = -1284.63, y = -1389.86, z = 4.28, h = 285.24},
}

--Entregas
Config.DeliveryLocationsScooter = {
	{Item1 = {x = -153.19, y = -838.31, z = 30.12},		Item2 = {x = -143.85, y = -846.3, z = 30.6}},
	{Item1 = {x = 37.72, y = -795.71, z = 30.93},		Item2 = {x = 44.94, y = -803.24, z = 31.52}},
	{Item1 = {x = 111.7, y = -809.56, z = 30.71},		Item2 = {x = 102.19, y = -818.22, z = 31.35}},
	{Item1 = {x = 132.61, y = -889.41, z = 29.71},		Item2 = {x = 121.25, y = -879.82, z = 31.12}},
	{Item1 = {x = 54.41, y = -994.86, z = 28.7},		Item2 = {x = 43.89, y = -997.98, z = 29.34}},
	{Item1 = {x = 54.41, y = -994.86, z = 28.7},		Item2 = {x = 57.65, y = -1003.72, z = 29.36}},
	{Item1 = {x = 142.87, y = -1026.78, z = 28.67},		Item2 = {x = 135.44, y = -1031.19, z = 29.35}},
	{Item1 = {x = 248.03, y = -1005.49, z = 28.61},		Item2 = {x = 254.83, y = -1013.25, z = 29.27}},
	{Item1 = {x = 275.68, y = -929.64, z = 28.47},		Item2 = {x = 285.55, y = -937.26, z = 29.39}},
	{Item1 = {x = 294.29, y = -877.33, z = 28.61},		Item2 = {x = 301.12, y = -883.47, z = 29.28}},
	{Item1 = {x = 247.68, y = -832.03, z = 29.16},		Item2 = {x = 258.66, y = -830.44, z = 29.58}},
	{Item1 = {x = 227.21, y = -705.26, z = 35.07},		Item2 = {x = 232.2, y = -714.55, z = 35.78}},
	{Item1 = {x = 241.06, y = -667.74, z = 37.44},		Item2 = {x = 245.5, y = -677.7, z = 37.75}},
	{Item1 = {x = 257.05, y = -628.21, z = 40.59},		Item2 = {x = 268.54, y = -640.44, z = 42.02}},
	{Item1 = {x = 211.33, y = -605.63, z = 41.42},		Item2 = {x = 222.32, y = -596.71, z = 43.87}},
	{Item1 = {x = 126.27, y = -555.46, z = 42.66},		Item2 = {x = 168.11, y = -567.17, z = 43.87}},
	{Item1 = {x = 254.2, y = -377.17, z = 43.96},		Item2 = {x = 239.06, y = -409.27, z = 47.92}},
	{Item1 = {x = 244.49, y = 349.05, z = 105.46},		Item2 = {x = 252.86, y = 357.13, z = 105.53}},
	{Item1 = {x = 130.77, y = -307.27, z = 44.58},		Item2 = {x = 138.67, y = -285.45, z = 50.45}},
	{Item1 = {x = 54.44, y = -280.4, z = 46.9},			Item2 = {x = 61.86, y = -260.86, z = 52.35}},
	{Item1 = {x = 55.15, y = -225.54, z = 50.44},		Item2 = {x = 76.29, y = -233.15, z = 51.4}},
	{Item1 = {x = 44.6, y = -138.99, z = 54.66},		Item2 = {x = 50.78, y = -136.23, z = 55.2}},
	{Item1 = {x = 32.51, y = -162.61, z = 54.86},		Item2 = {x = 26.84, y = -168.84, z = 55.54}},
	{Item1 = {x = -29.6, y = -110.84, z = 56.51},		Item2 = {x = -23.5, y = -106.74, z = 57.04}},
	{Item1 = {x = -96.86, y = -86.84, z = 57.44},		Item2 = {x = -87.82, y = -83.55, z = 57.82}},
	{Item1 = {x = -146.26, y = -71.46, z = 53.9},		Item2 = {x = -132.92, y = -69.02, z = 55.42}},
	{Item1 = {x = -238.41, y = 91.97, z = 68.11},		Item2 = {x = -263.61, y = 98.88, z = 69.3}},
	{Item1 = {x = -251.45, y = 20.43, z = 53.9},		Item2 = {x = -273.35, y = 28.21, z = 54.75}},
	{Item1 = {x = -322.4, y = -10.06, z = 47.42},		Item2 = {x = -315.48, y = -3.76, z = 48.2}},
	{Item1 = {x = -431.22, y = 14.6, z = 45.5},			Item2 = {x = -424.83, y = 21.74, z = 46.27}},
	{Item1 = {x = -497.33, y = -8.38, z = 44.33},		Item2 = {x = -500.95, y = -18.65, z = 45.13}},
	{Item1 = {x = -406.69, y = -44.87, z = 45.13},		Item2 = {x = -429.07, y = -24.12, z = 46.23}},
	{Item1 = {x = -433.94, y = -76.33, z = 40.93},		Item2 = {x = -437.89, y = -66.91, z = 43.01}},
	{Item1 = {x = -583.22, y = -154.84, z = 37.51},		Item2 = {x = -582.8, y = -146.8, z = 38.23}},
	{Item1 = {x = -613.68, y = -213.46, z = 36.51},		Item2 = {x = -622.23, y = -210.97, z = 37.33}},
	{Item1 = {x = -582.44, y = -322.69, z = 34.33},		Item2 = {x = -583.02, y = -330.38, z = 34.97}},
	{Item1 = {x = -658.25, y = -329, z = 34.2},			Item2 = {x = -666.69, y = -329.06, z = 35.2}},
	{Item1 = {x = -645.84, y = -419.67, z = 34.1},		Item2 = {x = -654.84, y = -414.21, z = 35.45}},
	{Item1 = {x = -712.7, y = -668.08, z = 29.81},		Item2 = {x = -714.58, y = -675.37, z = 30.63}},
	{Item1 = {x = -648.24, y = -681.53, z = 30.61},		Item2 = {x = -656.77, y = -678.12, z = 31.46}},
	{Item1 = {x = -648.87, y = -904.3, z = 23.8},		Item2 = {x = -660.88, y = -900.72, z = 24.61}},
	{Item1 = {x = -529.01, y = -848.03, z = 29.26},		Item2 = {x = -531.0, y = -854.04, z = 29.79}}
}

--Uniforme Pizzer
Config.Uniforms = {
	empleado_outfit = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 183,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 45,   ['pants_2'] = 0,
			['shoes_1'] = 47,   ['shoes_2'] = 2,
			['chain_1'] = 0,  ['chain_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,   ['tshirt_2'] = 0,
			['torso_1'] = 188,    ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 18,   ['pants_2'] = 2,
			['shoes_1'] = 36,    ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0
		},
	}
}


--Traduccione papi
Config.Locales = {
	["delivery_not_available"]    = "Este modelo no esta disponible, por favor usa scooter o furgoneta.",
	["start_delivery"]            = "Presiona ~y~E~s~ para empezar el reparto", 
	["safe_deposit_received"]     = "La fianza fue cobrada de tu cuenta bancaria",
	["safe_deposit_returned"]     = "Has recibido el reembolso de la fianza",
	["safe_deposit_withheld"]     = "Entrega fallida, has perdido la fianza.",
	["delivery_point_reward"]     = "Entrega completa, recibes $",
	["get_back_in_vehicle"]       = "Móntate en el vehículo",
	["remove_goods"]              = "Presiona ~y~E~s~ para sacar la pizza",
	["remove_goods_subtext"]      = "Aparca el vehículo y descarga la mercancía",
	["drive_next_point"]          = "Conduce hasta el siguiente destino",
	["deliver_inside_shop"]       = "Lleva la mercancía al destino",
	["get_back_to_deliveryhub"]   = "Vuelve al almacen y entrega el vehículo",
	["delivery_vehicle_returned"] = "El vehículo has sido devuelto",
	["finish_job"]                = "Estado de la entrega: ", 
	["end_delivery"]              = "Presiona ~y~E~s~ para finalizar el trabajo",
	["blip_name"]                 = "Pizzería",
	["dst_blip"]                  = "Entrega", 
	["delivery_end"]              = "Entrega finalizada",  
	["delivery_failed"]           = "Has perdido la fianza porque el vehículo esta detruido o perdido",
	["delivery_finish"]           = "Has terminado las entregas",
	["delivery_start"]            = "Entrega",
	["delivery_tips"]             = "Conduce con precaución hasta el destino y entrega la mercancía",
	["not_enough_money"]          = "No tienes $100 para la fianza"
}

----Config Basurero +

Config.Locale = 'en'
Config.TruckPlateNumb = 0  -- This starts the custom plate for trucks at 0
Config.MaxStops	= 8 -- Total number of stops a person is allowed to do before having to return to depot.
Config.MaxBags = 6 -- Total number of bags a person can get out of a bin
Config.MinBags = 4 -- Min number of bags that a bin can contain.
Config.BagPay = 3 -- The amount paid to each person per bag
Config.StopPay = 7 -- Total pay for the stop before bagpay.
Config.JobName = 'garbage'  -- use this to set the jobname that you want to be able to do garbagecrew 

--Config.UseWorkClothing = true	-- This feature has been removed until I can find the issue with removing player loadout on reload

Config.Trucks = {
  'trash',
}

Config.DumpstersAvaialbe = {
  218085040, 
  666561306,
  -58485588,
  -206690185,
  1511880420,
  682791951,
  -387405094,
  364445978,
  1605769687,
  -1831107703,
  -515278816,
  -1790177567,
}

Config.VehicleSpawn = {pos = vector3(-309.35,-1520.89, 27.69),}

Config.Zones = {
	[1] = {type = 'Zone', size = 3.0 , name = 'endmission', pos = vector3(-347.17,-1531.14, 26.74)},
	[2] = {type = 'Zone', size = 1.5 , name = 'timeclock', pos = vector3(-321.70,-1545.94, 29.90)},
	[3] = {type = 'Zone', size = 1.5 , name = 'vehiclelist', pos = vector3(-316.16,-1536.08, 26.71)},
}

-- if you wish to add more pickup locations must have the same format as below.  Make sure when you are selecting locations you have
-- your Settings\Graphics\Distance Scaling - turned all the way down to make sure the bin will show up for everyone.
Config.Collections = {
  [1] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(114.83,-1462.31, 29.29508)},
  [2] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-6.04,-1566.23, 29.209197)},
  [3] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1.88,-1729.55, 29.300233)},
  [4] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(159.09,-1816.69, 27.91234)},
  [5] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(358.94,-1805.07, 28.96659)},
  [6] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(481.36,-1274.82, 29.64475)},
  [7] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(127.9472,-1057.73, 29.19237)},
  [8] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1613.123, -509.06, 34.99874)},
  [9] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(342.78,-1036.47, 29.19420)},
  [10] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(383.03,-903.60, 29.15601)}, 
  [11] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(165.44,-1074.68, 28.90792)}, 
  [12] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(50.42,-1047.98, 29.31497)}, 
  [13] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1463.92, -623.96, 30.20619)},
  [14] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(443.96,-574.33, 28.49450)},
  [15] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1255.41,-1286.82,3.58411)}, 
  [16] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1229.35, -1221.41, 6.44954)},
  [17] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-31.94,-93.43, 57.24907)},
  [18] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(274.31,-164.43, 60.35734)},
  [19] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-364.33,-1864.71, 20.24249)}, 
  [20] = {type = 'Collection', size = 5.0 , name = 'collection', pos = vector3(-1239.42, -1401.13, 3.75217)},
}

ConfigGoPostal              = {}
ConfigGoPostal.DrawDistance = 10.0

ConfigGoPostal.JobVehiclePlate = 'GOPOSTAL' -- Plaque des vehicules du job (maximun 8 caractères)

ConfigGoPostal.Caution 		   = 50
ConfigGoPostal.nomina = 16

ConfigGoPostal.Vehicle = { -- Ajouter les véhicules du métier ici
	"boxville2"
}

ConfigGoPostal.Zones = { -- Emplacement des points
	CloakRoom = {
		Pos   = {x = 78.899, y = 111.934, z = 79.99},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 250, g = 250, b = 250},
		Type  = 27
	},

	VehicleSpawner = {
		Pos   = {--x = 69.0792, y = 125.886, z = 78.1
				},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 142, g = 68, b = 173},
		Type  = 1
	}, 

	VehicleSpawnPoint = {
		Pos     = {x = 83.09, y = 105.66, z = 79.18},
		Heading = 70.18, -- Orientation 
		Size    = {x = 3.0, y = 3.0, z = 1.0},
		Type    = -1
	},

	VehicleDeleter = {
		Pos   = {x = 61.96, y = 122.02, z = 79.19},
		Size  = {x = 2.0, y = 2.0, z = 2.0},
		Color = {r = 250, g = 250, b = 250},
		Type  = 36
	},

	Distribution = { -- point pr récuperer les colis & courrier
		Pos   = {x = 115.141, y = 100.649, z = 79.890},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 236, g = 240, b = 241},
		Type  = 1
	},
}

ConfigGoPostal.Uniforms = { -- Tenue de service
	male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 145,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 0,
        ['pants_1'] = 80,   ['pants_2'] = 1,
        ['shoes_1'] = 70,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0
    },
    female = {
        ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
        ['torso_1'] = 330,   ['torso_2'] = 8,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 14,
        ['pants_1'] = 145,   ['pants_2'] = 0,
        ['shoes_1'] = 27,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0
    }
}


-- Point des livraisons

ConfigGoPostal.Livraisons = {
	Richman = {
		Pos = {
			{x = -1129.1517, y = 395.020, z = 69.651, letter = true, colis = false},
			{x = -1103.568, y = 284.569, z = 63.094, letter = true, colis = false},
			{x = -1473.558, y = -10.789, z = 54.525, letter = true, colis = false},
			{x = -1532.2011, y = -37.736, z = 56.381, letter = true, colis = false},
			{x = -1545.794, y = -33.281, z = 56.891, letter = true, colis = false},
			{x = -1464.423, y = 51.018, z = 53.988, letter = true, colis = false},
			{x = -1470.73046875, y = 63.990886688232, z = 51.173046112061, letter = true, colis = true},
			{x = -1504.2097167969, y = 44.28625869751, z = 53.951641082764, letter = true, colis = false},
			{x = -1585.7332763672, y = 44.503841400146, z = 59.00085067749, letter = true, colis = false},
			{x = -1619.6723632813, y = 57.411979675293, z = 60.791728973389, letter = true, colis = true},
			{x = -1615.3327636719, y = 74.720077514648, z = 60.412998199463, letter = true, colis = false},
		},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
        Color = {r = 211, g = 84, b = 0},
        Type  = 1
	},

	RockfordHills = {
		Pos = {
			{x = -822.11590576172, y = -28.949552536011, z = 37.660648345947, letter = true, colis = true},
			{x = -877.12579345703, y = 1.4300217628479, z = 43.068756103516, letter = true, colis = false},
			{x = -883.50225830078, y = 19.95990562439, z = 43.858791351318, letter = true, colis = false},
			{x = -904.48303222656, y = 17.959585189819, z = 45.375545501709, letter = true, colis = false},
			{x = -849.53887939453, y = 103.97817993164, z = 51.921394348145, letter = true, colis = false},
			{x = -851.21838378906, y = 178.97734069824, z = 68.720985412598, letter = true, colis = false},
			{x = -923.23107910156, y = 178.72102355957, z = 65.937400817871, letter = true, colis = false},
			{x = -954.20562744141, y = 177.81230163574, z = 64.367691040039, letter = true, colis = false},
			{x = -934.73480224609, y = 123.06588745117, z = 55.740001678467, letter = true, colis = false},
			{x = -950.38397216797, y = 125.10294342041, z = 56.440544128418, letter = true, colis = true},
			{x = -979.54205322266, y = 147.44619750977, z = 59.907157897949, letter = true, colis = false},
			{x = -1046.2899169922, y = 209.78942871094, z = 62.423046112061, letter = true, colis = false},			
		},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
        Color = {r = 46, g = 204, b = 113},
        Type  = 1
	},
 
	Vespucci = {
		Pos = {
			{x = -1091.9807128906, y = -923.61407470703, z = 2.1418874263763, letter = true, colis = false},
			{x = -1038.87109375, y = -891.09130859375, z = 4.2144069671631, letter = true, colis = true},
			{x = -948.60479736328, y = -898.53344726563, z = 1.1630630493164, letter = true, colis = true},
			{x = -919.51391601563, y = -952.21594238281, z = 1.162935256958, letter = true, colis = false},
			{x = -933.55932617188, y = -1081.3103027344, z = 1.1503119468689, letter = true, colis = false},
			{x = -954.99682617188, y = -1083.3701171875, z = 1.1503119468689, letter = true, colis = false},
			{x = -1025.9075927734, y = -1129.6602783203, z = 1.1702592372894, letter = true, colis = false},
			{x = -1061.0762939453, y = -1155.3466796875, z = 1.1118972301483, letter = true, colis = false},
			{x = -1253.8918457031, y = -1330.2947998047, z = 3.0237193107605, letter = true, colis = true},
			{x = -1106.5417480469, y = -1534.9737548828, z = 3.3808641433716, letter = true, colis = false},
			{x = -1116.1688232422, y = -1575.6658935547, z = 3.3870568275452, letter = true, colis = false},
		},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
        Color = {r = 52, g = 152, b = 219},
        Type  = 1
	},

	SLS = {
		Pos = {
			{x = -50.930358886719, y = -1783.6270751953, z = 27.300802230835, letter = true, colis = false},
			{x = 13.642129898071, y = -1850.1307373047, z = 23.055648803711, letter = true, colis = false},
			{x = 110.53960418701, y = -1956.0163574219, z = 19.751287460327, letter = true, colis = false},
			{x = 151.61938476563, y = -1896.3343505859, z = 22.092262268066, letter = true, colis = false},
			{x = 158.33076477051, y = -1876.6044921875, z = 22.980903625488, letter = true, colis = true},
			{x = 221.90466308594, y = -1720.8103027344, z = 28.202871322632, letter = true, colis = false},
			{x = 249.87113952637, y = -1730.8135986328, z = 28.669330596924, letter = true, colis = false},
			{x = 263.07949829102, y = -1704.0960693359, z = 28.205499649048, letter = true, colis = false},
			{x = 332.95666503906, y = -1742.1281738281, z = 28.730531692505, letter = true, colis = false},
			{x = 326.57717895508, y = -1763.9366455078, z = 28.015428543091, letter = true, colis = false},
			{x = 321.9792175293, y = -1838.9698486328, z = 26.227586746216, letter = true, colis = false},
			{x = 440.62481689453, y = -1840.9602050781, z = 26.871042251587, letter = true, colis = false},
			{x = 385.88714599609, y = -1882.3186035156, z = 24.838005065918, letter = true, colis = false},
		},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
        Color = {r = 241, g = 196, b = 15},
        Type  = 1
    }

}

----

ConfigPesca = {}
ConfigPesca.timeRefresh = 180000 --180 seconds default
ConfigPesca.DrawDistance    = 15.0
ConfigPesca.SpawnVehicle = {x = -278.12, y = 6667.93, z = 0.5, h = 150.0}
ConfigPesca.NPCs = {
	{x = -278.39, y = 6637.86, z = 7.55, h = 229.04, hash = 0x60F4A717, anim = ''},
	{x = 813.39, y = -2982.61, z = 6.05, h = 267.62, hash = 0x60F4A717, anim = ''},
	{x = -70.79, y = 6217.66, z = 31.46, h = 176.86, hash = 0xC54E878A, anim = ''},
	{x = -2289.56, y = 2525.91, z = 3.36, h = 312.37, hash = 0xC54E878A, anim = ''}  
}
ConfigPesca.Items = {
	{label = 'Pez', item = 'pez', price = 5},
	{label = 'Alga', item = 'alga', price = 30}
}

ConfigPesca.Items1 = {
	{label = 'Tortuga', item = 'tortuga', price = 500}
}

ConfigPesca.Items2 = {
	{label = 'Tiburón', item = 'tiburon', price = 5000}
}

ConfigPesca.Zones = { 

	rental = { -- Rental Menu
		Pos   = {x = -278.12, y = 6637.69, z = 6.565},
		Size  = {x = 1.2, y = 1.2, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 27
	},

	rental2 = { -- Rental Menu
		Pos   = {x = -1799.75, y = -1225.09, z = 0.60},
		Size  = {x = 1.2, y = 1.2, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 27
	},

	rental3 = { -- Rental Menu
		Pos   = {x = -800.74, y = -1513.43, z = 1.6-0.97},
		Size  = {x = 1.2, y = 1.2, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 27
	},
	
	sell = { 
		Pos   = {x = 813.39, y = -2982.61, z = 5.05},
		Size  = {x = 1.2, y = 1.2, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 27
	},

	tortugas = { 
		Pos   = {x = -70.74, y = 6217.69, z = 30.49},
		Size  = {x = 1.2, y = 1.2, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 27
	},

	PawnShops = { 
		Pos   = {x = 1601.03,  y = 3588.46, z = 37.80},
		Size  = {x = 1.2, y = 1.2, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 27
	},
	
	tiburon = { 
		Pos   = {x = -2289.56, y = 2525.91, z = 2.38},
		Size  = {x = 1.2, y = 1.2, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 27
    },

	savevehicle = { 
		Pos   = {x = -1797.93, y = -1229.87, z = 0.14},
		Size  = {x = 3.2, y = 3.2, z = 3.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 27
    }
}

Config.jobBlip = vector3(-59.96, -2523.2, 5.21)

Config.pedCoords = vector3(-63.0, -2520.4, 6.45)

Config.pedHeading = 227.72

Config.blipText = "Sede de camioneros"

Config.truckSpawn = vector3(-59.36, -2481.36, 5.09)

Config.truckHeading = 144.12

Config.trailerSpawn = vector3(-59.36, -2481.36, 5.09)

Config.trailerHeading = 144.12

Config.deliverCoords = vector3(-86.44, -2513.28, 5.05)

Config.byeCoords = vector3(-97.64, -2498.08, 5.05)

Config.arriveTime = 9000

Config.Trailers = {
    [1] = "tanker",
    [2] = "trailers2",
    [3] = "trailerlogs",
    [4] = "trailers",
    [5] = "armytanker",
    [6] = "docktrailer",
    [7] = "tvtrailer",
    [8] = "trailerlarge",
    [9] = "trailers4",
}

-------------------------
-------ACTIVIDADES-------
-------------------------

Config.Act = {


    Points = {
        elec = {
            coords = vector3(-329.2, -1071.04, 23.04 - 1.03),
            h = 163.68,
            recogn = "Electricista",
            ped = "s_m_y_construct_02",
            bliptext = "Electricista",
            veh = "burrito",
            carspawn = vector3(-340.44, -1069.72, 23.04),
            carh = 164.88,
        },


        mech = {
            coords = vector3(1195.68, -3255.08, 7.08 - 1.03),
            h = 97.04,
            recogn = "Portuario",
            ped = "ig_floyd",
            bliptext = "Carguero",
            veh = "forklift",
            carspawn = vector3(1190.76, -3242.64, 5.09),
            carh = 87.72,
        },

        farm = {
            coords = vector3(420.68, 6469.6, 28.8 - 1.03),
            h = 304.52,
            recogn = "Granjero",
            ped = "s_m_m_trucker_01",
            bliptext = "Granjero",
            veh = "tractor2",
            carspawn = vector3(414.48, 6473.32, 28.8),
            carh = 68.24,
        },

        gan = {
            coords = vector3(1899.52, 4921.52, 47.85),
            h = 249.68,
            recogn = "Ganadero",
            ped = "a_m_m_hillbilly_01",
            bliptext = "Ganadería",
            veh = "dloader",
            carspawn = vector3(1905.36, 4925.44, 47.97),
            carh = 333.88,
        },
        
    }
    
}

Config.Elec = {
    MaxRepairs = 4,
    FinishPoint = vector3(-334.72, -1068.56, 23.04),
    locations = {
        [1] = {x = 176.64, y = -864.4, z = 30.8, h = 74.4},
        [2] = {x = 316.44, y = -729.12, z = 29.32, h = 245.08},
        [3] = {x = 106.84, y = -1385.6, z = 29.28, h = 335.76},
        [4] = {x = 245.08, y = 165.56, z = 104.17, h = 336.14},
        [5] = {x = 133.56, y = 234.72, z = 106.49, h = 172,00},
        [6] = {x = -387.28, y = 251.76, z = 82.69, h = 188,00},
        [7] = {x = -428.0, y = 230.56, z = 82.45, h = 8,00},
        [8] = {x = -481.8, y = -212.92, z = 35.81, h = 305,00},
        [9] = {x = -619.2, y = -506.96, z = 33.93, h = 94,00},
        [10] = {x = -786.0, y = -976.64, z = 13.77, h = 233,00},
        [11] = {x = -865.92, y = -962.48, z = 14.53, h = 295,00},
        [12] = {x = -846.84, y = -881.44, z = 16.45, h = 94,00},
        [13] = {x = -275.24, y = -802.08, z = 31.13, h = 247,00},
        [14] = {x = 366.4, y = -869.32, z = 28.53, h = 355,00},
        [15] = {x = 405.24, y = -1105.72, z = 28.61, h = 84,00},
        [16] = {x = -91.24, y = -1663.08, z = 28.45, h = 228,00},
        [17] = {x = 38.44, y = -1893.64, z = 21.25, h = 326,00},
        [18] = {x = 95.28, y = -1874.64, z = 23.13, h = 52,00},
        [19] = {x = 271.12, y = -1689.2, z = 28.41, h = 58,00},
        [20] = {x = -45.6, y = -1472.36, z = 31.09, h = 3,00},
        [21] = {x = -185.52, y = -845.04, z = 29.21, h = 258,00},
        [22] = {x = -772.04, y = -264.52, z = 36.49, h = 18,00},
        [23] = {x = -971.6, y = -316.28, z = 36.93, h = 202,00},
        [24] = {x = -1061.28, y = -362.52, z = 36.97, h = 215,00},
        [25] = {x = -1365.72, y = -567.6, z = 29.29, h = 72,00},
        [26] = {x = -1032.76, y = -812.64, z = 16.21, h = 342,00},
        [27] = {x = -1185.8, y = -1517.6, z = 3.53, h = 214,00},
        [28] = {x = -1082.88, y = -1425.64, z = 4.21, h = 83,00},
        [29] = {x = -1089.12, y = -1392.28, z = 4.21, h = 254,00},



        
    },
    --[[[4] = {}
    [5] = {}
    [6] = {}
    [7] = {}
    [8] = {}
    [9] = {}
    [10] = {}
    [11] = {}
    [12] = {}
    [13] = {}
    [14] = {}
    [15] = {}]]
    max = 29,
}

Config.Mech = {
    MaxRepairs = 1,
    FinishPoint = vector3(1189.88, -3245.84, 6.04),
    locations = {
        [1] = {x = 1149.96, y = -3084.24, z = 4.81, h = 245.08},
        [2] = {x = 995.0, y = -2982.04, z = 4.97, h = 245.08},
        [3] = {x = 968.6, y = -3089.84, z = 4.97, h = 335.76},
        
    },
    max = 3,
}

Config.Farm = {
    MaxRepairs = 8,
    FinishPoint = vector3(410.96, 6467.24, 28.8),
    deliver = vector3(421.84, 6475.12, 28.8),
    locations = {
        [1] = {x = 284.28, y = 6464.96, z = 30.64, h = 72.08},
        [2] = {x = 279.04, y = 6452.72, z = 31.68, h = 245.08},
        [3] = {x = 268.28, y = 6448.72, z = 31.8, h = 23.08},
        [4] = {x = 258.2, y = 6457.44, z = 31.4, h = 54.08},
        [5] = {x = 272.84, y = 6477.2, z = 29.53, h = 98.08},
        [6] = {x = 245.28, y = 6480.24, z = 29.57, h = 132.08},
        [7] = {x = 262.72, y = 6474.24, z = 29.93, h = 123.08},
        [8] = {x = 231.88, y = 6471.32, z = 30.25, h = 347.08}
    }
}

Config.Gan = {
    FinishPoint = vector3(1903.28, 4920.8, 48.76),
    locations = {
        [1] = {x = 2302.88, y = 4943.24, z = 40.41, h = 245.08},
        [2] = {x = 2376.36, y = 5053.32, z = 45.49, h = 245.08},
        [3] = {x = 2158.96, y = 4990.6, z = 40.41, h = 245.08},  
        [4] = {x = 2173.0, y = 4968.44, z = 40.41, h = 245.08}
    },
    max = 3
}