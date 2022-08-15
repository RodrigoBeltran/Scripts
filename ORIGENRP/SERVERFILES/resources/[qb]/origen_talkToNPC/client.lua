QBCore = nil
PlayerData = {}
local pedList = {}
local cam = nil
local name = ''
local waitMore = true
local inMenu = false
local hasEntered = false

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = QBCore.Functions.GetPlayerData()
end)

-- CREATE NPCs

Citizen.CreateThread(function()
	local pedInfo = {}
	local camCoords = nil
	local camRotation = nil

	for k, v in pairs(Config.TalkToNPC) do
		RequestModel(GetHashKey(v.npc))
		while not HasModelLoaded(GetHashKey(v.npc)) do
			Wait(1)
		end

		RequestAnimDict("mini@strip_club@idles@bouncer@base")
		while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
			Wait(1)
		end

		ped = CreatePed(4, v.npc, v.coordinates[1], v.coordinates[2], v.coordinates[3], v.heading, false, true)
		SetEntityHeading(ped, v.heading)
		FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)

		if Config.AutoCamPosition then
			local px, py, pz = table.unpack(GetEntityCoords(ped, true))
			local x, y, z = px + GetEntityForwardX(ped) * 1.2, py + GetEntityForwardY(ped) * 1.2, pz + 0.52

			camCoords = vector3(x, y, z)
		end

		if Config.AutoCamRotation then
			local rx = GetEntityRotation(ped, 2)

			camRotation = rx + vector3(0.0, 0.0, 181)
		end

		pedInfo = {
			name = v.name,
			model = v.npc,
			pedCoords = v.coordinates,
			entity = ped,
			camCoords = camCoords,
			camRotation = camRotation,
		}

		table.insert(pedList, pedInfo)
	end
end)

-- CHECK DISTANCE & JOB

Citizen.CreateThread(function()
	local inZone = false
	local hasSetName = false
	local nearPed = false
	local checkedJob = false
	local hasJob = false
	local npcModel = nil
	local npcName = nil
	local npcKey = 0
	
	while true do
		Citizen.Wait(20)
		local playerCoords = GetEntityCoords(PlayerPedId())
		
		inZone = false
		nearPed = false

		if npcName == nil and npcModel == nil then
			for k,v in pairs(Config.TalkToNPC) do
				local distance = #(vector3(playerCoords.x, playerCoords.y, playerCoords.z) - vector3(v.coordinates[1], v.coordinates[2], v.coordinates[3]))
			
				if v.jobs[1] ~= nil then

					if distance < v.interactionRange + 2 then
						npcName = v.name
						npcModel = v.npc
						npcKey = k
						nearPed = true

					elseif not waitMore and not nearPed then
						waitMore = true
					elseif checkedJob then
						checkedJob = false
					end
				else
					if distance < v.interactionRange + 2 then
						npcName = v.name
						npcModel = v.npc
						npcKey = k
						nearPed = true
						if not inMenu then
							waitMore = false
						end
						
					elseif not waitMore and not nearPed then
						waitMore = true
					end
				end
			end
		else
			v = Config.TalkToNPC[npcKey]
			if v ~= nil then
				local distance = #(vector3(playerCoords.x, playerCoords.y, playerCoords.z) - vector3(v.coordinates[1], v.coordinates[2], v.coordinates[3]))
				local zDistance = playerCoords.z - v.coordinates[3]
				
				if zDistance < 0 then
					zDistance = zDistance * -1
				end
				if zDistance < 2 then
					if v.jobs[1] ~= nil then

						if distance < v.interactionRange + 3 then
							if not checkedJob then
								hasJob = false
								checkedJob = true
								for k2,v2 in pairs(v.jobs) do
									if PlayerData.job.name == v2 then
										hasJob = true
									end
								end
							end
							
							if hasJob then
								if not nearPed then
									nearPed = true
								end
								if not inMenu then
									waitMore = false
								end
								if distance < v.interactionRange then
									if not hasSetName then
										name = v.uiText
										hasSetName = true
									end
									if not inZone then
										inZone = true
									end
									if not Config.UseOkokTextUI and not inMenu then
										QBCore.Functions.Notify('[E] Para hablar con el '..name, 'success')
									end
									if IsControlJustReleased(0, Config.Key) then
										inMenu = true
										waitMore = true
										StartCam(v.coordinates, v.camOffset, v.camRotation, v.npc, v.name)
										if Config.UseOkokTextUI then
											exports['okokTextUI']:Close()
										end
										Citizen.Wait(500)
										if Config.HideMinimap then
											DisplayRadar(false)
										end
										SetNuiFocus(true, true)
										SendNUIMessage({
											action = 'openDialog',
											name = v.name,
											dialog = v.dialog,
											options = v.options,
										})
									end
								elseif hasSetName then
									hasSetName = false
								end
							end
						elseif not waitMore and not nearPed then
							waitMore = true
						elseif checkedJob then
							checkedJob = false
						end
						if distance > v.interactionRange + 2 and npcName ~= nil and npcModel ~= nil then
							npcModel = nil
							npcName = nil
							npcKey = 0
						end
					else
						if distance < v.interactionRange + 3 then
							if not nearPed then
								nearPed = true
							end
							if not inMenu then
								waitMore = false
							end
							if distance < v.interactionRange then
								if not hasSetName then
									name = v.uiText
									hasSetName = true
								end
								if not inZone then
									inZone = true
								end
								if not Config.UseOkokTextUI and not inMenu then
									QBCore.Functions.HelpNotify('[E] Para hablar con el '..name, 'success')
								end
								if IsControlJustReleased(0, Config.Key) then
									inMenu = true
									waitMore = true
									StartCam(v.coordinates, v.camOffset, v.camRotation, v.npc, v.name)
									if Config.UseOkokTextUI then
										exports['okokTextUI']:Close()
									end
									Citizen.Wait(500)
									if Config.HideMinimap then
										DisplayRadar(false)
									end
									SetNuiFocus(true, true)
									SendNUIMessage({
										action = 'openDialog',
										header = v.header,
										name = v.name,
										dialog = v.dialog,
										options = v.options,
									})
								end
							elseif hasSetName then
								hasSetName = false
							end
						elseif not waitMore and not nearPed then
							waitMore = true
						end
						if distance > v.interactionRange + 2 and npcName ~= nil and npcModel ~= nil then
							npcModel = nil
							npcName = nil
							npcKey = 0
						end
					end
				end
			end
		end

		

		if inZone and not hasEntered then
			if Config.UseOkokTextUI then
				exports['okokTextUI']:Open('[E] Para hablar con el '..name, 'darkblue', 'left') 
			end
			hasEntered = true
		elseif not inZone and hasEntered then
			if Config.UseOkokTextUI then
				exports['okokTextUI']:Close()
			end
			hasEntered = false
		end 

		if waitMore then
			Citizen.Wait(1000)
		end
	end
end)

