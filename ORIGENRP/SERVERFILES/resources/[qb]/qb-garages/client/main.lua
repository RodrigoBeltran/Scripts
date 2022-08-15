local currentHouseGarage = nil
local hasGarageKey = nil
local currentGarage = nil
local OutsideVehicles = {}
local PlayerGang = {}
local MenuHidden = true

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerGang = QBCore.Functions.GetPlayerData().gang
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate')
AddEventHandler('QBCore:Client:OnGangUpdate', function(gang)
    PlayerGang = gang
end)

RegisterNetEvent('qb-garages:client:setHouseGarage')
AddEventHandler('qb-garages:client:setHouseGarage', function(house, hasKey)
    --print("set house garage", house, hasGarageKey)
    currentHouseGarage = house
    hasGarageKey = hasKey
end)

RegisterNetEvent('qb-garages:client:houseGarageConfig')
AddEventHandler('qb-garages:client:houseGarageConfig', function(garageConfig)
    HouseGarages = garageConfig
end)

RegisterNetEvent('qb-garages:client:addHouseGarage')
AddEventHandler('qb-garages:client:addHouseGarage', function(house, garageInfo)
    --print("addHouseGarage", house, garageInfo)
    --print("addHouseGarage2", garageInfo.label)

    if HouseGarages == nil then HouseGarages = {} end
    HouseGarages[house] = garageInfo
    currentHouseGarage = house

    QBCore.Functions.TriggerCallback('qb-houses:server:hasKey', function(hasKey)
        hasGarageKey = hasKey
    end, house)
end)

RegisterNetEvent('qb-garages:client:takeOutDepot')
AddEventHandler('qb-garages:client:takeOutDepot', function(vehicle)
    if OutsideVehicles ~= nil and next(OutsideVehicles) ~= nil then
        if OutsideVehicles[vehicle.plate] ~= nil then
            local Engine = GetVehicleEngineHealth(OutsideVehicles[vehicle.plate])
            -- if Engine <= 50.0 then
                print(vehicle.vehicle)
                QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
                    QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                        QBCore.Functions.SetVehicleProperties(veh, properties)
                        enginePercent = round(vehicle.engine / 10, 0)
                        bodyPercent = round(vehicle.body / 10, 0)
                        currentFuel = vehicle.fuel

                        if vehicle.plate ~= nil then
                            DeleteVehicle(OutsideVehicles[vehicle.plate])
                            OutsideVehicles[vehicle.plate] = veh
                            TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                        end

                        SetVehicleNumberPlateText(veh, vehicle.plate)
                        SetEntityHeading(veh, Depots[currentGarage].takeVehicle.w)
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                        SetEntityAsMissionEntity(veh, true, true)
                        doCarDamage(veh, vehicle)
                        TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                        QBCore.Functions.Notify("Vehiculo Apagado:Motor " .. enginePercent .. "% Carroceria: " .. bodyPercent.. "% Gasolina: "..currentFuel.. "%", "primary", 4500)
                        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                        SetVehicleEngineOn(veh, true, true)
                    end, vehicle.plate)
                    TriggerEvent("vehiclekeys:client:SetOwner", vehicle.plate)
                end, Depots[currentGarage].spawnPoint, true)
                SetTimeout(250, function()
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)))
                end)
            -- else
            --     QBCore.Functions.Notify("You cannot duplicate this vehicle")
            -- end
        else
            print(vehicle.vehicle)
            QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
                QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                    QBCore.Functions.SetVehicleProperties(veh, properties)
                    enginePercent = round(vehicle.engine / 10, 0)
                    bodyPercent = round(vehicle.body / 10, 0)
                    currentFuel = vehicle.fuel

                    if vehicle.plate ~= nil then
                        OutsideVehicles[vehicle.plate] = veh
                        TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                    end

                    SetVehicleNumberPlateText(veh, vehicle.plate)
                    SetEntityHeading(veh, Depots[currentGarage].takeVehicle.w)
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                    SetEntityAsMissionEntity(veh, true, true)
                    doCarDamage(veh, vehicle)
                    TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                    QBCore.Functions.Notify("Vehiculo Apagado:Motor " .. enginePercent .. "% Carroceria: " .. bodyPercent.. "% Gasolina: "..currentFuel.. "%", "primary", 4500)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, vehicle.plate)
                TriggerEvent("vehiclekeys:client:SetOwner", vehicle.plate)
            end, Depots[currentGarage].spawnPoint, true)
            SetTimeout(250, function()
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)))
            end)
        end
    else
        print(vehicle.vehicle)
        QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                QBCore.Functions.SetVehicleProperties(veh, properties)
                enginePercent = round(vehicle.engine / 10, 0)
                bodyPercent = round(vehicle.body / 10, 0)
                currentFuel = vehicle.fuel

                if vehicle.plate ~= nil then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, Depots[currentGarage].takeVehicle.w)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                SetEntityAsMissionEntity(veh, true, true)
                doCarDamage(veh, vehicle)
                TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                QBCore.Functions.Notify("Vehicunlo Apagado:Motor " .. enginePercent .. "% Carroceria: " .. bodyPercent.. "% Gasolina: "..currentFuel.. "%", "primary", 4500)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)
            TriggerEvent("vehiclekeys:client:SetOwner", vehicle.plate)
        end, Depots[currentGarage].spawnPoint, true)
        SetTimeout(250, function()
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)))
        end)
    end
