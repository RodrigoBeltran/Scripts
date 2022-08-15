local charPed = nil
local currentTattoos = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if NetworkIsSessionStarted() then
			TriggerEvent('qb-multicharacter:client:chooseChar')
            --TriggerEvent("origen_loading:client:loadedEv")
            local activo = true
			return
		end
	end
end)


-- Config = {
--     PedCoords = vector4(-813.97, 176.22, 76.74, -7.5), 
--     HiddenCoords = vector4(-812.23, 182.54, 76.74, 156.5), 
--     CamCoords = vector4(-814.02, 179.56, 76.74, 198.5), 
-- }
Config = {
    PedCoords = vector4(837.84, 5754.85, 290.46, 358.73), 
    HiddenCoords = vector4(842.47, 5760.94, 290.46, 176.28), 
    CamCoords = vector4(837.88, 5759.79, 290.46, 182.03), 
}

--- CODE

local choosingCharacter = false
local cam = nil

function openCharMenu(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        toggle = bool,
    })
    choosingCharacter = bool
    skyCam(bool)
end

RegisterNUICallback('closeUI', function()
    openCharMenu(false)
end)

RegisterNUICallback('disconnectButton', function()
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
    TriggerServerEvent('qb-multicharacter:server:disconnect')
end)

RegisterNUICallback('selectCharacter', function(data)
    local cData = data.cData
    DoScreenFadeOut(10)
    TriggerServerEvent('qb-multicharacter:server:loadUserData', cData)
    openCharMenu(false)
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
end)

RegisterNetEvent('qb-multicharacter:client:closeNUI')
AddEventHandler('qb-multicharacter:client:closeNUI', function()
    SetNuiFocus(false, false)
end)

local Countdown = 1

RegisterNetEvent('qb-multicharacter:client:chooseChar')
AddEventHandler('qb-multicharacter:client:chooseChar', function()
    SetNuiFocus(false, false)
    DoScreenFadeOut(500)
    Citizen.Wait(1000)

    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    SetEntityCoords(PlayerPedId(), Config.HiddenCoords.x, Config.HiddenCoords.y, Config.HiddenCoords.z)
    FreezeEntityPosition(PlayerPedId(), true)
    Citizen.Wait(1500)
    openCharMenu(true)
    TriggerEvent("origen_loading:client:loadedEv")
    --ShutdownLoadingScreenNui()
end)

function selectChar()
    openCharMenu(true)
end