-- ACTIONS

RegisterNUICallback('action', function(data, cb)
	if data.action == 'close' then
		SetNuiFocus(false, false)
		--exports['okokNotify']:Alert("BANK", "Have a nice day.", 5000, 'info')
		QBCore.Functions.Notify("Que tengas un buen dia") -- [text] = message, [type] = primary | error | success, [length] = time till fadeout.
		if Config.HideMinimap then
			DisplayRadar(true)
		end
		hasEntered = true
		if Config.UseOkokTextUI then
			exports['okokTextUI']:Open('[E] Para hablar con el '..name, 'darkblue', 'left') 
		end
		EndCam()
		inMenu = false
		waitMore = false
	elseif data.action == 'option' then
		SetNuiFocus(false, false)
		if Config.HideMinimap then
			DisplayRadar(true)
		end
		hasEntered = true
		if Config.UseOkokTextUI then
			exports['okokTextUI']:Open('[E] Para hablar con el '..name, 'darkblue', 'left') 
		end
		EndCam()
		inMenu = false
		waitMore = false

		if data.options[3] == 'c' then
			TriggerEvent(data.options[2])
		elseif data.options[3] ~= nil then
			TriggerServerEvent(data.options[2])
		end
	end
end)

-- CAMERA

function StartCam(coords, offset, rotation, model, name)
	ClearFocus()

	if Config.AutoCamRotation then
		for k,v in pairs(pedList) do
			if v.pedCoords == coords then
				if v.name == name and v.model == model then
					rotation = v.camRotation
				end
			end
		end
	end

	if Config.AutoCamPosition then
		for k,v in pairs(pedList) do
			if v.pedCoords == coords then
				if v.name == name and v.model == model then
					coords = v.camCoords
				end
			end
		end
	else
		coords = coords + offset
	end

	cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords, rotation, GetGameplayCamFov())

	SetCamActive(cam, true)
	RenderScriptCams(true, true, Config.CameraAnimationTime, true, false)
end

function EndCam()
	ClearFocus()

	RenderScriptCams(false, true, Config.CameraAnimationTime, true, false)
	DestroyCam(cam, false)

	cam = nil
end



-- EVENTS POLICE	
RegisterNetEvent("okokTalk:helpPolice")
AddEventHandler("okokTalk:helpPolice", function()
	ExecuteCommand("entorno ¡Hola! Hay una persona en la recepción de comisaría de Mission Row que le gustaría hablar con un agente")
end)

