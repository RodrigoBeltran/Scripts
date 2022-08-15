MenuHidden = true

function DrawText3D(x, y, z, text)
    QBCore.Functions.HelpNotify(text)
end

-- function spawnNPC()
-- 	local model = 's_m_m_doctor_01'
--     local modelHash = GetHashKey(model)
-- 	RequestModel(modelHash)

--     while not HasModelLoaded(modelHash) do
--         Citizen.Wait(1)
--     end

-- 	local ped = CreatePed(4, GetHashKey(model), 309.64, -593.79, 42.28, 24.06, false, true)

-- 	FreezeEntityPosition(ped, true)
-- 	SetEntityInvincible(ped, true)
-- 	SetModelAsNoLongerNeeded(GetHashKey(model))
-- 	SetBlockingOfNonTemporaryEvents(ped, true)
-- end

local currentGarage = 1
Citizen.CreateThread(function()
    -- spawnNPC()
    while true do
        if isLoggedIn and QBCore ~= nil then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local wait = 1200
            if PlayerJob.name =="ambulance" then
                -- for k, v in pairs(Config.Locations["duty"]) do
                --     local dist = #(pos - vector3(v.x, v.y, v.z))
                --     if dist < 5 then
                --         wait = 0
                --         DrawMarker(20, vector3(v.x, v.y, v.z), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.2, 0.2, 10, 10, 10, 100, false, true, 2, true, false, false, false)
                --         if dist < 1.5 then
                --             if onDuty then
                --                 DrawText3D(v.x, v.y, v.z, "E - Salir del servicio")
                --             else
                --                 DrawText3D(v.x, v.y, v.z, "E - Entrar del servicio")
                --             end
                --             if IsControlJustReleased(0, 38) then
                --                 onDuty = not onDuty
                --                 TriggerServerEvent("QBCore:ToggleDuty")
                --                 TriggerServerEvent("police:server:UpdateBlips")
                --             end
                --         end  
                --     end
                -- end

                for k, v in pairs(Config.Locations["armory-shop"]) do
                    local dist = #(pos - vector3(v.x, v.y, v.z))
                    if dist < 4.5 then
                        wait = 0
                        if onDuty then
                            wait = 0
                            DrawMarker(20, vector3(v.x, v.y, v.z), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.2, 0.2, 10, 10, 10, 100, false, true, 2, true, false, false, false)
                            if dist < 1.5 then
                                DrawText3D(v.x, v.y, v.z, "E - Armario médico")
                                if IsControlJustReleased(0, 38) then
                                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "hospital", Config.Items)
                                end
                            end  
                        end
                    end
                end
               
        
                for k, v in pairs(Config.Locations["vehicle"]) do
                    local dist = #(pos - vector3(v.x, v.y, v.z))
                    if dist < 4.5 and onDuty then-- DrawMa
                        wait = 0
                       
                        DrawMarker(20, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 10, 10, 10, 222, false, false, false, true, false, false, false)
                        if dist < 1.5 then
                            if IsPedInAnyVehicle(ped, false) then
                                DrawText3D(v.x, v.y, v.z, "E - Garaje")
                            end
                            if IsControlJustReleased(0, 38) then
                                if IsPedInAnyVehicle(ped, false) then
                                    QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
                                else
                                    MenuGarage()
                                    currentGarage = k
                                    MenuHidden = not MenuHidden
                                end
                            end
                        end
                    end
                end
        
                for k, v in pairs(Config.Locations["helicopter"]) do
                    local dist = #(pos - vector3(v.x, v.y, v.z))
                    if dist < 7.5 then
                        if onDuty then
                            wait = 0
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if dist < 1.5 then
                                if IsPedInAnyVehicle(ped, false) then
                                    DrawText3D(v.x, v.y, v.z, "E - Tienda de Helicopteros")
                                end
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(ped, false) then
                                        QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
                                    else
                                        local coords = Config.Locations["helicopter"][k]
                                        QBCore.Functions.SpawnVehicle(Config.Helicopter, function(veh)
                                            SetVehicleNumberPlateText(veh, "LIFE"..tostring(math.random(1000, 9999)))
                                            SetEntityHeading(veh, coords.w)
                                            exports['LegacyFuel']:SetFuel(veh, 100.0)
                                            TaskWarpPedIntoVehicle(ped, veh, -1)
                                            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                            SetVehicleEngineOn(veh, true, true)
                                        end, coords, true)
                                    end
                                end
                            end  
                        end
                    end
                end
            end

            local currentHospital = 1

            for k, v in pairs(Config.Locations["main"]) do
                local dist = #(pos - vector3(v.x, v.y, v.z))
                if dist < 1.5 then
                    wait = 0
                    DrawText3D(v.x, v.y, v.z, "E - Subir ascensor")
                    if IsControlJustReleased(0, 38) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["roof"][currentHospital]
                        SetEntityCoords(ped, coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(ped, coords.w)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            local currentParking = 1

            for k, v in pairs(Config.Locations["hall"]) do
                local dist = #(pos - vector3(v.x, v.y, v.z))
                if dist < 1.5 then
                    wait = 0
                    DrawText3D(v.x, v.y, v.z, "E - Bajar ascensor")
                    if IsControlJustReleased(0, 38) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentParking = k

                        local coords = Config.Locations["parking"][currentParking]
                        SetEntityCoords(ped, coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(ped, coords.w)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            for k, v in pairs(Config.Locations["cloackroom"]) do
                local dist = #(pos - vector3(v.x, v.y, v.z))
                if dist < 5.0 then
                    wait = 0
                    DrawMarker(20, vector3(v.x, v.y, v.z), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.2, 0.2, 10, 10, 10, 100, false, true, 2, true, false, false, false)
                end
                if dist < 1.5 then
                    DrawText3D(v.x, v.y, v.z, "E - Acceder al Vestuario")
                    if IsControlJustReleased(0, 38) then
                        SetEntityHeading(PlayerPedId(), 248.58)
                        Wait(500)
                        TriggerEvent('qb-clothing:client:openOutfitMenu') 
                    end
                end
            end

            for k, v in pairs(Config.Locations["buyClothes"]) do
                local dist = #(pos - vector3(v.x, v.y, v.z))
                if dist < 5.0 then
                    wait = 0
                    DrawMarker(20, vector3(v.x, v.y, v.z), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.2, 0.2, 10, 10, 10, 100, false, true, 2, true, false, false, false)
                end
                if dist < 1.5 then
                    DrawText3D(v.x, v.y, v.z, "E - Cambiarse de ropa")
                    if IsControlJustReleased(0, 38) then
                        SetEntityHeading(PlayerPedId(), 66.43)
                        Wait(500)
                        TriggerEvent('qb-clothing:client:openPoliceMenu')
                    end
                end
            end

            for k, v in pairs(Config.Locations["roof"]) do
                local dist = #(pos - vector3(v.x, v.y, v.z))
                if dist < 5.0 then
                    wait = 0
                    DrawMarker(20, vector3(v.x, v.y, v.z), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.2, 0.2, 10, 10, 10, 100, false, true, 2, true, false, false, false)
                end
                if dist < 1.5 then
                    wait = 0
                    DrawText3D(v.x, v.y, v.z, "E - Bajar ascensor")
                    if IsControlJustReleased(0, 38) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentParking = k

                        local coords = Config.Locations["main"][currentParking]
                        SetEntityCoords(ped, coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(ped, coords.w)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            
            for k, v in pairs(Config.Locations["parking"]) do
                local dist = #(pos - vector3(v.x, v.y, v.z))
                if dist < 5.0 then
                    wait = 0
                    DrawMarker(20, vector3(v.x, v.y, v.z), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.2, 0.2, 0.2, 10, 10, 10, 100, false, true, 2, true, false, false, false)
                end
                if dist < 1.5 then
                    wait = 0
                    DrawText3D(v.x, v.y, v.z, "E - Subir ascensor")
                    if IsControlJustReleased(0, 38) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["hall"][currentHospital]
                        SetEntityCoords(ped, coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(ped, coords.w)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end
            Citizen.Wait(wait)
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 1200
        if isStatusChecking then
            wait = 0
            for k, v in pairs(statusChecks) do
                local x,y,z = table.unpack(GetPedBoneCoords(statusCheckPed, v.bone))
                DrawText3D(x, y, z, v.label)
            end
        end

        if isHealingPerson then
            wait = 0
            local ped = PlayerPedId()
            if not IsEntityPlayingAnim(ped, healAnimDict, healAnim, 3) then
                loadAnimDict(healAnimDict)	
                TaskPlayAnim(ped, healAnimDict, healAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
            end
        end
        Citizen.Wait(wait)
    end
end)

RegisterNetEvent('hospital:client:SendAlert')
AddEventHandler('hospital:client:SendAlert', function(msg)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    TriggerEvent("chatMessage", "PAGER", "error", msg)
end)

RegisterNetEvent('112:client:SendAlert')
AddEventHandler('112:client:SendAlert', function(msg, blipSettings)
    if (PlayerJob.name == "police" or PlayerJob.name == "ambulance") and onDuty then
        if blipSettings ~= nil then
            local transG = 250
            local blip = AddBlipForCoord(blipSettings.x, blipSettings.y, blipSettings.z)
            SetBlipSprite(blip, blipSettings.sprite)
            SetBlipColour(blip, blipSettings.color)
            SetBlipDisplay(blip, 4)
            SetBlipAlpha(blip, transG)
            SetBlipScale(blip, blipSettings.scale)
            SetBlipAsShortRange(blip, false)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(blipSettings.text)
            EndTextCommandSetBlipName(blip)
            while transG ~= 0 do
                Wait(180 * 4)
                transG = transG - 1
                SetBlipAlpha(blip, transG)
                if transG == 0 then
                    SetBlipSprite(blip, 2)
                    RemoveBlip(blip)
                    return
                end
            end
        end
    end
end)

RegisterNetEvent('hospital:client:AiCall')
AddEventHandler('hospital:client:AiCall', function()
    local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(PlayerPeds, ped)
    end
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
    local gender = QBCore.Functions.GetPlayerData().gender
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    if closestDistance < 50.0 and closestPed ~= 0 then
        MakeCall(closestPed, gender, street1, street2)
    end
end)

function MakeCall(ped, male, street1, street2)
    local callAnimDict = "cellphone@"
    local callAnim = "cellphone_call_listen_base"
    local rand = (math.random(6,9) / 100) + 0.3
    local rand2 = (math.random(6,9) / 100) + 0.3
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local pedcoords = GetEntityCoords(ped)
    local blipsettings = {
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sprite = 280,
        color = 4,
        scale = 0.9,
        text = "Injured person"
    }

    if math.random(10) > 5 then
        rand = 0.0 - rand
    end

    if math.random(10) > 5 then
        rand2 = 0.0 - rand2
    end

    local moveto = GetOffsetFromEntityInWorldCoords(player, rand, rand2, 0.0)

    TaskGoStraightToCoord(ped, moveto, 2.5, -1, 0.0, 0.0)
    SetPedKeepTask(ped, true) 

    local dist = #(moveto - pedcoords)

    while dist > 3.5 and isDead do
        TaskGoStraightToCoord(ped, moveto, 2.5, -1, 0.0, 0.0)
        dist = #(moveto - pedcoords)
        Citizen.Wait(100)
    end

    ClearPedTasksImmediately(ped)
    TaskLookAtEntity(ped, player, 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, player, 5500)

    Citizen.Wait(3000)

    --TaskStartScenarioInPlace(ped,"WORLD_HUMAN_STAND_MOBILE", 0, 1)
    loadAnimDict(callAnimDict)
    TaskPlayAnim(ped, callAnimDict, callAnim, 1.0, 1.0, -1, 49, 0, 0, 0, 0)

    SetPedKeepTask(ped, true) 

    Citizen.Wait(5000)

    TriggerServerEvent("hospital:server:MakeDeadCall", blipsettings, male, street1, street2)

    SetEntityAsNoLongerNeeded(ped)
    ClearPedTasks(ped)
end

RegisterNetEvent('hospital:client:RevivePlayer') 
AddEventHandler('hospital:client:RevivePlayer', function()
    QBCore.Functions.TriggerCallback('hospital:server:HasFirstAid', function(hasItem)
        if hasItem then
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                local playerId = GetPlayerServerId(player)
                isHealingPerson = true
                QBCore.Functions.Progressbar("hospital_revive", "Reviviendo persona...", 5000, false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = healAnimDict,
                    anim = healAnim,
                    flags = 16,
                }, {}, {}, function() -- Done
                    isHealingPerson = false
                    StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                    QBCore.Functions.Notify("Reviviste a la persona!")
                    TriggerServerEvent("hospital:server:RevivePlayer", playerId)
                end, function() -- Cancel
                    isHealingPerson = false
                    StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                    QBCore.Functions.Notify("Fallido!", "error")
                end)
            else
                QBCore.Functions.Notify("Ningún jugador cerca", "error")
            end
        else
            QBCore.Functions.Notify("Necesita un botiquín de primeros auxilios", "error")
        end
    end, 'firstaid')
end)

RegisterNetEvent('hospital:client:RevivePlayerPolice') 
AddEventHandler('hospital:client:RevivePlayerPolice', function()
    QBCore.Functions.TriggerCallback('hospital:server:HasFirstAid', function(hasItem)
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                local playerId = GetPlayerServerId(player)
                isHealingPerson = true
                QBCore.Functions.Progressbar("hospital_revive", "Reviviendo persona...", 5000, false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = healAnimDict,
                    anim = healAnim,
                    flags = 16,
                }, {}, {}, function() -- Done
                    isHealingPerson = false
                    StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                    QBCore.Functions.Notify("Reviviste a la persona!")
                    TriggerServerEvent("hospital:server:RevivePlayer", playerId)
                end, function() -- Cancel
                    isHealingPerson = false
                    StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                    QBCore.Functions.Notify("Fallido!", "error")
                end)
            else
                QBCore.Functions.Notify("Ningún jugador cerca", "error")
            end
    end, 'firstaid')
end)

RegisterNetEvent('hospital:client:TreatWounds')
AddEventHandler('hospital:client:TreatWounds', function()
    QBCore.Functions.TriggerCallback('hospital:server:HasBandage', function(hasItem)
        if hasItem then
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                local playerId = GetPlayerServerId(player)
                isHealingPerson = true
                QBCore.Functions.Progressbar("hospital_healwounds", "Curando heridas...", 5000, false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = healAnimDict,
                    anim = healAnim,
                    flags = 16,
                }, {}, {}, function() -- Done
                    isHealingPerson = false
                    StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                    QBCore.Functions.Notify("Ayudaste a la persona!")
                    TriggerServerEvent("hospital:server:TreatWounds", playerId)
                end, function() -- Cancel
                    isHealingPerson = false
                    StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                    QBCore.Functions.Notify("Fallido!", "error")
                end)
            else
                QBCore.Functions.Notify("Ningún jugador cerca", "error")
            end
        else
            QBCore.Functions.Notify("Necesitas un vendaje", "error")
        end
    end, 'bandage')
end)

RegisterNetEvent('hospital:client:TreatWoundsp')
AddEventHandler('hospital:client:TreatWoundsp', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 5.0 then
        local playerId = GetPlayerServerId(player)
        isHealingPerson = true
        QBCore.Functions.Progressbar("hospital_healwounds", "Curando heridas...", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = healAnimDict,
            anim = healAnim,
            flags = 16,
        }, {}, {}, function() -- Done
            isHealingPerson = false
            StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
            QBCore.Functions.Notify("Ayudaste a la persona!")
            TriggerServerEvent("hospital:server:TreatWounds", playerId)
        end, function() -- Cancel
            isHealingPerson = false
            StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
            QBCore.Functions.Notify("Fallido!", "error")
        end)
    else
        QBCore.Functions.Notify("Ningún jugador cerca", "error")
    end
end)