end)

DrawText3Ds = function(x, y, z, text)
	QBCore.Functions.HelpNotify(text)
end

Citizen.CreateThread(function()
    for k, v in pairs(Garages) do
        Garage = AddBlipForCoord(Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z)

        SetBlipSprite (Garage, 289)
        SetBlipDisplay(Garage, 4)
        SetBlipScale  (Garage, 1.0)
        SetBlipAsShortRange(Garage, true)
        SetBlipColour(Garage, 0)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Garages[k].label)
        EndTextCommandSetBlipName(Garage)
    end

    for k, v in pairs(Depots) do
        Depot = AddBlipForCoord(Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z)

        SetBlipSprite (Depot, 68)
        SetBlipDisplay(Depot, 4)
        SetBlipScale  (Depot, 0.8)
        SetBlipAsShortRange(Depot, true)
        SetBlipColour(Depot, 0)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Depots[k].label)
        EndTextCommandSetBlipName(Depot)
    end
end)

function MenuGarage()
    local elements = {}

    table.insert(elements, {label = 'Mis Vehículos', value = 'vehicle_list'})
    table.insert(elements, {label = 'Cerrar', value = 'close_menu'})

    QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_garage_menu', {
        title    = "Garaje",
        align    = 'right',
        elements = elements
    }, function(data, menu)
        local v = data.current.value

        if v == 'vehicle_list' then
            VehicleList()
        elseif v == 'close_menu' then
            QBCore.UI.Menu.CloseAll()
        end
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end

function MenuDepot()
    local elements = {}

    table.insert(elements, {label = 'Abrir Deposito', value = 'depot_vehicles'})
    table.insert(elements, {label = 'Cerrar', value = 'close_menu'})

    QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'depot_menu', {
        title    = "Vehículos Confiscados",
        align    = 'right',
        elements = elements
    }, function(data, menu)
        local v = data.current.value

        if v == 'depot_vehicles' then
            DepotList()
        elseif v == 'close_menu' then
            QBCore.UI.Menu.CloseAll()
        end

    end, function(data, menu)
        menu.close()
    end)
end

function getPlayerVehicles(garage)
    local vehicles = {}

    return vehicles
end

function MenuHouseGarage(house)
    ped = PlayerPedId();

    local elements = {}

    table.insert(elements, {label = 'Mis vehículos', value = 'vehicles'})
    --table.insert(elements, {label = 'Guardar vehículo', value = 'save_vehicle'})
    table.insert(elements, {label = 'Cerrar', value = 'close_menu'})

    QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'depot_menu', {
        title    = "Garaje",
        align    = 'right',
        elements = elements
    }, function(data, menu)
        local v = data.current.value

        if v == 'vehicles' then
            HouseGarage(house)
        elseif v == 'save_vehicle' then
            SaveHouseGrage(house)
        elseif v == 'close_menu' then
            QBCore.UI.Menu.CloseAll()
        end

    end, function(data, menu)
        menu.close()
    end)
