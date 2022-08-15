idOpen = false

RegisterNetEvent('origen_menu:drift')
AddEventHandler('origen_menu:drift', function()
    ExecuteCommand('toggledrift')
end)

RegisterNetEvent('origen_menu:opendpmenu')
AddEventHandler('origen_menu:opendpmenu', function()
    ExecuteCommand('openkeymenu2')
end)

RegisterNetEvent('origen_menu:cancelAnim')
AddEventHandler('origen_menu:cancelAnim', function()
    ExecuteCommand('e c')
end)

RegisterNetEvent('origen_menu:sit')
AddEventHandler('origen_menu:sit', function()
    ExecuteCommand('e sitchair')
end)

RegisterNetEvent('origen_menu:tumbarse')
AddEventHandler('origen_menu:tumbarse', function()
    ExecuteCommand('e passout3')
end)

RegisterNetEvent('origen_menu:aplaudir')
AddEventHandler('origen_menu:aplaudir', function()
    ExecuteCommand('e cheer')
end)

RegisterNetEvent('origen_menu:fumar')
AddEventHandler('origen_menu:fumar', function()
    ExecuteCommand('e smoke')
end)

RegisterNetEvent('origen_menu:rendirse')
AddEventHandler('origen_menu:rendirse', function()
    ExecuteCommand('e surrender')
end)

RegisterNetEvent('origen_menu:facepalm')
AddEventHandler('origen_menu:facepalm', function()
    ExecuteCommand('e facepalm')
end)

RegisterNetEvent('origen_menu:saludar')
AddEventHandler('origen_menu:saludar', function()
    ExecuteCommand('e salute')    
end)

RegisterNetEvent('origen_menu:apoyarse')
AddEventHandler('origen_menu:apoyarse', function()
    ExecuteCommand('e lean')
end)

RegisterNetEvent('origen_menu:cerveza')
AddEventHandler('origen_menu:cerveza', function()
    ExecuteCommand('e beer')
end)

RegisterNetEvent('origen_menu:whiskey')
AddEventHandler('origen_menu:whiskey', function()
    ExecuteCommand('e whiskey')
end)

RegisterNetEvent('origen_menu:camara')
AddEventHandler('origen_menu:camara', function()
    ExecuteCommand('e camera')
end)

RegisterNetEvent('origen_menu:notepad')
AddEventHandler('origen_menu:notepad', function()
    ExecuteCommand('e notepad')
end)

RegisterNetEvent('origen_menu:motor')
AddEventHandler('origen_menu:motor', function(data)
    if IsPedInAnyVehicle(PlayerPedId(), false) then 
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if (GetPedInVehicleSeat(veh, -1) == PlayerPedId()) then
            -- veh)
            -- print( GetIsVehicleEngineRunning(veh))
            if GetIsVehicleEngineRunning(veh) == false then
                SetVehicleEngineOn(veh, true, true, false)
                SetVehicleJetEngineOn(veh, true)
                QBCore.Functions.Notify("Motor ~g~encendido")
            else
                SetVehicleEngineOn(veh, false, true, true)
                SetVehicleJetEngineOn(veh, false)
                QBCore.Functions.Notify("Motor ~r~apagado")
            end
        end 
    end
end)

RegisterNetEvent('origen_menu:openDoor')
AddEventHandler('origen_menu:openDoor', function(data)
    local string = data
    local replace = string:gsub("door", "")
    local door = tonumber(replace)
    local ped = PlayerPedId()
    local closestVehicle = nil

    if IsPedInAnyVehicle(ped, false) then
        closestVehicle = GetVehiclePedIsIn(ped)
    else
        closestVehicle = getNearestVeh()
    end

    if closestVehicle ~= 0 then
        if closestVehicle ~= GetVehiclePedIsIn(ped) then
            local plate = GetVehicleNumberPlateText(closestVehicle)
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', false, plate, door)
                else
                    SetVehicleDoorShut(closestVehicle, door, false)
                end
            else
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', true, plate, door)
                else
                    SetVehicleDoorOpen(closestVehicle, door, false, false)
                end
            end
        else
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                SetVehicleDoorShut(closestVehicle, door, false)
            else
                SetVehicleDoorOpen(closestVehicle, door, false, false)
            end
        end
    else
        QBCore.Functions.Notify('No hay ningún vehículo a la vista ...', 'error', 2500)
    end
end)

RegisterNetEvent('origen_menu:ChangeSeat')
AddEventHandler('origen_menu:ChangeSeat', function(data)
    local Veh = GetVehiclePedIsIn(PlayerPedId())
    local IsSeatFree = IsVehicleSeatFree(Veh, data)
    local speed = GetEntitySpeed(Veh)
    local HasHarnass = exports['qb-smallresources']:HasHarness()
    if not HasHarnass then
        local kmh = (speed * 3.6);  

        if IsSeatFree then
            if kmh <= 100.0 then
                SetPedIntoVehicle(PlayerPedId(), Veh, data)
                QBCore.Functions.Notify('Tu ahora en el  '..data.title..'!')
            else
                QBCore.Functions.Notify('El vehículo va demasiado rápido.')
            end
        else
            QBCore.Functions.Notify('Este asiento está ocupado ...')
        end
    else
        QBCore.Functions.Notify('Tienes una carrera en la que no puedes cambiar', 'error')
    end
end)

RegisterNetEvent('origen_menu:cachear')
AddEventHandler('origen_menu:cachear', function()
    ExecuteCommand('me le cachea')
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        QBCore.Functions.Progressbar("eat_something", "Cacheando...", 3000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "anim@gangops@facility@servers@bodysearch@",
            anim = "player_search",
            flags = 49,
        }, {}, {}, function() -- Done
            StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@", "player_search", 1.0)
            TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", playerId)
        end)
        
    else
        QBCore.Functions.Notify("No hay nadie cerca!", "error")
    end
end)

RegisterNetEvent('origen_menu:pressedIdCard')
AddEventHandler('origen_menu:pressedIdCard', function()
    -- TriggerServerEvent('origen_menu:showIdCard', GetPlayerServerId(PlayerId()))
end)


RegisterNetEvent('origen_menu:showIdcard')
AddEventHandler('origen_menu:showIdcard', function( data, source )
    idOpen = true
    SendNUIMessage({
      action = "showIdCard",
      array  = {
          firstname = data.firstname,
          lastname = data.lastname,
          dateofbirth = data.dob,
          gender = data.gender == 0 and "Hombre" or "Mujer",
          url = UpdateMugShot(source)
      },
    })

end)