function MenuGarage(isDown)
    QBCore.UI.Menu.CloseAll()
    local elements = {}
    for k, v in pairs(Config.Vehicles) do
        table.insert(elements, {label = v, value = k})
    end

    QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'ems-garage', {
        title    = "Garaje EMS",
        align    = 'right',
        elements = elements
    }, function(data, menu)
        local action = data.current.value
    
        if action then
            local coords = Config.Locations["vehicle"][currentGarage]

            QBCore.Functions.SpawnVehicle(action, function(veh)
                SetVehicleNumberPlateText(veh, "AMBU"..tostring(math.random(1000, 9999)))
                SetEntityHeading(veh, coords.w)
                exports['LegacyFuel']:SetFuel(veh, 100.0)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, coords, true)
            QBCore.UI.Menu.CloseAll()
        end
    
    end, function(data, menu)
        menu.close()
    end)

end

RegisterNetEvent('hospital:client:TakeBrancard')
AddEventHandler('hospital:client:TakeBrancard', function()
    local PlayerPed = PlayerPedId()
    local PlayerPos = GetEntityCoords(PlayerPed)
    local Vehicle = CheckForVehicles()

    if Vehicle ~= 0 then
        local VehCoords = GetOffsetFromEntityInWorldCoords(PlayerPed, 0, 0.75, 0)
        LoadModel("v_med_bed1")
        Obj = CreateObject(GetHashKey('v_med_bed1'), GetEntityCoords(PlayerPedId()), true)
        if Obj ~= nil or Obj ~= 0 then
            SetEntityRotation(Obj, 0.0, 0.0, GetEntityHeading(Vehicle), false, false)
            FreezeEntityPosition(Obj, true)
            PlaceObjectOnGroundProperly(Obj)
            BrancardObject = Obj
            SetTimeout(200, function()
                AttachToBrancard()
                IsAttached = true
            end)
        else
            QBCore.Functions.Notify("Algo fue mal..", 'error')
        end
    else
        QBCore.Functions.Notify("No estas cerca de una ambulancia..", 'error')
    end
end)