end

function SaveHouseGrage(house)
    local curVeh = GetVehiclePedIsIn(ped)
    local plate = GetVehicleNumberPlateText(curVeh)
    QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleHouseOwner', function(owned)
                                    if owned then
                                        local bodyDamage = round(GetVehicleBodyHealth(curVeh), 1)
                                        local engineDamage = round(GetVehicleEngineHealth(curVeh), 1)
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)

                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, currentHouseGarage)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, currentHouseGarage)
                                        QBCore.Functions.DeleteVehicle(curVeh)
                                        if plate ~= nil then
                                            OutsideVehicles[plate] = veh
                                            TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                        end
                                        QBCore.Functions.Notify("Vehículo estacionado en, "..HouseGarages[currentHouseGarage], "primary", 4500)
                                    else
                                        QBCore.Functions.Notify("Nadie es dueño de este vehículo", "error", 3500)
                                    end
                                end, plate, currentHouseGarage)
end

function HouseGarage(house)
    QBCore.Functions.TriggerCallback("qb-garage:server:GetHouseVehicles", function(result)
        ped = PlayerPedId();

        if result == nil then
            QBCore.Functions.Notify("No tienes vehículos en este garaje.")
        else
            local elements2 = {}
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                curGarage = HouseGarages[house].label


                if v.state == 0 then
                    v.state = "Fuera"
                elseif v.state == 1 then
                    v.state = "Aparcado"
                elseif v.state == 2 then
                    v.state = "Confiscado"
                end

                table.insert(elements2, {label = QBCore.Shared.Vehicles[v.vehicle]["name"].. ' - ' ..v.plate.. ' - ' ..v.state, value = v})
                
            end

            QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_menu', {
                title    = "Vehículos",
                align    = 'right',
                elements = elements2
            }, function(data2, menu2)
                local action = data2.current.value

                if action then
                    TakeOutGarageVehicle(action)
                end

            end, function(data2, menu2)
                menu2.close()
            end)

        end
    end, house)
end

RegisterNetEvent("qb-garages:DepositList")
AddEventHandler("qb-garages:DepositList", function()
    DepotList()
end)

function DepotList()
    local elements = {}
    QBCore.Functions.TriggerCallback("qb-garage:server:GetDepotVehicles", function(result)
        
        if result == nil then
            QBCore.Functions.Notify("No tienes vehículos en el deposito", "error", 5000)
            QBCore.UI.Menu.CloseAll()
        else

            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel


                if v.state == 0 then
                    v.state = "Confiscado"
                end
                table.insert(elements, {label = v.vehicle.. ' - ' ..v.plate, value = v})

            end

            QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'depot-menu', {
                title    = "Vehículos Confiscados",
                align    = 'right',
                elements = elements
            }, function(data, menu)
                local action = data.current.value

                if action then
                    TakeOutDepotVehicle(action)
                end

            end, function(data, menu)
                menu.close()
            end)
        end

    end)
end

function VehicleList()
    QBCore.Functions.TriggerCallback("qb-garage:server:GetUserVehicles", function(result)
        print(result, json.encode(result))
        if result == nil then
            QBCore.Functions.Notify("No tienes vehículos en este garaje.")
        else
            local elements2 = {}
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                curGarage = Garages[v.garage].label


                if v.state == 0 then
                    v.state = "Fuera"
                elseif v.state == 1 then
                    v.state = "Aparcado"
                elseif v.state == 2 then
                    v.state = "Confiscado"
                end

                table.insert(elements2, {label = v.vehicle.. ' - ' ..v.plate.. ' - ' ..v.state, value = v})
                
            end

            QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_user_menu', {
                title    = "Vehículos",
                align    = 'right',
                elements = elements2
            }, function(data2, menu2)
                local action = data2.current.value

                if action then
                    TakeOutVehicle(action)
                end
                menu2.close()
            end, function(data2, menu2)
                menu2.close()
            end)

        end
    end, currentGarage)
