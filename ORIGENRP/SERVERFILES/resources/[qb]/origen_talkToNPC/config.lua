Config = {}

Config.Key = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.AutoCamPosition = true -- If true it'll set the camera position automatically

Config.AutoCamRotation = true -- If true it'll set the camera rotation automatically

Config.HideMinimap = true -- If true it'll hide the minimap when interacting with an NPC

Config.UseOkokTextUI = false -- If true it'll use okokTextUI 

Config.CameraAnimationTime = 1000 -- Camera animation time: 1000 = 1 second

Config.TalkToNPC = {
	-- {
	-- 	npc = 'u_m_y_abner', 										-- BANCO CENTRAL
	-- 	header = 'Empledo del', 								-- Text over the name
	-- 	name = 'Banco Central', 										-- Text under the header
	-- 	uiText = "Empleado del banco",							-- Name shown on the notification when near the NPC
	-- 	dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
	-- 	coordinates = vector3(254.17, 222.8, 105.3), 				-- coordinates of NPC
	-- 	heading = 160.0,											-- Heading of NPC (needs decimals, 0.0 for example)
	-- 	camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
	-- 	camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
	-- 	interactionRange = 2.5, 									-- From how far the player can interact with the NPC
	-- 	options = {													-- Options shown when interacting (Maximum 6 options per NPC)
	-- 		{'Donde esta el baño?', 'okokTalk:toilet', 'c'},		-- 'c' for client
	-- 		{'Puedo robar el banco?', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
	-- 		{"Quiero acceder a mi caja fuerte.", 'okokTalk:safe', 'c'}, 
	-- 		{"Quiero hacer una nueva tarjeta de crédito.", 'okokTalk:card', 'c'}, 
	-- 		{"Perdí mi tarjeta de crédito.", 'okokTalk:lost', 'c'}, 
	-- 		{"Jennifer esta trabajando?", 'okokTalk:jennifer', 'c'}, 
	-- 	},
	-- 	jobs = {													-- Jobs that can interact with the NPC
			
	-- 	},
	-- },

	-- {
	-- 	npc = 'a_m_y_acult_02', 										-- ELECTRICISTA
	-- 	header = 'Jefe de', 								-- Text over the name
	-- 	name = 'Electricistas', 										-- Text under the header
	-- 	uiText = "electricista",							-- Name shown on the notification when near the NPC
	-- 	dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
	-- 	coordinates = vector3(-330.01, -1074.41, 22.03), 				-- coordinates of NPC
	-- 	heading = 160.0,											-- Heading of NPC (needs decimals, 0.0 for example)
	-- 	camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
	-- 	camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
	-- 	interactionRange = 2.5, 									-- From how far the player can interact with the NPC
	-- 	options = {													-- Options shown when interacting (Maximum 6 options per NPC)
	-- 		{'Quiero empezar a trabajar!', 'okokTalk:toilet', 'c'},		-- 'c' for client
	-- 		{'Como acabo el trabajo?', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
	-- 		{"Cuanto me vas a pagar?", 'okokTalk:safe', 'c'}, 
	-- 		{"Me puedo quedar la furgo?", 'okokTalk:card', 'c'}, 
	-- 		{"Que te den viejo", 'okokTalk:lost', 'c'}, 
	-- 		{"Queres flan chiquita?", 'okokTalk:jennifer', 'c'}, 
	-- 	},
	-- 	jobs = {													-- Jobs that can interact with the NPC
			
	-- 	},
	-- },
	{
		npc = 'g_m_m_chicold_01', 										-- MISIONES SECRETAS
		header = 'MR.', 								-- Text over the name
		name = 'Gachalee', 										-- Text under the header
		uiText = "Gachalee",							-- Name shown on the notification when near the NPC
		dialog = 'Esto te costara 2000$',						-- Text showm on the message bubble 
		coordinates = vector3(262.98, 2592.54, 43.94), 				-- coordinates of NPC
		heading = 160.0,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Robo a la furgoneta', 'av_deliveries:getJobs_c', 'c'},		-- 'c' for client
			{'Robo al kuruma', 'av_deliveries:getJobs_c', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Robo al chatarrero", 'av_deliveries:getJobs_c', 'c'}, 
			{"Robo al aerodromo", 'av_deliveries:getJobs_c', 'c'}, 
			{"Robo al camion", 'av_deliveries:getJobs_c', 'c'}, 
			{"Robo al aeropuerto", 'av_deliveries:getJobs_c', 'c'}, 
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 's_m_m_doctor_01', 										-- EMS CIUDAD
		header = 'MR.', 								-- Text over the name
		name = 'Danitpm', 										-- Text under the header
		uiText = "Danitpm",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(308.38, -595.37, 42.28), 				-- coordinates of NPC
		heading = 67.52,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Comprar vendas', 'okokTalk:kitAid', 'c'},		-- 'c' for client
			{'Necesito asistencia', 'okokTalk:goToBed', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Un medico!", 'okokTalk:reportEMS', 'c'}, 
			{"Quiero pedir una cita", 'okokTalk:cita', 'c'}, 
			{"Sacar psicotecnico", 'okokTalk:psicotecnico', 'c'}, 
			{"Conoces al abogado?", 'okokTalk:jennifer', 'c'}, 
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},


	{
		npc = 'mp_m_meth_01', 										-- MEDICO ILEGALISIMO
		header = 'MR.', 								-- Text over the name
		name = 'Doctor sin licencia', 										-- Text under the header
		uiText = "Doctor sin licencia",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(157.93, -2203.42, 3.69), 				-- coordinates of NPC
		heading = 83.25,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Cúrame porfavor', 'okokTalk:healIlegal', 'c'},		-- 'c' for client
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 's_m_y_cop_01', 										-- LSPD
		header = 'MR.', 								-- Text over the name
		name = 'Johnny', 										-- Text under the header
		uiText = "Johnny",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(442.20, -978.53, 29.69), 				-- coordinates of NPC
		heading = 116.62,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Tengo el vehiculo confiscado', 'okokTalk:vehicleConfiscate', 'c'},		-- 'c' for client
			{'Necesito ayuda', 'okokTalk:helpPolice', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Oposiciones policia!", 'okokTalk:oposPolice', 'c'}, 
			{"Recuperar licencia de conducir", 'okokTalk:driverLicense', 'c'}, 
			{"Quieres poner una denuncia?", 'okokTalk:reportPolice', 'c'}, 
			{"Conoces a marcelo?", 'okokTalk:marcelo', 'c'}, 
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 'ig_fbisuit_01', 										-- BANCO GC
		header = 'MR.', 								-- Text over the name
		name = 'Guillermo', 										-- Text under the header
		uiText = "Guillermo",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(148.04, -1041.63, 28.37), 				-- coordinates of NPC
		heading = 339.84,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Gestionar mi cuenta', 'qb-banking:openBankScreen', 'c'},		-- 'c' for client
			{'Me han robado la tarjeta', 'okokTalk:stolenCard', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Abrir una cuenta nueva!", 'okokTalk:openNewAccount', 'c'}, 
			{"Limite diario", 'okokTalk:limitCard', 'c'}, 
			{"Cerrar una cuenta", 'okokTalk:closeAccount', 'c'}, 
			{"Plan de ahorro", 'okokTalk:Savings', 'c'}, 
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},
	{
		npc = 'ig_fbisuit_01', 										-- BANCO 
		header = 'MR.', 								-- Text over the name
		name = 'Guillermo', 										-- Text under the header
		uiText = "Guillermo",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(321.41, -279.92, 54.16), 				-- coordinates of NPC
		heading = 336.69,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Gestionar mi cuenta', 'qb-banking:openBankScreen', 'c'},		-- 'c' for client
			{'Me han robado la tarjeta', 'okokTalk:stolenCard', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Abrir una cuenta nueva!", 'okokTalk:openNewAccount', 'c'}, 
			{"Limite diario", 'okokTalk:limitCard', 'c'}, 
			{"Cerrar una cuenta", 'okokTalk:closeAccount', 'c'}, 
			{"Plan de ahorro", 'okokTalk:Savings', 'c'}, 
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},
	{
		npc = 'player_zero', 										-- AYUNTAMIENTO
		header = 'El', 								-- Text over the name
		name = 'Fundador', 										-- Text under the header
		uiText = "Fundador",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(-545.02, -204.18, 37.22), 				-- coordinates of NPC
		heading = 203.22,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Necesito mi identificacion', 'okokTalk:IdentificationAyu', 'c'},		-- 'c' for client
			{'Acceder al sistema del ayuntamiento', 'okokTalk:NeedJob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Que puedo hacer?", 'okokTalk:WhatToDo', 'c'}, 
			{"Donde se encuentra la gente?", 'okokTalk:WhereIsThePeople', 'c'}, 
			{"He llegado a la ciudad hoy", 'okokTalk:New', 'c'}, 
			{"Quiero otro trabajo", 'okokTalk:AnotherJobHalal', 'c'}, 
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	-- {
	-- 	npc = 'cs_maryann', 										-- GYM
	-- 	header = 'Lucia', 								-- Text over the name
	-- 	name = 'La Roca', 										-- Text under the header
	-- 	uiText = "Lucia",							-- Name shown on the notification when near the NPC
	-- 	dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
	-- 	coordinates = vector3(-1244.01, -1537.64, 3.3), 				-- coordinates of NPC
	-- 	heading = 250.10,											-- Heading of NPC (needs decimals, 0.0 for example)
	-- 	camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
	-- 	camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
	-- 	interactionRange = 2.5, 									-- From how far the player can interact with the NPC
	-- 	options = {													-- Options shown when interacting (Maximum 6 options per NPC)
	-- 		{'Quiero una bicicleta', 'okokTalk:toilet', 'c'},		-- 'c' for client
	-- 		{'Como hago gym', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
	-- 		{"Tarjeta del GYM", 'okokTalk:safe', 'c'}, 
	-- 		{"Necesito proteinas", 'okokTalk:card', 'c'}, 
	-- 		{"Que ejercicios puedo hacer?", 'okokTalk:lost', 'c'}, 
	-- 		{"Como quitar el estres", 'okokTalk:jennifer', 'c'}, 
	-- 	},
	-- 	jobs = {													-- Jobs that can interact with the NPC
			
	-- 	},
	-- },


	{
		npc = 'a_m_m_prolhost_01', 										-- APARTAMENTO 1
		header = 'Mr.', 								-- Text over the name
		name = 'Breixo', 										-- Text under the header
		uiText = "Breixo",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(-686.2, -1103.47, 13.53), 				-- coordinates of NPC
		heading = 211.77,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Hola! Acabo de llegar', 'okokTalk:toilet', 'c'},		-- 'c' for client
			{'Donde busco trabajo', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Necesito un bicicleta", 'okokTalk:safe', 'c'}, 
			{"Necesito un taxi", 'okokTalk:card', 'c'}, 
			{"Donde compro un auto?", 'okokTalk:lost', 'c'}, 
			{"Necesito DNI", 'okokTalk:jennifer', 'c'}, 
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 'a_m_m_prolhost_01', 										-- APARTAMENTO 2 
		header = 'Mr.', 								-- Text over the name
		name = 'Breixo', 										-- Text under the header
		uiText = "Breixo",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(-1282.29, -426.28, 33.73), 				-- coordinates of NPC
		heading = 122.6,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Hola! Acabo de llegar', 'okokTalk:toilet', 'c'},		-- 'c' for client
			{'Donde busco trabajo', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Necesito un bicicleta", 'okokTalk:safe', 'c'}, 
			{"Necesito un taxi", 'okokTalk:card', 'c'}, 
			{"Donde compro un auto?", 'okokTalk:lost', 'c'}, 
			{"Necesito DNI", 'okokTalk:jennifer', 'c'}, 
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 'a_m_m_prolhost_01', 										-- APARTAMENTO 3
		header = 'Mr.', 								-- Text over the name
		name = 'Breixo', 										-- Text under the header
		uiText = "Breixo",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(292.14, -1084.42, 28.4), 				-- coordinates of NPC
		heading = 261.50,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Hola! Acabo de llegar', 'okokTalk:toilet', 'c'},		-- 'c' for client
			{'Donde busco trabajo', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Necesito un bicicleta", 'okokTalk:safe', 'c'}, 
			{"Necesito un taxi", 'okokTalk:card', 'c'}, 
			{"Donde compro un auto?", 'okokTalk:lost', 'c'}, 
			{"Necesito DNI", 'okokTalk:jennifer', 'c'}, 
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 'a_m_m_prolhost_01', 										-- APARTAMENTO 4
		header = 'Mr.', 								-- Text over the name
		name = 'Breixo', 										-- Text under the header
		uiText = "Breixo",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(264.91, -640.18, 41.02), 				-- coordinates of NPC
		heading = 240.79,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Hola! Acabo de llegar', 'okokTalk:toilet', 'c'},		-- 'c' for client
			{'Donde busco trabajo', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Necesito un bicicleta", 'okokTalk:safe', 'c'}, 
			{"Necesito un taxi", 'okokTalk:card', 'c'}, 
			{"Donde compro un auto?", 'okokTalk:lost', 'c'}, 
			{"Necesito DNI", 'okokTalk:jennifer', 'c'}, 
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 'a_m_m_prolhost_01', 										-- APARTAMENTO 5
		header = 'Mr.', 								-- Text over the name
		name = 'Breixo', 										-- Text under the header
		uiText = "Breixo",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(-610.29, 43.29, 42.59), 				-- coordinates of NPC
		heading = 86.69,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Hola! Acabo de llegar', 'okokTalk:toilet', 'c'},		-- 'c' for client
			{'Donde busco trabajo', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Necesito un bicicleta", 'okokTalk:safe', 'c'}, 
			{"Necesito un taxi", 'okokTalk:card', 'c'}, 
			{"Donde compro un auto?", 'okokTalk:lost', 'c'}, 
			{"Necesito DNI", 'okokTalk:jennifer', 'c'}, 
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	-- {
	-- 	npc = 's_m_m_doctor_01', 										-- EMS PALETO
	-- 	header = 'MR.', 								-- Text over the name
	-- 	name = 'Danitpm', 										-- Text under the header
	-- 	uiText = "Danitpm",							-- Name shown on the notification when near the NPC
	-- 	dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
	-- 	coordinates = vector3(-248.31, 6331.98, 31.43), 				-- coordinates of NPC
	-- 	heading = 213.2,											-- Heading of NPC (needs decimals, 0.0 for example)
	-- 	camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
	-- 	camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
	-- 	interactionRange = 2.5, 									-- From how far the player can interact with the NPC
	-- 	options = {													-- Options shown when interacting (Maximum 6 options per NPC)
	-- 		{'Comprar vendas', 'okokTalk:toilet', 'c'},		-- 'c' for client
	-- 		{'Necesito asistencia', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
	-- 		{"Un medico!", 'okokTalk:safe', 'c'}, 
	-- 		{"Quiero pedir una cita", 'okokTalk:card', 'c'}, 
	-- 		{"Sacar psicotecnico", 'okokTalk:lost', 'c'}, 
	-- 		{"Conoces al abogado?", 'okokTalk:jennifer', 'c'}, 
	-- 	},
	-- 	jobs = {													-- Jobs that can interact with the NPC
			
	-- 	},
	-- },
	{
		npc = 's_m_y_cop_01', 										-- DEPOSITO
		header = 'MR.', 								-- Text over the name
		name = 'Evaristo', 										-- Text under the header
		uiText = "Policia",							-- Name shown on the notification when near the NPC
		dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
		coordinates = vector3(408.98, -1622.83, 28.29), 				-- coordinates of NPC
		heading = 220.98,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Tengo el vehiculo confiscado', 'okokTalk:vehicleConfiscateDeposito', 'c'},		-- 'c' for client
			{'Necesito ayuda', 'okokTalk:helpPolice', 'c'},		-- 's' for server (if you write something else it'll be server by default)
			{"Necesito recuperar mi vehículo!", 'qb-garages:DepositList', 'c'}, 
			{"Recuperar licencia de conducir", 'okokTalk:driverLicense', 'c'}, 
			{"Quieres poner una denuncia?", 'okokTalk:reportPolice', 'c'}, 
			{"Conoces a marcelo?", 'okokTalk:marcelo', 'c'},  
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	-- {
	-- 	npc = 'cs_solomon', 										-- CONCESIONARIO
	-- 	header = 'MR.', 								-- Text over the name
	-- 	name = 'Briatore', 										-- Text under the header
	-- 	uiText = "dependiente",							-- Name shown on the notification when near the NPC
	-- 	dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
	-- 	coordinates = vector3(-56.83, -1098.7, 25.42), 				-- coordinates of NPC
	-- 	heading = 21.89,											-- Heading of NPC (needs decimals, 0.0 for example)
	-- 	camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
	-- 	camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
	-- 	interactionRange = 2.5, 									-- From how far the player can interact with the NPC
	-- 	options = {													-- Options shown when interacting (Maximum 6 options per NPC)
	-- 		{'Quiero un vehiculo', 'okokTalk:toilet', 'c'},		-- 'c' for client
	-- 		{'Necesito ayuda', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
	-- 		{"Quiero vender mi automovil", 'okokTalk:safe', 'c'}, 
	-- 		{"Haceis descuento?", 'okokTalk:card', 'c'}, 
	-- 		{"Donde ver el catalogo", 'okokTalk:lost', 'c'}, 
	-- 		{"Necesito algo mas barato", 'okokTalk:jennifer', 'c'}, 
	-- 	},
	-- 	jobs = {													-- Jobs that can interact with the NPC
			
	-- 	},
	-- },

	-- {
	-- 	npc = 'cs_solomon', 										-- COMPRAVENTA
	-- 	header = 'MR.', 								-- Text over the name
	-- 	name = 'Juanma', 										-- Text under the header
	-- 	uiText = "dependiente",							-- Name shown on the notification when near the NPC
	-- 	dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
	-- 	coordinates = vector3(1230.14, 2727.3, 37.0), 				-- coordinates of NPC
	-- 	heading = 175.09,											-- Heading of NPC (needs decimals, 0.0 for example)
	-- 	camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
	-- 	camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
	-- 	interactionRange = 2.5, 									-- From how far the player can interact with the NPC
	-- 	options = {													-- Options shown when interacting (Maximum 6 options per NPC)
	-- 		{'Quiero un vehiculo', 'okokTalk:toilet', 'c'},		-- 'c' for client
	-- 		{'Necesito ayuda', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
	-- 		{"Quiero vender mi automovil", 'okokTalk:safe', 'c'}, 
	-- 		{"Haceis descuento?", 'okokTalk:card', 'c'}, 
	-- 		{"Donde ver el catalogo", 'okokTalk:lost', 'c'}, 
	-- 		{"Necesito algo mas barato", 'okokTalk:jennifer', 'c'}, 
	-- 	},
	-- 	jobs = {													-- Jobs that can interact with the NPC
			
	-- 	},
	-- },


	-- {
	-- 	npc = 'mp_m_weapexp_01', 										-- ARMERIA GC
	-- 	header = 'MR.', 								-- Text over the name
	-- 	name = 'FixFive', 										-- Text under the header
	-- 	uiText = "dependiente",							-- Name shown on the notification when near the NPC
	-- 	dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
	-- 	coordinates = vector3(20.66, -1104.85, 28.8), 				-- coordinates of NPC
	-- 	heading = 155.53,											-- Heading of NPC (needs decimals, 0.0 for example)
	-- 	camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
	-- 	camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
	-- 	interactionRange = 2.5, 									-- From how far the player can interact with the NPC
	-- 	options = {													-- Options shown when interacting (Maximum 6 options per NPC)
	-- 		{'Necesito un arma', 'okokTalk:toilet', 'c'},		-- 'c' for client
	-- 		{'Donde consigo mi licencia', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
	-- 		{"Teneis pistolas?", 'okokTalk:safe', 'c'}, 
	-- 		{"Puedo usar el campo de tiro?", 'okokTalk:card', 'c'}, 
	-- 		{"Vendeis chalecos?", 'okokTalk:lost', 'c'}, 
	-- 		{"Como se el numero de serie", 'okokTalk:jennifer', 'c'}, 
	-- 	},
	-- 	jobs = {													-- Jobs that can interact with the NPC
			
	-- 	},
	-- },

	-- {
	-- 	npc = 'cs_solomon', 										-- CONCESIONARIO
	-- 	header = 'MR.', 								-- Text over the name
	-- 	name = 'VIP', 										-- Text under the header
	-- 	uiText = "dependiente",							-- Name shown on the notification when near the NPC
	-- 	dialog = 'En que puedo ayudarte?',						-- Text showm on the message bubble 
	-- 	coordinates = vector3(-781.77, -211.58, 36.15), 				-- coordinates of NPC
	-- 	heading = 113.84,											-- Heading of NPC (needs decimals, 0.0 for example)
	-- 	camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
	-- 	camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
	-- 	interactionRange = 2.5, 									-- From how far the player can interact with the NPC
	-- 	options = {													-- Options shown when interacting (Maximum 6 options per NPC)
	-- 		{'Quiero un vehiculo', 'okokTalk:toilet', 'c'},		-- 'c' for client
	-- 		{'Necesito ayuda', 'okokTalk:rob', 'c'},		-- 's' for server (if you write something else it'll be server by default)
	-- 		{"Donde consigo Coins", 'okokTalk:safe', 'c'}, 
	-- 		{"Cuanto vale cada vehiculo?", 'okokTalk:card', 'c'}, 
	-- 		{"Donde ver el catalogo", 'okokTalk:lost', 'c'}, 
	-- 		{"Necesito algo mas barato", 'okokTalk:jennifer', 'c'}, 
	-- 	},
	-- 	jobs = {													-- Jobs that can interact with the NPC
			
	-- 	},
	-- },

	--[[
	--[[
	-- This is the template to create new NPCs
	{
		npc = "",
		header = "",
		name = "",
		uiText = "",
		dialog = "",
		coordinates = vector3(0.0, 0.0, 0.0),
		heading = 0.0,
		camOffset = vector3(0.0, 0.0, 0.0),
		camRotation = vector3(0.0, 0.0, 0.0),
		interactionRange = 0,
		options = {
			{"", 'client:event', 'c'},
			{"", 'client:event', 'c'},
			{"", 'client:event', 'c'}, 
			{"", 'server:event', 's'}, 
			{"", 'server:event', 's'}, 
			{"", 'server:event', 's'}, 
		},
		jobs = {	-- Example jobs
			'police',
			'ambulance',
		},
	},
	]]--
}