RegisterNetEvent('hospital:client:RemoveBrancard')
AddEventHandler('hospital:client:RemoveBrancard', function()
    local PlayerPed = PlayerPedId()
    local PlayerPos = GetOffsetFromEntityInWorldCoords(PlayerPed, 0, 1.5, 0)

    if BrancardObject ~= nil then
        local BCoords = GetEntityCoords(BrancardObject)
        local Dist = #(PlayerPos - BCoords)

        if Dist < 3.0 then
            if DoesEntityExist(BrancardObject) then
                DeleteEntity(BrancardObject)
                ClearPedTasks(PlayerPed)
                DetachEntity(PlayerPed, false, true)
                TriggerServerEvent('qb-radialmenu:server:RemoveBrancard', PlayerPos, BrancardObject)
                IsAttached = false
                BrancardObject = nil
                IsLayingOnBed = false
            end
        else
            QBCore.Functions.Notify('Has ido muy rapido!', 'error')
        end
    end
end)

function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(1)
    end
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

function AttachToBrancard()
    local PlayerPed = PlayerPedId()
    local ClosestPlayer, distance = GetClosestPlayer()
    local PlayerPed = PlayerPedId()
    local PlayerPos = GetEntityCoords(PlayerPed)

    if BrancardObject ~= nil then
        if ClosestPlayer == -1 then
            NetworkRequestControlOfEntity(BrancardObject)
            LoadAnim("anim@heists@box_carry@")
            TaskPlayAnim(PlayerPed, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
            SetTimeout(150, function()
                AttachEntityToEntity(BrancardObject, PlayerPed, GetPedBoneIndex(PlayerPed, 28422), 0.0, -1.0, -1.0, 195.0, 180.0, 180.0, 90.0, false, false, true, false, 2, true)
            end)
            FreezeEntityPosition(Obj, false)
        else
            if distance < 2.0 then
                TriggerServerEvent('qb-radialmenu:Brancard:BusyCheck', GetPlayerServerId(ClosestPlayer), "attach")
            else
                NetworkRequestControlOfEntity(BrancardObject)
                LoadAnim("anim@heists@box_carry@")
                TaskPlayAnim(PlayerPed, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
                SetTimeout(150, function()
                    AttachEntityToEntity(BrancardObject, PlayerPed, GetPedBoneIndex(PlayerPed, 28422), 0.0, -1.0, -1.0, 195.0, 180.0, 180.0, 90.0, false, false, true, false, 2, true)
                end)
                FreezeEntityPosition(Obj, false)
            end
        end
    end
end

function DetachBrancard()
    local PlayerPed = PlayerPedId()
    DetachEntity(BrancardObject, false, true)
    ClearPedTasksImmediately(PlayerPedId())
    IsAttached = false
end

local ValidVIEKELS = {
    "ambulance",
}

function CheckForVehicles()
    local PlayerPed = PlayerPedId()
    local PlayerPos = GetEntityCoords(PlayerPed)
    local veh = 0
    for k, v in pairs(ValidVIEKELS) do
        veh = GetClosestVehicle(PlayerPos.x, PlayerPos.y, PlayerPos.z, 7.5, GetHashKey(v), 70)
        if veh ~= 0 then
            break
        end
    end
    return veh
end

function GetOffBrancard()
    local PlayerPed = PlayerPedId()
    local PlayerPos = GetEntityCoords(PlayerPed)
    local Coords = GetOffsetFromEntityInWorldCoords(BrancardObject, 0.85, 0.0, 0)

    ClearPedTasks(PlayerPed)
    DetachEntity(PlayerPed, false, true)
    SetEntityCoords(PlayerPed, Coords.x, Coords.y, Coords.z)
    IsLayingOnBed = false
end

function LayOnBrancard()
    local inBedDicts = "anim@gangops@morgue@table@"
    local inBedAnims = "ko_front"
    local PlayerPed = PlayerPedId()
    local PlayerPos = GetEntityCoords(PlayerPed)
    local Object = GetClosestObjectOfType(PlayerPos.x, PlayerPos.y, PlayerPos.z, 3.0, GetHashKey("v_med_bed1"), false, false, false)
    local player, distance = GetClosestPlayer()

    if player == -1 then
        LoadAnim(inBedDicts)
        if Object ~= nil or Object ~= 0 then
            TaskPlayAnim(PlayerPedId(), inBedDicts, inBedAnims, 8.0, 8.0, -1, 69, 1, false, false, false)
            AttachEntityToEntity(PlayerPed, Object, 0, 0, 0.0, 1.6, 0.0, 0.0, 360.0, 0.0, false, false, false, false, 2, true)
            IsLayingOnBed = true
        end
    else
        if distance < 2.0 then
            TriggerServerEvent('qb-radialmenu:Brancard:BusyCheck', GetPlayerServerId(player), "lay")
        else
            LoadAnim(inBedDicts)
            if Object ~= nil or Object ~= 0 then
                TaskPlayAnim(PlayerPedId(), inBedDicts, inBedAnims, 8.0, 8.0, -1, 69, 1, false, false, false)
                AttachEntityToEntity(PlayerPed, Object, 0, 0, 0.0, 1.6, 0.0, 0.0, 360.0, 0.0, false, false, false, false, 2, true)
                IsLayingOnBed = true
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
        
        if BrancardObject ~= nil then
            local ObjectCoords = GetEntityCoords(BrancardObject)
            local OffsetCoords = GetOffsetFromEntityInWorldCoords(BrancardObject, 0, 0.85, 0)
            local Distance = #(PlayerPos - OffsetCoords)

            if Distance <= 1.0 then
                if not IsAttached then
                    DrawText3D(OffsetCoords.x, OffsetCoords.y, OffsetCoords.z, 'E -Coger camilla/ ~g~H~w~ Cerrar')
                    if IsControlJustPressed(0, 51) then
                        AttachToBrancard()
                        IsAttached = true
                    end
                    if IsControlJustPressed(0, 74) then
                        FreezeEntityPosition(BrancardObject, true)
                    end
                else
                    DrawText3D(OffsetCoords.x, OffsetCoords.y, OffsetCoords.z, 'E - Soltar camilla')
                    if IsControlJustPressed(0, 51) then
                        DetachBrancard()
                        IsAttached = false
                    end
                end

                if not IsLayingOnBed then
                    if not IsAttached then
                        -- DrawText3D(OffsetCoords.x, OffsetCoords.y, OffsetCoords.z + 0.2, '~g~G~w~ - Acostarse en la camilla')
                        if IsControlJustPressed(0, 47) or IsDisabledControlJustPressed(0, 47) then
                            LayOnBrancard()
                        end
                    end
                end
            elseif Distance <= 2 then
                if not IsLayingOnBed then
                    -- DrawText3D(OffsetCoords.x, OffsetCoords.y, OffsetCoords.z, 'Salir de la camilla')
                else
                    if not IsAttached then
                        DrawText3D(OffsetCoords.x, OffsetCoords.y, OffsetCoords.z + 0.2, '~g~G~w~ - Salir de la camilla')
                        if IsControlJustPressed(0, 47) or IsDisabledControlJustPressed(0, 47) then
                            GetOffBrancard()
                        end
                    end
                end
            end
        else
            Citizen.Wait(1000)
        end

        Citizen.Wait(3)
    end
end)

local DetachKeys = {157, 158, 160, 164, 165, 73, 36}
Citizen.CreateThread(function()
    while true do
        if IsAttached then
            for _, PressedKey in pairs(DetachKeys) do
                if IsControlJustPressed(0, PressedKey) or IsDisabledControlJustPressed(0, PressedKey) then
                    DetachBrancard()
                end
            end

            if IsPedShooting(PlayerPedId()) or IsPlayerFreeAiming(PlayerId()) or IsPedInMeleeCombat(PlayerPedId()) then
                DetachBrancard()
            end

            if IsPedDeadOrDying(PlayerPedId(), false) then
                DetachBrancard()
            end

            if IsPedRagdoll(PlayerPedId()) then
                DetachBrancard()
            end
        else
            Citizen.Wait(1000)
        end 
        Citizen.Wait(5)
    end
end)

RegisterCommand('EMSInteraction', function()
    local xPlayer = QBCore.Functions.GetPlayerData()
    if xPlayer.job.name == 'ambulance' then
        local elements = {}
        -- table.insert(elements, {label = 'Estado de Salud', value = 'statuscheck'})
        table.insert(elements, {label = 'Curar Heridas', value = 'treatwounds'})
        table.insert(elements, {label = 'Revivir Jugador', value = 'revive_player'})
        table.insert(elements, {label = 'Spawn Camilla', value = 'spawnbrancard'})
        table.insert(elements, {label = 'Borrar Camilla', value = 'despawnbrancard'})
        
        QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'ems_interaction', {
            title    = "Interacción EMS",
            align    = 'right',
            elements = elements
        }, function(data, menu)
            local v = data.current.value
            local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                if v == 'statuscheck' then
                    TriggerEvent('hospital:client:CheckStatus')
                    QBCore.UI.Menu.CloseAll()
                elseif v == 'treatwounds' then
                    TriggerEvent('hospital:client:TreatWounds')
                    QBCore.UI.Menu.CloseAll()
                elseif v == 'revive_player' then
                    ExecuteCommand('revivep')
                end
            else
                QBCore.Functions.Notify('No hay jugadores cerca')
            end
            if v == 'spawnbrancard' then
                TriggerEvent('hospital:client:TakeBrancard')
                QBCore.UI.Menu.CloseAll()
            elseif v == 'despawnbrancard' then
                TriggerEvent('hospital:client:RemoveBrancard')
                QBCore.UI.Menu.CloseAll()
            end
        
        end, function(data, menu)
            menu.close()
        end)
    end
end)

RegisterKeyMapping('EMSInteraction', 'Interacción EMS', 'keyboard', 'F6')