end

function TakeOutVehicle(vehicle)
    if vehicle.state == "Aparcado" then
        enginePercent = round(vehicle.engine / 10, 1)
        bodyPercent = round(vehicle.body / 10, 1)
        currentFuel = vehicle.fuel

        QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)

                if vehicle.plate ~= nil then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                QBCore.Functions.SetVehicleProperties(veh, properties)
                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, Garages[currentGarage].spawnPoint.w)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                doCarDamage(veh, vehicle)
                SetEntityAsMissionEntity(veh, true, true)
                TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                QBCore.Functions.Notify("Vehiculo apagado:Motor " .. enginePercent .. "% Carroceria: " .. bodyPercent.. "% Gasolina: "..currentFuel.. "%", "primary", 4500)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)

        end, Garages[currentGarage].spawnPoint, true)
        QBCore.UI.Menu.CloseAll()
    elseif vehicle.state == "Fuera" then
        QBCore.Functions.Notify("Este vehículo está en el deposito", "error", 2500)
    elseif vehicle.state == "Confiscado" then
        QBCore.Functions.Notify("Este vehículo fue confiscado por la policía", "error", 4000)
    end
end

function tprint (tbl, indent)
    if not indent then indent = 0 end
    local toprint = string.rep(" ", indent) .. "{\r\n"
    indent = indent + 2
    for k, v in pairs(tbl) do
      toprint = toprint .. string.rep(" ", indent)
      if (type(k) == "number") then
        toprint = toprint .. "[" .. k .. "] = "
      elseif (type(k) == "string") then
        toprint = toprint  .. k ..  "= "
      end
      if (type(v) == "number") then
        toprint = toprint .. v .. ",\r\n"
      elseif (type(v) == "string") then
        toprint = toprint .. "\"" .. v .. "\",\r\n"
      elseif (type(v) == "table") then
        toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
      else
        toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
      end
    end
    toprint = toprint .. string.rep(" ", indent-2) .. "}"
    return toprint
  end

function TakeOutGangVehicle(vehicle)
    if vehicle.state == "Aparcado" then
        enginePercent = round(vehicle.engine / 10, 1)
        bodyPercent = round(vehicle.body / 10, 1)
        currentFuel = vehicle.fuel

        QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)

                if vehicle.plate ~= nil then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                QBCore.Functions.SetVehicleProperties(veh, properties)
                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, GangGarages[currentGarage].spawnPoint.w)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                doCarDamage(veh, vehicle)
                SetEntityAsMissionEntity(veh, true, true)
                TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                QBCore.Functions.Notify("Vehiculo Apagado:Motor " .. enginePercent .. "% Carroceria: " .. bodyPercent.. "% Gasolina: "..currentFuel.. "%", "primary", 4500)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)

        end, GangGarages[currentGarage].spawnPoint, true)
    elseif vehicle.state == "Fuera" then
        QBCore.Functions.Notify("¿Está su vehículo en el depósito?", "error", 2500)
    elseif vehicle.state == "Confiscado" then
        QBCore.Functions.Notify("Este vehículo fue incautado por la Policía.", "error", 4000)
    end
end

function TakeOutDepotVehicle(vehicle)
    if vehicle.state == "Confiscado" then
        TriggerServerEvent("qb-garage:server:PayDepotPrice", vehicle)
        QBCore.UI.Menu.CloseAll()
    end
end