RegisterNetEvent("okokTalk:vehicleConfiscate")
AddEventHandler("okokTalk:vehicleConfiscate", function()
	QBCore.Functions.Notify("Si un agente te ha confiscado un vehículo, solicita ayuda y un agente vendrá a hablar contigo.")
end)

RegisterNetEvent("okokTalk:vehicleConfiscateDeposito")
AddEventHandler("okokTalk:vehicleConfiscateDeposito", function()
	QBCore.Functions.Notify("Si un agente te ha confiscado un vehículo, ve a la comisaría a recuperarlo.")
end)


RegisterNetEvent("okokTalk:oposPolice")
AddEventHandler("okokTalk:oposPolice", function()
	QBCore.Functions.Notify("¡Cada mes se suelen hacer oposiciones para entrar al SAPD! Revisa la página web del SAPD.")
end)

RegisterNetEvent("okokTalk:reportPolice")
AddEventHandler("okokTalk:reportPolice", function()
	QBCore.Functions.Notify("Si deseas poner una denuncia, espera que llegue un agente y tomará todos los detalles del suceso.")
end)

RegisterNetEvent("okokTalk:marcelo")
AddEventHandler("okokTalk:marcelo", function()
	QBCore.Functions.Notify("Agáchate y conócelo.")
end)


-- EVENTS EMS	
RegisterNetEvent("okokTalk:kitAid")
AddEventHandler("okokTalk:kitAid", function()

	local elements = {}
	
	table.insert(elements, {label = 'Si', value = 'yes'})
	table.insert(elements, {label = 'No', value = 'no'})
	
	QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'buy-kit-aids-1', {
		title    = "Comprar Vendas",
		align    = 'right',
		elements = elements
	}, function(data, menu)
		local v = data.current.value
	
		if v == "yes" then
			TriggerServerEvent('okokTalk:giveBandage')
		else
			QBCore.Functions.Notify("No hay problema. Vuelve cuando quieras.")
		end
	
	end, function(data, menu)
		menu.close()
	end)
end)

RegisterNetEvent("okokTalk:reviveNPC")
AddEventHandler("okokTalk:reviveNPC", function()
	-- evento para revivir
end)

RegisterNetEvent("okokTalk:reportEMS")
AddEventHandler("okokTalk:reportEMS", function()
	ExecuteCommand("auxilio ¡Hola! Hay una persona herida en la recepción del hospital. ¡Rápido, un médico!")
end)

RegisterNetEvent("okokTalk:cita")
AddEventHandler("okokTalk:cita", function()
	QBCore.Functions.Notify("Si deseas pedir una cita, espera que llegue un médico.")
end)

RegisterNetEvent("okokTalk:psicotecnico")
AddEventHandler("okokTalk:psicotecnico", function()
	QBCore.Functions.Notify("Si deseas sacar el psicotécnico, pide una cita con uno de nuestros evaluadores.")
end)







-- EXAMPLE EVENTS CALLED ON CONFIG.LUA

RegisterNetEvent("okokTalk:toilet")
AddEventHandler("okokTalk:toilet", function()
	--exports['okokNotify']:Alert("BANK", "On your right, sir.", 5000, 'info')
	QBCore.Functions.Notify("Que tengas un buen dia")
end)

RegisterNetEvent("okokTalk:rob")
AddEventHandler("okokTalk:rob", function()
	--exports['okokNotify']:Alert("BANK", "Please stop joking, sir.", 5000, 'warning')
	QBCore.Functions.Notify("Que tengas un buen dia")
end)

RegisterNetEvent("okokTalk:safe")
AddEventHandler("okokTalk:safe", function()
	--exports['okokNotify']:Alert("BANK", "You don't have a safe, sir.", 5000, 'error')
	QBCore.Functions.Notify("Que tengas un buen dia")
end)

RegisterNetEvent("okokTalk:card")
AddEventHandler("okokTalk:card", function()
	--QBCore.Functions.Notify("Acude al ayuntamiento y habla con ellos para recuperar tu licencia de conducir.")
end)

RegisterNetEvent("okokTalk:stolenCard")
AddEventHandler("okokTalk:stolenCard", function()
	QBCore.Functions.Notify("Accede a la aplicación del banco, deberás ir a opciones de cuenta y solicitar una nueva tarjeta.")
end)

RegisterNetEvent("okokTalk:openNewAccount")
AddEventHandler("okokTalk:openNewAccount", function()
	QBCore.Functions.Notify("Accede a la aplicación del banco, deberás ir a opciones de cuenta y crear una nueva cuenta bancaria")
end)

RegisterNetEvent("okokTalk:limitCard")
AddEventHandler("okokTalk:limitCard", function()
	QBCore.Functions.Notify("El límite de las tarjetas de crédito está en 2.500$ doláres diarios.")
end)

