
local active = false
local status = true
RegisterCommand('OrigenMenu', function()
    HHMenu.Menus[3].submenu = false
    local phoneOpen = exports['qb-phone']:InPhone()
    if not phoneOpen and not QBCore.Functions.IsNuiFocused() then
        if status == true then
            if IsPedInAnyVehicle(PlayerPedId()) then
                SendNUIMessage({
                    action = 'mostrarCoche'
                })
            else
                SendNUIMessage({
                    action = 'ocultarCoche'
                })
            end
            HHMenu.Menus[3].submenu = HHMenu.WorkMenu['vehiculo']
            if not active then
                SendNUIMessage({
                    action = 'open',
                    menus = HHMenu.Menus
                })
                SetNuiFocus(true, true)
                SetNuiFocusKeepInput(true)
                QBCore.Functions.SetNuiFocused(true)
                active = true
            else

                SendNUIMessage({
                    action = "closeMenu"
                })
                SetNuiFocus(false, false)
                SetNuiFocusKeepInput(false)
                QBCore.Functions.SetNuiFocused(false)
                active = false
                TriggerEvent("origen_inventory:updatelock", true)
            end
        end

    end
end)
RegisterKeyMapping('OrigenMenu', 'Abrir Menu', 'keyboard', 'F3')

RegisterNetEvent("origen_menu:closemenu")
AddEventHandler("origen_menu:closemenu", function(s)
    SendNUIMessage({
        action = "closeMenu"
    })
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    QBCore.Functions.SetNuiFocused(false)
    active = false
end)

RegisterCommand("f3fix", function()
    SendNUIMessage({
        action = "closeMenu"
    })
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    QBCore.Functions.SetNuiFocused(false)
    active = false
end)

RegisterNUICallback('CloseMenu', function(data, cb)
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    QBCore.Functions.SetNuiFocused(false)
    active = false

    cb('ok')
end)

RegisterNUICallback('Event', function(data)
    if data.type == 'server' then
        TriggerServerEvent(data.event,data.parameter)
    elseif data.type == 'client' then
        TriggerEvent(data.event, data.parameter)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleepTime = 1000
        if active then
            sleepTime = 1
            DisableControlAction(2, 200, true)
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 106, true)
            DisableControlAction(0, 287, true)
            DisableControlAction(0, 286, true)
            DisableControlAction(0, 18, true)

            if IsControlJustReleased(0, 170) then
                if idOpen then
                    SendNUIMessage({
                        action = "closeIdCard"
                    })
                    idOpen = false
                else
                    SendNUIMessage({
                        action = "closeMenu"
                    })
                    SetNuiFocus(false, false)
                    SetNuiFocusKeepInput(false)
                    QBCore.Functions.SetNuiFocused(false)
                    active = false
                    TriggerEvent("origen_inventory:updatelock", true)
                end
            end

        else
            if idOpen then
                if IsControlJustReleased(0, 194) then
                    SendNUIMessage({
                        action = "closeIdCard"
                    })
                    idOpen = false
                end
                sleepTime = 1
            end
        end 
        Citizen.Wait(sleepTime)
    end
end)