function TakeOutGarageVehicle(vehicle)
    if vehicle.state == "Aparcado" then
        QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
                QBCore.Functions.SetVehicleProperties(veh, properties)
                enginePercent = round(vehicle.engine / 10, 1)
                bodyPercent = round(vehicle.body / 10, 1)
                currentFuel = vehicle.fuel

                if vehicle.plate ~= nil then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, HouseGarages[currentHouseGarage].takeVehicle.w)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                SetEntityAsMissionEntity(veh, true, true)
                doCarDamage(veh, vehicle)
                TriggerServerEvent('qb-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                QBCore.Functions.Notify("Vehiculo Apagado:Motor " .. enginePercent .. "% Carroceria: " .. bodyPercent.. "% Gasolina: "..currentFuel.. "%", "primary", 4500)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)
        end, HouseGarages[currentHouseGarage].takeVehicle, true)
    end
end

function doCarDamage(currentVehicle, veh)
	smash = false
	damageOutside = false
	damageOutside2 = false
	local engine = veh.engine + 0.0
	local body = veh.body + 0.0
	if engine < 200.0 then
		engine = 200.0
    end

    if engine > 1000.0 then
        engine = 1000.0
    end

	if body < 150.0 then
		body = 150.0
	end
	if body < 900.0 then
		smash = true
	end

	if body < 800.0 then
		damageOutside = true
	end

	if body < 500.0 then
		damageOutside2 = true
	end

    Citizen.Wait(100)
    SetVehicleEngineHealth(currentVehicle, engine)
	if smash then
		SmashVehicleWindow(currentVehicle, 0)
		SmashVehicleWindow(currentVehicle, 1)
		SmashVehicleWindow(currentVehicle, 2)
		SmashVehicleWindow(currentVehicle, 3)
		SmashVehicleWindow(currentVehicle, 4)
	end
	if damageOutside then
		SetVehicleDoorBroken(currentVehicle, 1, true)
		SetVehicleDoorBroken(currentVehicle, 6, true)
		SetVehicleDoorBroken(currentVehicle, 4, true)
	end
	if damageOutside2 then
		SetVehicleTyreBurst(currentVehicle, 1, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 2, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 3, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 4, false, 990.0)
	end
	if body < 1000 then
		SetVehicleBodyHealth(currentVehicle, 985.1)
	end
end

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inGarageRange = false

        for k, v in pairs(Garages) do
            local takeDist = #(pos - vector3(Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z))
            if takeDist <= 15 then
                inGarageRange = true
                DrawMarker(36, Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 10, 10, 10, 222, false, false, false, true, false, false, false)
                if takeDist <= 1.5 then
                    if not IsPedInAnyVehicle(ped) then
                        DrawText3Ds(Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z + 0.5, 'E - Garaje')
                        if IsControlJustPressed(0, 38) then
                            MenuGarage()
                            MenuHidden = not MenuHidden
                            currentGarage = k
                        end
                    else
                        DrawText3Ds(Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z, Garages[k].label)
                    end
                end

                if takeDist >= 4 and not MenuHidden then
                    QBCore.UI.Menu.CloseAll()
                end
            end

            local putDist = #(pos - vector3(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z))

            if putDist <= 25 and IsPedInAnyVehicle(ped) then
                inGarageRange = true
                DrawMarker(20, Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 10, 10, 10, 255, false, false, false, true, false, false, false)
                if putDist <= 1.5 then
                    DrawText3Ds(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z + 0.5, 'E - Aparcar Vehículo')
                    if IsControlJustPressed(0, 38) then
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                            if owned then
                                local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)

                                TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, k)
                                TaskLeaveVehicle(ped, curVeh, 64)
                                Citizen.Wait(2000)
                                --TriggerServerEvent('vehiclemod:server:saveStatus', plate)
                                QBCore.Functions.DeleteVehicle(curVeh)
                                if plate ~= nil then
                                    OutsideVehicles[plate] = veh
                                    TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                end
                                --QBCore.Functions.Notify("Vehículo Aparcado en, "..Garages[k].label, "primary", 4500)
                            else
                                QBCore.Functions.Notify("Este vehículo no te pertenece", "error", 3500)
                            end
                        end, plate)
                    end
                end
            end
        end

        if not inGarageRange then
            Citizen.Wait(1000)
        end
    end
end)