RegisterNUICallback('cDataPed', function(data)
    local cData = data.cData  
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)

    if cData ~= nil then
        QBCore.Functions.TriggerCallback('qb-multicharacter:server:getSkin', function(model, data, tattooList)
            model = model ~= nil and tonumber(model) or false
            if model ~= nil then
                Citizen.CreateThread(function()
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Citizen.Wait(0)
                    end
                    charPed = CreatePed(2, model, Config.PedCoords.x, Config.PedCoords.y, Config.PedCoords.z - 0.98, Config.PedCoords.w, false, true)
                    SetPedComponentVariation(charPed, 0, 0, 0, 2)
                    FreezeEntityPosition(charPed, false)
                    SetEntityInvincible(charPed, true)
                    PlaceObjectOnGroundProperly(charPed)
                    SetBlockingOfNonTemporaryEvents(charPed, true)
                    data = json.decode(data)
                    TriggerEvent('qb-clothing:client:loadPlayerClothing', data, charPed)

                    if tattooList then
                        ClearPedDecorations(charPed)
                        for k, v in pairs(tattooList) do
                            if v.Count ~= nil then
                                for i = 1, v.Count do
                                    SetPedDecoration(charPed, v.collection, v.nameHash)
                                end
                            else
                                SetPedDecoration(charPed, v.collection, v.nameHash)
                            end
                        end
                        currentTattoos = tattooList
                    end
                end)
            else
                Citizen.CreateThread(function()
                    local randommodels = {
                        "mp_m_freemode_01",
                        "mp_f_freemode_01",
                    }
                    local model = GetHashKey(randommodels[math.random(1, #randommodels)])
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Citizen.Wait(0)
                    end
                    charPed = CreatePed(2, model, Config.PedCoords.x, Config.PedCoords.y, Config.PedCoords.z - 0.98, Config.PedCoords.w, false, true)
                    SetPedComponentVariation(charPed, 0, 0, 0, 2)
                    FreezeEntityPosition(charPed, false)
                    SetEntityInvincible(charPed, true)
                    PlaceObjectOnGroundProperly(charPed)
                    SetBlockingOfNonTemporaryEvents(charPed, true)
                end)
            end
            Citizen.Wait(850)
            TaskStartScenarioInPlace(charPed, "WORLD_HUMAN_GUARD_STAND", 0, true)
        end, cData.citizenid)
    else
        Citizen.CreateThread(function()
            local randommodels = {
                "mp_m_freemode_01",
                "mp_f_freemode_01",
            }
            local model = GetHashKey(randommodels[math.random(1, #randommodels)])
            RequestModel(model)
            while not HasModelLoaded(model) do
                Citizen.Wait(0)
            end
            charPed = CreatePed(2, model, Config.PedCoords.x, Config.PedCoords.y, Config.PedCoords.z - 0.98, Config.PedCoords.w, false, true)
            SetPedComponentVariation(charPed, 0, 0, 0, 2)
            FreezeEntityPosition(charPed, false)
            SetEntityInvincible(charPed, true)
            PlaceObjectOnGroundProperly(charPed)
            SetBlockingOfNonTemporaryEvents(charPed, true)
            Citizen.Wait(850)
            TaskStartScenarioInPlace(charPed, "WORLD_HUMAN_GUARD_STAND", 0, true)
        end)
    end
end)

RegisterNUICallback('unlockSlot', function(data, cb)
    QBCore.Functions.TriggerCallback("qb-multicharacter:unlockNewSlot", function(coins)
        if coins == -1 then
            cb({false, coins})
        elseif coins >= 0 then
            cb({true, coins})
        end
    end)
end)

RegisterNUICallback('setupCharacters', function()
    QBCore.Functions.TriggerCallback("test:yeet", function(result)
        SendNUIMessage({
            action = "setupCharacters",
            characters = result
        })
    end)
    QBCore.Functions.TriggerCallback("test:getCountPlayers", function(count, totalPlayersCount)
        SendNUIMessage({
            action = "setCountPlayers",
            count = count..' Jugadores'
        })
        SendNUIMessage({
            action = "setCountPlayersGlobal",
            countGlobal = totalPlayersCount..' Jugadores'
        })
    end)
end)

RegisterNUICallback('removeBlur', function()
    SetTimecycleModifier('default')
end)

RegisterNUICallback('createNewCharacter', function(data)
    local cData = data
    DoScreenFadeOut(150)
    if cData.gender == "Male" then
        cData.gender = 0
    elseif cData.gender == "Female" then
        cData.gender = 1
    end

    TriggerServerEvent('qb-multicharacter:server:createCharacter', cData)
    TriggerServerEvent('qb-multicharacter:server:GiveStarterItems')
    Citizen.Wait(500)
end)

-- RegisterNUICallback('removeCharacter', function(data)
--     TriggerServerEvent('qb-multicharacter:server:deleteCharacter', data.citizenid)
--     TriggerEvent('qb-multicharacter:client:chooseChar')
-- end)

function skyCam(bool)
    SetRainLevel(0.0)
    TriggerEvent('qb-weathersync:client:DisableSync')
    SetWeatherTypePersist('EXTRASUNNY')
    SetWeatherTypeNow('EXTRASUNNY')
    SetWeatherTypeNowPersist('EXTRASUNNY')
    NetworkOverrideClockTime(1, 0, 0)

    if bool then
        DoScreenFadeIn(1000)
        SetTimecycleModifier('hud_def_blur')
        SetTimecycleModifierStrength(1.0)
        FreezeEntityPosition(PlayerPedId(), false)
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 837.92, 5757.17, 290.46, 0.0 ,0.0, 175.55, 60.00, false, 0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 1, true, true)
    else
        SetTimecycleModifier('default')
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        RenderScriptCams(false, false, 1, true, true)
        FreezeEntityPosition(PlayerPedId(), false)
    end
end


RegisterNetEvent('qb-multicharacter:client:stopMusic')
AddEventHandler('qb-multicharacter:client:stopMusic', function()
    SendNUIMessage({
        action = "stopMusic"
    })
end)

RegisterNUICallback('recieveEvents', function(data, cb)
    local data = {}
    QBCore.Functions.TriggerCallback('origen_multicharacter:recieveEvents', function(results)
        for k, v in pairs(results) do

            table.insert(data,{
                id = v.id,
                title = v.title,
                description = v.description
            })

        end
        cb(data)
    end)
end)