RegisterNetEvent("okokTalk:closeAccount")
AddEventHandler("okokTalk:closeAccount", function()
	QBCore.Functions.Notify("Accede a la aplicación del banco, deberás ir a cuenta de ahorros y ahí podrás cerrar la cuenta.")
end)

RegisterNetEvent("okokTalk:Savings")
AddEventHandler("okokTalk:Savings", function()
	QBCore.Functions.Notify("Accede a la aplicación del banco y deberás ir a cuenta de ahorros.")
end)

RegisterNetEvent('okokTalk:driverLicense')
AddEventHandler('okokTalk:driverLicense', function()
	QBCore.Functions.Notify("Acude al ayuntamiento y habla con ellos para recuperar tu licencia de conducir.")
end)

RegisterNetEvent("okokTalk:lost")
AddEventHandler("okokTalk:lost", function()
	--exports['okokNotify']:Alert("BANK", "No problem, we'll send a new one to your home.", 5000, 'success')
	QBCore.Functions.Notify("Que tengas un buen dia")
end)

RegisterNetEvent("okokTalk:jennifer")
AddEventHandler("okokTalk:jennifer", function()
	--exports['okokNotify']:Alert("BANK", "Not at the moment, she starts at 1 PM.", 5000, 'info')
	QBCore.Functions.Notify("Que tengas un buen dia")
end)

RegisterNetEvent("okokTalk:Savings")
AddEventHandler("okokTalk:Savings", function()
	QBCore.Functions.Notify("Accede a la aplicación del banco y deberás ir a cuenta de ahorros.")
end)

RegisterNetEvent('okokTalk:Identification')
AddEventHandler('okokTalk:Identification', function()
	QBCore.Functions.Notify("Acude al ayuntamiento y habla con ellos para recuperar tu licencia de conducir.")
end)

RegisterNetEvent('okokTalk:IdentificationAyu')
AddEventHandler('okokTalk:IdentificationAyu', function()
	QBCore.Functions.Notify("Registrate y en el menú te saldrá la opción de obtener tu ID")
end)


RegisterNetEvent("okokTalk:NeedJob")
AddEventHandler("okokTalk:NeedJob", function()
	--exports['okokNotify']:Alert("BANK", "No problem, we'll send a new one to your home.", 5000, 'success')
	TriggerEvent("qb-cityhall:client:openMenu")
end)

RegisterNetEvent("okokTalk:WhatToDo")
AddEventHandler("okokTalk:WhatToDo", function()
	--exports['okokNotify']:Alert("BANK", "Not at the moment, she starts at 1 PM.", 5000, 'info')
	QBCore.Functions.Notify("Búscate un trabajo y cumple tus sueños.")
end)

RegisterNetEvent("okokTalk:WhereIsThePeople")
AddEventHandler("okokTalk:WhereIsThePeople", function()
	--exports['okokNotify']:Alert("BANK", "No problem, we'll send a new one to your home.", 5000, 'success')
	QBCore.Functions.Notify("Según la policía habitualmente la gente se encuentra en el gimnasio. Descúbrelo tu mismo.")
end)

RegisterNetEvent("okokTalk:New")
AddEventHandler("okokTalk:New", function()
	--exports['okokNotify']:Alert("BANK", "Not at the moment, she starts at 1 PM.", 5000, 'info')
	QBCore.Functions.Notify("Búscate un trabajo y cumple tus sueños.")

end)

RegisterNetEvent("okokTalk:AnotherJobHalal")
AddEventHandler("okokTalk:AnotherJobHalal", function()
	QBCore.Functions.Notify("Entra en el sistema informático y cambiate de trabajo seguro que hay algo para tí.")
end)

RegisterNetEvent("okokTalk:goToBed")
AddEventHandler("okokTalk:goToBed", function()
	TriggerEvent('animations:client:EmoteCommandStart', {"notepad"})
		QBCore.Functions.Progressbar("hospital_checkin", "Revisando heridas..", 2000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			local bedId = 4
			if bedId ~= nil then 
				TriggerServerEvent("hospital:server:SendToBed", math.random(1,6), true)
			else
				QBCore.Functions.Notify("Las camillas están ocupadas.", "Error")
			end
		end, function() -- Cancel
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			QBCore.Functions.Notify("¡El registro falló!", "Error")
	end)
end)


RegisterNetEvent("okokTalk:healIlegal")
AddEventHandler("okokTalk:healIlegal", function()
	TriggerEvent('animations:client:EmoteCommandStart', {"notepad"})
		QBCore.Functions.Progressbar("hospital_checkin", "Revisando heridas..", 20000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			TriggerEvent("hospital:client:Revive", GetPlayerServerId(PlayerId()))
		end, function() -- Cancel
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			QBCore.Functions.Notify("¡El registro falló!", "Error")
	end)
end)