Citizen.CreateThread(function()
    Citizen.Wait(2000)
    while true do
        Citizen.Wait(5)
        local inGarageRange = false
        if HouseGarages ~= nil and currentHouseGarage ~= nil then
            if hasGarageKey and HouseGarages[currentHouseGarage] ~= nil and HouseGarages[currentHouseGarage].takeVehicle then
                local data = HouseGarages[currentHouseGarage]
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                if not data or not data.takeVehicle or not data.takeVehicle.x or not data.takeVehicle.y or not data.takeVehicle.z then return end

                local takeDist = #(pos - vector3(data.takeVehicle.x, data.takeVehicle.y, data.takeVehicle.z))
                if takeDist <= 15 then
                    inGarageRange = true
                    DrawMarker(20, HouseGarages[currentHouseGarage].takeVehicle.x, HouseGarages[currentHouseGarage].takeVehicle.y, HouseGarages[currentHouseGarage].takeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 10, 10, 10, 222, false, false, false, true, false, false, false)
                    if takeDist < 2.0 then
                        if not IsPedInAnyVehicle(ped) then
                            DrawText3Ds(HouseGarages[currentHouseGarage].takeVehicle.x, HouseGarages[currentHouseGarage].takeVehicle.y, HouseGarages[currentHouseGarage].takeVehicle.z + 0.5, 'E - Garage')
                            if IsControlJustPressed(1, 177) and not MenuHidden then
                               -- close()TaskLeaveVehicle(ped, vehicle, 64)
                                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            end
                            if IsControlJustPressed(0, 38) then
                                MenuHouseGarage(currentHouseGarage)
                                MenuHidden = not MenuHidden
                            end
                        elseif IsPedInAnyVehicle(ped) then
                            DrawText3Ds(HouseGarages[currentHouseGarage].takeVehicle.x, HouseGarages[currentHouseGarage].takeVehicle.y, HouseGarages[currentHouseGarage].takeVehicle.z + 0.5, 'E - Aparcar')
                            if IsControlJustPressed(0, 38) then
                                local curVeh = GetVehiclePedIsIn(ped)
                                local plate = GetVehicleNumberPlateText(curVeh)
                                QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleHouseOwner', function(owned)
                                    if owned then
                                        local bodyDamage = round(GetVehicleBodyHealth(curVeh), 1)
                                        local engineDamage = round(GetVehicleEngineHealth(curVeh), 1)
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)

                                        TriggerServerEvent('qb-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, currentHouseGarage)
                                        TriggerServerEvent('qb-garage:server:updateVehicleState', 1, plate, currentHouseGarage)
                                        QBCore.Functions.DeleteVehicle(curVeh)
                                        if plate ~= nil then
                                            OutsideVehicles[plate] = veh
                                            TriggerServerEvent('qb-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                        end
                                        QBCore.Functions.Notify("Vehículo estacionado en su casa", "primary", 4500)
                                    else
                                        QBCore.Functions.Notify("Nadie es dueño de este vehículo", "error", 3500)
                                    end
                                end, plate, currentHouseGarage)
                            end
                        end
                    end

                    if takeDist > 1.99 and not MenuHidden then
                        QBCore.UI.Menu.CloseAll()
                    end
                end
            end
        end

        if not inGarageRange then
            Citizen.Wait(5000)
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inGarageRange = false

        for k, v in pairs(Depots) do
            local takeDist = #(pos - vector3(Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z))
            if takeDist <= 15 then
                inGarageRange = true
                currentGarage = k
                DrawMarker(20, Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 10, 10, 10, 222, false, false, false, true, false, false, false)
                if takeDist <= 1.5 then
                    if not IsPedInAnyVehicle(ped) then
                        DrawText3Ds(Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z + 0.5, 'E - Depósito')
                        if IsControlJustPressed(0, 38) then
                            MenuDepot()
                            MenuHidden = not MenuHidden
                        end
                    end
                end

                if takeDist >= 4 and not MenuHidden then
                    QBCore.UI.Menu.CloseAll()
                end
            end
        end

        if not inGarageRange then
            Citizen.Wait(5000)
        end
    end
end)

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end
