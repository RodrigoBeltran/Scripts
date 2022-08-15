local calls = {}
local callnum = 0
local totalcalls = 0
local config = false
local showed = false
local PlayerData = {}
local activated = true
local gpsmarcado = false
local muted = false
local showAlerts = true
local movingDispatch = false
local groupPlayer = "user"
local toggleAlertsAdmin = true

local zoneNames = {
    AIRP = "Los Santos International Airport",
    ALAMO = "Alamo Sea",
    ALTA = "Alta",
    ARMYB = "Fort Zancudo",
    BANHAMC = "Banham Canyon Dr",
    BANNING = "Banning",
    BAYTRE = "Baytree Canyon",
    BEACH = "Vespucci Beach",
    BHAMCA = "Banham Canyon",
    BRADP = "Braddock Pass",
    BRADT = "Braddock Tunnel",
    BURTON = "Burton",
    CALAFB = "Calafia Bridge",
    CANNY = "Raton Canyon",
    CCREAK = "Cassidy Creek",
    CHAMH = "Chamberlain Hills",
    CHIL = "Vinewood Hills",
    CHU = "Chumash",
    CMSW = "Chiliad Mountain State Wilderness",
    CYPRE = "Cypress Flats",
    DAVIS = "Davis",
    DELBE = "Del Perro Beach",
    DELPE = "Del Perro",
    DELSOL = "La Puerta",
    DESRT = "Grand Senora Desert",
    DOWNT = "Downtown",
    DTVINE = "Downtown Vinewood",
    EAST_V = "East Vinewood",
    EBURO = "El Burro Heights",
    ELGORL = "El Gordo Lighthouse",
    ELYSIAN = "Elysian Island",
    GALFISH = "Galilee",
    GALLI = "Galileo Park",
    golf = "GWC and Golfing Society",
    GRAPES = "Grapeseed",
    GREATC = "Great Chaparral",
    HARMO = "Harmony",
    HAWICK = "Hawick",
    HORS = "Vinewood Racetrack",
    HUMLAB = "Humane Labs and Research",
    JAIL = "Bolingbroke Penitentiary",
    KOREAT = "Little Seoul",
    LACT = "Land Act Reservoir",
    LAGO = "Lago Zancudo",
    LDAM = "Land Act Dam",
    LEGSQU = "Legion Square",
    LMESA = "La Mesa",
    LOSPUER = "La Puerta",
    MIRR = "Mirror Park",
    MORN = "Morningwood",
    MOVIE = "Richards Majestic",
    MTCHIL = "Mount Chiliad",
    MTGORDO = "Mount Gordo",
    MTJOSE = "Mount Josiah",
    MURRI = "Murrieta Heights",
    NCHU = "North Chumash",
    NOOSE = "N.O.O.S.E",
    OCEANA = "Pacific Ocean",
    PALCOV = "Paleto Cove",
    PALETO = "Paleto Bay",
    PALFOR = "Paleto Forest",
    PALHIGH = "Palomino Highlands",
    PALMPOW = "Palmer-Taylor Power Station",
    PBLUFF = "Pacific Bluffs",
    PBOX = "Pillbox Hill",
    PROCOB = "Procopio Beach",
    RANCHO = "Rancho",
    RGLEN = "Richman Glen",
    RICHM = "Richman",
    ROCKF = "Rockford Hills",
    RTRAK = "Redwood Lights Track",
    SanAnd = "San Andreas",
    SANCHIA = "San Chianski Mountain Range",
    SANDY = "Sandy Shores",
    SKID = "Mission Row",
    SLAB = "Stab City",
    STAD = "Maze Bank Arena",
    STRAW = "Strawberry",
    TATAMO = "Tataviam Mountains",
    TERMINA = "Terminal",
    TEXTI = "Textile City",
    TONGVAH = "Tongva Hills",
    TONGVAV = "Tongva Valley",
    VCANA = "Vespucci Canals",
    VESP = "Vespucci",
    VINE = "Vinewood",
    WINDF = "Ron Alternates Wind Farm",
    WVINE = "West Vinewood",
    ZANCUDO = "Zancudo River",
    ZP_ORT = "Port of South Los Santos",
    ZQ_UAR = "Davis Quartz"
}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded',function()
    local xPlayer = QBCore.Functions.GetPlayerData()
    playerGender = xPlayer.charinfo.gender 
    isPlayerWhitelisted = refreshPlayerWhitelisted()  
    TriggerServerEvent('origen_dispatch:forzarlog')
end)

RegisterNetEvent('origen_dispatch:GetPlayerGroup')
AddEventHandler('origen_dispatch:GetPlayerGroup',function(PlayerGroup)
      groupPlayer = PlayerGroup
end)

function GetStreetNames(coords)
    local street = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street1 = GetStreetNameFromHashKey(street)
    local zone = tostring(GetNameOfZone(coords.x, coords.y, coords.z))
    local street2 = zoneNames[tostring(zone)]
    return {street1 = street1, street2 = street2}
end

function borrar_alerta()
    if calls[totalcalls - 1] ~= nil then
        table.remove(calls,1)
        totalcalls = totalcalls - 1
        callnum = callnum - 1
        SendNUIMessage({
            callnum = callnum;
            totalcalls = totalcalls;
        })
    else
        callnum = 0
        totalcalls = 0
        calls = {}
        SendNUIMessage({
            content = "Sin llamadas recibidas";
            restart = true;
            newalert = false;
        })
    end
end

QBCore = nil 

Citizen.CreateThread(function() 
    while QBCore == nil do 
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end) 
        Citizen.Wait(0) 
    end
    while QBCore.Functions.GetPlayerData().job == nil or QBCore.Functions.GetPlayerData().charinfo.phone == nil do
		Citizen.Wait(10)
	end

	PlayerJob = QBCore.Functions.GetPlayerData().job
    PlayerPhone = QBCore.Functions.GetPlayerData().charinfo.phone

    TriggerServerEvent('origen_dispatch:forzarlog')
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
	PlayerJob = job
    calls = {}
    callnum = 0
    totalcalls = 0
    SendNUIMessage({
        show = false;
        content = "Sin alertas";
        callnum = 0;
        totalcalls = 0;
        closeConfigMenu = true;
        newalert = false;
    })
    SetNuiFocus(false, false)
    showed = false
end)

RegisterCommand("showalerts", function()
    local Player = QBCore.Functions.GetPlayerData()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    if ((PlayerJob.name == 'police' or PlayerJob.name == 'ambulance' or PlayerJob.name == 'lscustom' or PlayerJob.name == 'bennys' or PlayerJob.name == 'flywheels' or PlayerJob.name == 'paletomonkey' or PlayerJob.name == 'northwayautos' or PlayerJob.name == 'taxi') and Player.job.onduty) or ((groupPlayer == "god" or groupPlayer == "admin") and toggleAlertsAdmin) then
        if not showed then
            if checkTable(calls) then
                if calls[callnum]['model'] ~= nil then
                    SendNUIMessage({
                        show = true;
                        pic = true;
                        model = calls[callnum]['model'];
                    })
                    showed = true
                else
                    SendNUIMessage({
                        show = true;
                    })
                    showed = true
                end
            else
                SendNUIMessage({
                    show = true;
                })
                showed = true
            end
        else
            SendNUIMessage({
                show = false;
            })
            showed = false
        end
    end
end, false)

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        Citizen.Wait(2000)
        SendNUIMessage({
            callnum = 0;
            content = "Sin llamadas recibidas";
            newalert = false;
        })
    end
end)

-- RegisterNetEvent("origen_dispatch:alertToClient")
-- AddEventHandler("origen_dispatch:alertToClient", function(text, coords, id)
--     local id_ = id
--     local streetnames = GetStreetNames(coords)
--     if PlayerData.job and PlayerData.job.name == 'police' and activated then
--         callnum = callnum + 1
--         totalcalls = totalcalls + 1
--         SendNUIMessage({
--             content = "["..id_.."] " ..text.. "<br />" ..streetnames.street1..", " ..streetnames.street2;
--             callnum = callnum;
--             totalcalls = totalcalls;
--             newalert = true;
--             id = id;
            
--         })
--         table.insert(calls, {text = "["..id_.."] " ..text.. "<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords})
--         PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
--         SetTimeout(300000, function()
--             borrar_alerta()
--         end)
--     end
-- end)

-- local Player = QBCore.Functions.GetPlayerData()
-- local onDuty = Player.job.duty

local zonasur = PolyZone:Create({
    vector2(-3291.2902832031, -3954.4096679688),
    vector2(-3747.0056152344, 1311.1735839844),
    vector2(4440.9599609375, 1430.0952148438),
    vector2(4161.5737304688, -3874.5336914062)
  }, {
    name="ZonaSur",
    --minZ = 1.9022116661072,
    --maxZ = 224.0
})
  
local dentrozonasur = false
Citizen.CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local coord = GetEntityCoords(plyPed)
        dentrozonasur = zonasur:isPointInside(coord)
        Citizen.Wait(500)
    end
end)

RegisterNetEvent("origen_dispatch:alertToClient")
AddEventHandler("origen_dispatch:alertToClient", function(text, coords, id)
    local id_ = id
    local streetnames = GetStreetNames(coords)
    local Player = QBCore.Functions.GetPlayerData()
    if string.find(text, "<") then
        return false
    end
    if string.find(text, ">") then
        return false
    end
    if string.find(text, "src") then 
        return false
    end
    if string.find(text, "3E") then 
        return false
    end
    if string.find(text, "3C") then 
        return false
    end
    
    if Player ~= nil then
        if Player.job.name ~= nil then
            if (Player.job.name == 'police' and activated and Player.job.onduty) or ((groupPlayer == "admin" or groupPlayer == "god") and activated and toggleAlertsAdmin)  then
                callnum = callnum + 1
                totalcalls = totalcalls + 1

                if dentrozonasur then
                    SendNUIMessage({
                        content = "<FONT SIZE=2> <a style= 'color:#2A73FC'>Aviso LSPD ["..id_.."] </font> </a> <br /> <FONT SIZE=2> " ..text.. "</font> <br /> <FONT SIZE=1>" ..streetnames.street1..", " ..streetnames.street2.. '</font> <br /> ';
                        callnum = callnum;
                        totalcalls = totalcalls;
                        newalert = true;
                        id = id;
                        
                    })
                    table.insert(calls, {text = "<FONT SIZE=2> <a style= 'color:#2A73FC'>Aviso LSPD ["..id_.."] </font> </a> <br /> <FONT SIZE=2> " ..text.. "</font> <br /> <FONT SIZE=1>" ..streetnames.street1..", " ..streetnames.street2.. '</font> <br /> ', coords = coords})
                    PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
                    SetTimeout(300000, function()
                        borrar_alerta()
                    end)
                else
                    SendNUIMessage({
                        content = "<FONT SIZE=2> <a style= 'color:#E3AE13'>Aviso BCSD ["..id_.."] </font> </a> <br /> <FONT SIZE=2> " ..text.. "</font> <br /> <FONT SIZE=1>" ..streetnames.street1..", " ..streetnames.street2.. '</font> <br /> ';
                        callnum = callnum;
                        totalcalls = totalcalls;
                        newalert = true;
                        id = id;
                        
                    })
                    table.insert(calls, {text = "<FONT SIZE=2> <a style= 'color:#E3AE13'>Aviso BCSD ["..id_.."] </font> </a> <br /> <FONT SIZE=2> " ..text.. "</font> <br /> <FONT SIZE=1>" ..streetnames.street1..", " ..streetnames.street2.. '</font> <br /> ', coords = coords})
                    PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
                    SetTimeout(300000, function()
                        borrar_alerta()
                    end)
                end
            end
        end
    end
end)

-- RegisterNetEvent("origen_dispatch:vehToClient")
-- AddEventHandler("origen_dispatch:vehToClient", function(coords, model, color, id, r, g, b, plate)
--     if PlayerData.job and PlayerData.job.name == 'police' and activated then
--         callnum = callnum + 1
--         totalcalls = totalcalls + 1
--         --local distanceToAlert = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords)
--         --local finalDistanceTo = Math.Round(Math.Round(distanceToAlert, 1) * 0.001, 1)
--         local id_ = id
--         local streetnames = GetStreetNames(coords)
--         if Config.enableVehiclePics then
--             SendNUIMessage({
--                 content = "["..id_.."] Una persona ha robado un vehículo modelo " ..model.. " de color <div style='width:30px;height:15px;display:inline-block;background-color:rgb(" ..r.. "," ..g.. "," ..b.. ")'></div>, Te encuentras a " ..finalDistanceTo .. " km de distancia";
--                 callnum = callnum;
--                 totalcalls = totalcalls;
--                 pic = true;
--                 model = model;
--                 newalert = true;
--                 id = id;
--             })
--             table.insert(calls, {text = "Una persona ha robado un vehículo modelo " ..model.. " de color "..color..", Te encuentras a " ..finalDistanceTo .. " km de distancia", coords = coords, model = model})
--         else
--             SendNUIMessage({
--                 content = "["..id_.."] Acaban de robar un vehículo modelo " ..model.. " de color <div style='width:30px;height:15px;display:inline-block;background-color:rgb(" ..r.. "," ..g.. "," ..b.. ")'></div> Con matrícula "..plate..".<br />" ..streetnames.street1..", " ..streetnames.street2..".";
--                 callnum = callnum;
--                 totalcalls = totalcalls;
--                 newalert = true;
--                 id = id;
--             })
--             table.insert(calls, {text = "["..id_.."] Acaban de robar un vehículo modelo " ..model.. " de color <div style='width:30px;height:15px;display:inline-block;background-color:rgb(" ..r.. "," ..g.. "," ..b.. ")'></div> Con matrícula "..plate..".<br />" ..streetnames.street1..", " ..streetnames.street2..".", coords = coords})
--             PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
--             SetTimeout(300000, function()
--                 borrar_alerta()
--             end)
--         end
--     end
-- end)

RegisterNetEvent("origen_dispatch:vehToClient")
AddEventHandler("origen_dispatch:vehToClient", function(coords, model, color, id, r, g, b, plate)
    local Player = QBCore.Functions.GetPlayerData()
    if Player ~= nil then
        if PlayerJob ~= nil then
            if PlayerJob.name == 'police' and activated then
                callnum = callnum + 1
                totalcalls = totalcalls + 1
                --local distanceToAlert = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords)
                --local finalDistanceTo = Math.Round(Math.Round(distanceToAlert, 1) * 0.001, 1)
                local id_ = id
                local streetnames = GetStreetNames(coords)
                if Config.enableVehiclePics then
                    SendNUIMessage({
                        content = "["..id_.."] Una persona ha robado un vehículo modelo " ..model.. " de color <div style='width:30px;height:15px;display:inline-block;background-color:rgb(" ..r.. "," ..g.. "," ..b.. ")'></div>, Te encuentras a " ..finalDistanceTo .. " km de distancia";
                        callnum = callnum;
                        totalcalls = totalcalls;
                        pic = true;
                        model = model;
                        newalert = true;
                        id = id;
                    })
                    table.insert(calls, {text = "Una persona ha robado un vehículo modelo " ..model.. " de color "..color..", Te encuentras a " ..finalDistanceTo .. " km de distancia", coords = coords, model = model})
                else
                    if dentrozonasur then
                        SendNUIMessage({
                            content = "<FONT SIZE=2> <a style= 'color:#2A73FC'>Aviso LSPD ["..id_.."] </font> </a> <br /> <FONT SIZE=2> Acaban de robar un vehículo modelo " ..model.. " de color <div style='width:30px;height:15px;display:inline-block;background-color:rgb(" ..r.. "," ..g.. "," ..b.. ")'></div> Con matrícula "..plate..". </font> <br /> <FONT SIZE=1>" ..streetnames.street1..", " ..streetnames.street2.. '</font> <br /> ';
                            callnum = callnum;
                            totalcalls = totalcalls;
                            newalert = true;
                            id = id;
                            
                        })
                        table.insert(calls, {text = "<FONT SIZE=2> <a style= 'color:#2A73FC'>Aviso LSPD ["..id_.."] </font> </a> <br /> <FONT SIZE=2> Acaban de robar un vehículo modelo " ..model.. " de color <div style='width:30px;height:15px;display:inline-block;background-color:rgb(" ..r.. "," ..g.. "," ..b.. ")'></div> Con matrícula "..plate..". </font> <br /> <FONT SIZE=1>" ..streetnames.street1..", " ..streetnames.street2.. '</font> <br /> ', coords = coords})
                        PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
                        SetTimeout(300000, function()
                            borrar_alerta()
                        end)
                    else
                        SendNUIMessage({
                            content = "<FONT SIZE=2> <a style= 'color:#E3AE13'>Aviso BCSD ["..id_.."] </font> </a> <br /> <FONT SIZE=2> Acaban de robar un vehículo modelo " ..model.. " de color <div style='width:30px;height:15px;display:inline-block;background-color:rgb(" ..r.. "," ..g.. "," ..b.. ")'></div> Con matrícula "..plate..". </font> <br /> <FONT SIZE=1>" ..streetnames.street1..", " ..streetnames.street2.. '</font> <br /> ';
                            callnum = callnum;
                            totalcalls = totalcalls;
                            newalert = true;
                            id = id;
                            
                        })
                        table.insert(calls, {text = "<FONT SIZE=2> <a style= 'color:#E3AE13'>Aviso BCSD ["..id_.."] </font> </a> <br /> <FONT SIZE=2> Acaban de robar un vehículo modelo " ..model.. " de color <div style='width:30px;height:15px;display:inline-block;background-color:rgb(" ..r.. "," ..g.. "," ..b.. ")'></div> Con matrícula "..plate..". </font> <br /> <FONT SIZE=1>" ..streetnames.street1..", " ..streetnames.street2.. '</font> <br /> ', coords = coords})
                        PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
                        SetTimeout(300000, function()
                            borrar_alerta()
                        end)
                    end
                end
            end
        end
    end
end)

RegisterCommand("auxilio", function(source, args)
    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    local id = GetPlayerServerId(PlayerId())
    local playerCoords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('origen_dispatch:mensaje_chat')
    TriggerServerEvent("origen_dispatch:sendAmbuAlert", text, coords, id)
    TriggerServerEvent('origen_dispatch:blip',{
        x = QBCore.Math.Round(playerCoords.x, 1),
        y = QBCore.Math.Round(playerCoords.y, 1),
        z = QBCore.Math.Round(playerCoords.z, 1)
    }, 'auxilio')
end, false)

RegisterCommand("meca", function(source, args)
    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    local id = GetPlayerServerId(PlayerId())
    local playerCoords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('origen_dispatch:mensaje_chat')
    TriggerServerEvent("origen_dispatch:sendMecaAlert", text, coords, id)
    TriggerServerEvent('origen_dispatch:blip',{
        x = QBCore.Math.Round(playerCoords.x, 1),
        y = QBCore.Math.Round(playerCoords.y, 1),
        z = QBCore.Math.Round(playerCoords.z, 1)
    }, 'meca')    
end, false)

RegisterCommand("pedirtaxi", function(source, args)

    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    local id = GetPlayerServerId(PlayerId())
    local playerCoords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('origen_dispatch:mensaje_chat')
    TriggerServerEvent("origen_dispatch:sendTaxiaAlert", text, coords, id)
    TriggerServerEvent('origen_dispatch:blip',{
        x = QBCore.Math.Round(playerCoords.x, 1),
        y = QBCore.Math.Round(playerCoords.y, 1),
        z = QBCore.Math.Round(playerCoords.z, 1)
    }, 'taxi')
end, false)

RegisterNetEvent("origen_dispatch:auxToClient")
AddEventHandler("origen_dispatch:auxToClient", function(text, coords, id)
    if PlayerJob.name == 'ambulance' and activated then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        local streetnames = GetStreetNames(coords)
        SendNUIMessage({
            content = '['..id..'] ' ..text.."<br />" ..streetnames.street1..", " ..streetnames.street2;
            callnum = callnum;
            totalcalls = totalcalls;
            newambualert = true;
            newalert = true;
            id = id;
        })
        table.insert(calls, {text = '['..id..'] ' ..text.. "<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords})
        PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
        SetTimeout(300000, function()
            borrar_alerta()
        end)
    end
    
end)
RegisterNetEvent("origen_dispatch:taxiToClient")
AddEventHandler("origen_dispatch:taxiToClient", function(text, coords, id)
    if PlayerJob.name == 'taxi' and activated then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        local streetnames = GetStreetNames(coords)
        SendNUIMessage({
            content = text.. "<br />Tlf: " ..PlayerPhone.. "<br />" ..streetnames.street1..", " ..streetnames.street2;
            callnum = callnum;
            totalcalls = totalcalls;
            newtaxialert = true;
            newalert = true;
            id = id;
        })
        table.insert(calls, {text = text.. "<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords})
        PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
        SetTimeout(300000, function()
            borrar_alerta()
        end)
    end
    
end)


RegisterNetEvent("origen_dispatch:mecaToClient")
AddEventHandler("origen_dispatch:mecaToClient", function(text, coords, id)
    if PlayerJob.name == 'lscustom' or PlayerJob.name == 'bennys' or PlayerJob.name == 'flywheels' or PlayerJob.name == 'paletomonkey' or PlayerJob.name == 'northwayautos' and activated then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        local streetnames = GetStreetNames(coords)
        SendNUIMessage({
            content = text.. "<br />Tlf: " ..PlayerPhone.. "<br />" ..streetnames.street1..", " ..streetnames.street2;
            callnum = callnum;
            totalcalls = totalcalls;
            newmecaalert = true;
            newalert = true;
            id = id;
        })
        table.insert(calls, {text = text.. "<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords})
        PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
        SetTimeout(300000, function()
            borrar_alerta()
        end)
    end
    
end)


RegisterNetEvent("origen_dispatch:robberyToClient")
AddEventHandler("origen_dispatch:robberyToClient", function(type, coords, id)
    local id_ = id
    if PlayerJob.name == 'police' and activated then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        local streetnames = GetStreetNames(coords)
        if Config.enableRobberyPics then
            if type == "247" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en un 24/7, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = 247;
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en un 24/7, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords, model = 247})
            elseif type == "vangelico" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en la joyería, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "vangelico";
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en la joyería, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords, model = "vangelico"})
            elseif type == "ammunation" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en un AmmuNation, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "ammunation";
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en un AmmuNation, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords, model = "ammunation"})
            elseif type == "fleeca" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en un Fleeca, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "fleeca";
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en un Fleeca, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords, model = "fleeca"})
            elseif type == "humane" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en los laboratorios Humane, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "humane";
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en los laboratorios Humane, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords, model = "humane"})
            elseif type == "pacific" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en el Pacific Standard, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "pacific";
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en el Pacific Standard, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords, model = "pacific"})
            end
        else
            if type == "247" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en un 24/7, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;

                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en un 24/7, porfavor acudan<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords})
                PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
                SetTimeout(300000, function()
                    borrar_alerta()
                end)
            elseif type == "vangelico" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en la joyería, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;
                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en la joyería, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords})
                PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
                SetTimeout(300000, function()
                    borrar_alerta()
                end)
            elseif type == "ammunation" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en un AmmuNation, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;
                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en un AmmuNation, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords})
                PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
                SetTimeout(300000, function()
                    borrar_alerta()
                end)
            elseif type == "fleeca" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en un Fleeca, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;
                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en un Fleeca, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords})
                PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
                SetTimeout(300000, function()
                    borrar_alerta()
                end)
            elseif type == "humane" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en los laboratorios Humane, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;
                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en los laboratorios Humane, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords})
                PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
                SetTimeout(300000, function()
                    borrar_alerta()
                end)
            elseif type == "pacific" then
                SendNUIMessage({
                    content = "["..id_.."] Se ha disparado una alarma en el Pacific Standard, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2;
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;
                    id = id;
                })
                table.insert(calls, {text = "["..id_.."] Se ha disparado una alarma en el Pacific Standard, porfavor acudan!<br />" ..streetnames.street1..", " ..streetnames.street2, coords = coords})
                PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
                SetTimeout(300000, function()
                    borrar_alerta()
                end)
            end
        end
    end
end)

RegisterCommand("forzar", function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    local coords = GetEntityCoords(PlayerPedId())
    local id = GetPlayerServerId(PlayerId())
    local color = GetVehicleColor(vehicle)
    local plate = QBCore.Math.Trim(GetVehicleNumberPlateText(vehicle))
    local r, g, b = GetVehicleColor(vehicle)
    local klk = tostring(color)
    local finalColor = Config.Colors[klk]
    local playerCoords = GetEntityCoords(PlayerPedId())
    if IsPedInAnyVehicle(ped) then
        -- local suerte = math.random(0,1)
        -- if suerte then
        --     TriggerServerEvent("origen_dispatch:sendVehRob", coords, model, finalColor, id, r, g, b, plate)
        --     TriggerServerEvent('origen_dispatch:blip',{
        --         x = Math.Round(playerCoords.x, 1),
        --         y = Math.Round(playerCoords.y, 1),
        --         z = Math.Round(playerCoords.z, 1)
        --     }, 'forzar')
        --     --ExecuteCommand('ooc Se ha enviado una llamada de entorno')
        --     TriggerServerEvent('origen_dispatch:mensaje_chat')
        --     TriggerServerEvent('origen_dispatch:forzarlog', coords, model, finalColor, id, r, g, b, plate)
        -- else
        --     --ExecuteCommand('ooc Se ha enviado una llamada de entorno')
        --     TriggerServerEvent('origen_dispatch:mensaje_chat')
        --     TriggerServerEvent('origen_dispatch:forzarlog', coords, model, finalColor, id, r, g, b, plate)
        -- end

        TriggerServerEvent("origen_dispatch:sendVehRob", coords, model, finalColor, id, r, g, b, plate)
        TriggerServerEvent('origen_dispatch:blip',{
            x = QBCore.Math.Round(playerCoords.x, 1),
            y = QBCore.Math.Round(playerCoords.y, 1),
            z = QBCore.Math.Round(playerCoords.z, 1)
        }, 'forzar')
        --ExecuteCommand('ooc Se ha enviado una llamada de entorno')
        TriggerServerEvent('origen_dispatch:mensaje_chat')
        TriggerServerEvent('origen_dispatch:forzarlog', coords, model, finalColor, id, r, g, b, plate)
    end
end, false)

RegisterNetEvent('origen_dispatch:createblip')
AddEventHandler('origen_dispatch:createblip', function(targetCoords, id, type)
    local Player = QBCore.Functions.GetPlayerData()
    if Player ~= nil then
        if type == 'entorno' or type == 'forzar' or type == 'robobancocentral' or type == 'robojoyeria' or type == 'roboyate' or type == 'robolife' or type == 'robopelu' or type == 'roboammu' or type == 'robotienda' or type == 'fleeca' or type == 'ventadroga' or type == 'roboimportación' then
            if PlayerJob ~= nil then
                if PlayerJob.name == 'police' and activated then
                    local alpha = 250
                    local call = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)
                    if type == 'entorno' then
                        SetBlipSprite(call, 304)
                        SetBlipColour (call, 3)
                    elseif type == 'forzar' then
                        SetBlipSprite(call, 380)
                        SetBlipColour (call, 36)
                    elseif type == 'robobancocentral' then
                        SetBlipSprite(call, 108)
                        SetBlipColour (call, 1)
                    elseif type == 'robojoyeria' then
                        SetBlipSprite(call, 674)
                        SetBlipColour (call, 1)
                    elseif type == 'roboyate' then
                        SetBlipSprite(call, 455)
                        SetBlipColour (call, 1)
                    elseif type == 'robolife' then
                        SetBlipSprite(call, 606)
                        SetBlipColour (call, 1)
                    elseif type == 'robopelu' then
                        SetBlipSprite(call, 304)
                        SetBlipColour (call, 1)
                    elseif type == 'roboammu' then
                        SetBlipSprite(call, 110)
                        SetBlipColour (call, 1)
                    elseif type == 'robotienda' then
                        SetBlipSprite(call, 52)
                        SetBlipColour (call, 1)
                    elseif type == 'fleeca' then
                        SetBlipSprite(call, 207)
                        SetBlipColour (call, 1)
                    elseif type == 'ventadroga' then
                        SetBlipSprite(call, 140)
                        SetBlipColour (call, 82)
                    elseif type == 'roboimportación' then
                        SetBlipSprite(call, 229)
                        SetBlipColour (call, 1)
                    end

                    SetBlipDisplay(call, 4)
                    SetBlipScale  (call, 1.0)
                    SetBlipAsShortRange(call, true)
                    SetBlipAlpha(call, alpha)

                    SetBlipHighDetail(call, true)
                    SetBlipAsShortRange(call, true)
                    BeginTextCommandSetBlipName('STRING')
                    AddTextComponentString('Llamada de Entorno - '..id)
                    EndTextCommandSetBlipName(call)

                    while alpha ~= 0 do
                        Citizen.Wait(1000 * 2)
                        alpha = alpha - 1
                        SetBlipAlpha(call, alpha)

                        if alpha == 0 then
                            RemoveBlip(call)
                            return
                        end
                    end
                end
            elseif type == 'auxilio' then
                if PlayerJob.name == 'ambulance' and activated then
                    local alpha = 250
                    local call = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)
                    if type == 'auxilio' then
                        SetBlipSprite(call, 304)
                        SetBlipColour (call, 34)
                    end

                    SetBlipDisplay(call, 4)
                    SetBlipScale  (call, 1.2)
                    SetBlipAsShortRange(call, true)
                    SetBlipAlpha(call, alpha)

                    SetBlipHighDetail(call, true)
                    SetBlipAsShortRange(call, true)
                    BeginTextCommandSetBlipName('STRING')
                    AddTextComponentString('Auxilio - '..id)
                    EndTextCommandSetBlipName(call)

                    while alpha ~= 0 do
                        Citizen.Wait(100 * 4)
                        alpha = alpha - 1
                        SetBlipAlpha(call, alpha)

                        if alpha == 0 then
                            RemoveBlip(call)
                            return
                        end
                    end            
                end
            elseif type == 'taxi' then
                if PlayerJob.name == 'taxi' and activated then
                    local alpha = 250
                    local call = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)
                    if type == 'taxi' then
                        SetBlipSprite(call, 162)
                        SetBlipColour (call, 33)
                    end

                    SetBlipDisplay(call, 4)
                    SetBlipScale  (call, 1.2)
                    SetBlipAsShortRange(call, true)
                    SetBlipAlpha(call, alpha)

                    SetBlipHighDetail(call, true)
                    SetBlipAsShortRange(call, true)
                    BeginTextCommandSetBlipName('STRING')
                    AddTextComponentString('Llamada - '..id)
                    EndTextCommandSetBlipName(call)

                    while alpha ~= 0 do
                        Citizen.Wait(100 * 4)
                        alpha = alpha - 1
                        SetBlipAlpha(call, alpha)

                        if alpha == 0 then
                            RemoveBlip(call)
                            return
                        end
                    end
                end
            elseif type == 'meca' then
                if PlayerJob.name == 'lscustom' or PlayerJob.name == 'bennys' or PlayerJob.name == 'flywheels' or PlayerJob.name == 'paletomonkey' or PlayerJob.name == 'nortwayautos' or PlayerJob.name == 'hayesauto' or PlayerJob.name == 'mayerautos' and activated then
                    local alpha = 250
                    local call = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)
                    if type == 'meca' then
                        SetBlipSprite(call, 162)
                        SetBlipColour (call, 38)
                    end

                    SetBlipDisplay(call, 4)
                    SetBlipScale  (call, 1.2)
                    SetBlipAsShortRange(call, true)
                    SetBlipAlpha(call, alpha)

                    SetBlipHighDetail(call, true)
                    SetBlipAsShortRange(call, true)
                    BeginTextCommandSetBlipName('STRING')
                    AddTextComponentString('Llamada - '..id)
                    EndTextCommandSetBlipName(call)

                    while alpha ~= 0 do
                        Citizen.Wait(100 * 4)
                        alpha = alpha - 1
                        SetBlipAlpha(call, alpha)

                        if alpha == 0 then
                            RemoveBlip(call)
                            return
                        end
                    end
                end
            end
        end
    end
end)

RegisterCommand("tiroteo", function(source, args)
    local text = "Se ha visto a varias personas de color " .. args[1] .. " y " .. args[2] .. " tiroteándose con armas de fuego."
    local coords = GetEntityCoords(PlayerPedId())
    local id = GetPlayerServerId(PlayerId())
    local playerCoords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("origen_dispatch:sendAlert", text, coords, id)
    TriggerServerEvent('origen_dispatch:blip',{
        x = QBCore.Math.Round(playerCoords.x, 1),
        y = QBCore.Math.Round(playerCoords.y, 1),
        z = QBCore.Math.Round(playerCoords.z, 1)
    }, 'entorno')
    --ExecuteCommand('ooc Se ha enviado una llamada de entorno')
    TriggerServerEvent('origen_dispatch:mensaje_chat')
end, false)


RegisterCommand("entorno", function(source, args)
    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    local id = GetPlayerServerId(PlayerId())
    local playerCoords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("origen_dispatch:sendAlert", text, coords, id)
    TriggerServerEvent('origen_dispatch:blip',{
        x = QBCore.Math.Round(playerCoords.x, 1),
        y = QBCore.Math.Round(playerCoords.y, 1),
        z = QBCore.Math.Round(playerCoords.z, 1)
    }, 'entorno')
    --ExecuteCommand('ooc Se ha enviado una llamada de entorno')
    TriggerServerEvent('origen_dispatch:mensaje_chat')
end, false)


RegisterCommand('polidispo', function(source, args)
    local coords = vector3(135.82,-749.15,258.15)
    local id = GetPlayerServerId(PlayerId())
    local text = "El servicio de Inteligencia informa de un posible robo"
    local playerCoords = vector3(135.82,-749.15,258.15)
    TriggerServerEvent("origen_dispatch:sendAlert", text, coords, id)
    TriggerServerEvent('origen_dispatch:blip',{
        x = QBCore.Math.Round(playerCoords.x, 1),
        y = QBCore.Math.Round(playerCoords.y, 1),
        z = QBCore.Math.Round(playerCoords.z, 1)
    }, 'entorno')
    --ExecuteCommand('ooc Se ha enviado una llamada de entorno')
    TriggerServerEvent('origen_dispatch:mensaje_chat')
end, false)


RegisterCommand("right", function()
    if calls[callnum + 1] ~= nil then
        local num = callnum + 1
        if calls[callnum + 1]['model'] ~= nil then
            SendNUIMessage({
                content = calls[callnum + 1]['text'];
                callnum = num;
                right = true;
                pic = true;
                model = calls[callnum + 1]['model'];
            })
        else
            SendNUIMessage({
                content = calls[callnum + 1]['text'];
                callnum = num;
                right = true;
            })
        end
        callnum = callnum + 1
        gpsmarcado = false
    end
end, false)

RegisterCommand("left", function()
    if calls[callnum - 1] ~= nil then
        local num = callnum - 1
        if calls[callnum - 1]['model'] ~= nil then
            SendNUIMessage({
                content = calls[callnum - 1]['text'];
                callnum = num;
                left = true;
                pic = true;
                model = calls[callnum - 1]['model'];
            })
        else
            SendNUIMessage({
                content = calls[callnum - 1]['text'];
                callnum = num;
                left = true;
            })
        end
        callnum = callnum - 1
        gpsmarcado = false
    end
end, false)

RegisterCommand("mover", function(source, args)
    if showed then 

        if not movingDispatch then
            QBCore.UI.Menu.CloseAll()
            SetNuiFocus(true, true)
            SendNUIMessage({
                inConfig = true;
            })
            movingDispatch = true
        else
            SetNuiFocus(false, false)
            SendNUIMessage({
                inConfig = false;
            })
            movingDispatch = false
        end
        
    end
end, false)

RegisterCommand("acceptentorno", function(source, args)
    if showed then
        if callnum ~= 0 and gpsmarcado == false then
            SetNewWaypoint(calls[callnum]['coords'])
            QBCore.Functions.Notify('Se ha marcado la posición en tu ~r~GPS')
            SendNUIMessage({
                avkey = true;
            })
            gpsmarcado = true
        elseif gpsmarcado then
            SetWaypointOff()
            QBCore.Functions.Notify('Se ha desmarcado la posición en tu ~r~GPS')
            SendNUIMessage({
                avkey = true;
            })
            gpsmarcado = false
        end
    end
end, false)

RegisterKeyMapping("mover", ("Configuración"), 'keyboard', 'i')

RegisterKeyMapping("right", ("Mover entorno a la derecha"), 'keyboard', 'right')

RegisterKeyMapping("left", ("Mover entorno a la izquierda"), 'keyboard', 'left')

RegisterKeyMapping("showalerts", ("Abrir el dispatch"), 'keyboard', 'u')

RegisterKeyMapping("acceptentorno", ("Marcar el entorno"), 'keyboard', 'o')

RegisterNUICallback("exit", function()
    SetNuiFocus(false, false)
    if checkTable(calls) then
        if calls[callnum]['model'] == nil then
            SendNUIMessage({
                content = calls[callnum]['text'];
                callnum = num;
            })
        else

            SendNUIMessage({
                content = calls[callnum]['text'];
                callnum = num;
                pic = true;
                model = calls[callnum]['model'];
            })
        end
    else
        if checkTable(calls) then
            SendNUIMessage({
                content = calls[callnum]['text'];
                callnum = num;
            })
        else
            SendNUIMessage({
                content = "Sin llamadas recibidas";
                callnum = num;
            })
        end
    end
end)

RegisterNUICallback("tooglepic", function()
    if Config.enableVehiclePics then
        Config.enableVehiclePics = false
        QBCore.Functions.Notify('Las imagenes han sido desactivadas')
    else
        Config.enableVehiclePics = false -- Poner en true si quereis que el jugador pueda activar las imagenes desde el menu de config
        QBCore.Functions.Notify('Las imagenes han sido activadas')
    end
end)

RegisterNUICallback("deletealerts", function()
    callnum = 0
    totalcalls = 0
    calls = {}
    SendNUIMessage({
        content = "Sin llamadas recibidas";
        restart = true;
        newalert = false;
        
    })
    QBCore.Functions.Notify('Todas las alertas han sido borradas')
end)

RegisterNUICallback("togglealerts", function()
    if activated then
        activated = false
        QBCore.Functions.Notify('Las alertas han sido desactivadas')
    else
        activated = true
        QBCore.Functions.Notify('Las notificaciones han sido activadas')
    end
end)

RegisterNUICallback("deletealert", function(cb)
    totalcalls = totalcalls - 1
    if (cb.selectedId + 1) == callnum then
        if checkTable(calls) then
            if calls[callnum]['model'] ~= nil then
                SendNUIMessage({
                    content = calls[callnum]['text'];
                    callnum = num;
                    totalcalls = totalcalls;
                    pic = true;
                    model = calls[callnum]['model'];
                })
                
            else
                if calls[callnum + 1] ~= nil then
                    SendNUIMessage({
                        content = calls[callnum + 1]['text'];
                        callnum = num;
                        totalcalls = totalcalls;
                    })
                    callnum = callnum + 1
                elseif calls[callnum - 1] ~= nil then
                    local num = callnum - 1
                    SendNUIMessage({
                        content = calls[callnum - 1]['text'];
                        callnum = num;
                        totalcalls = totalcalls;
                    })
                    callnum = callnum - 1
                else

                    callnum = 0
                    totalcalls = 0
                    calls = {}
                    SendNUIMessage({
                        content = "Sin llamadas recibidas";
                        restart = true;
                        newalert = false;
                        
                    })
                end
            end
        end
    else
        callnum = callnum - 1
        SendNUIMessage({
            callnum = callnum;
            totalcalls = totalcalls;
        })
    end
    table.remove(calls, cb.selectedId + 1)
    
end)

function checkTable(table)
    local init = false
    for k,v in pairs(table) do
        init = true
    end
    if init then
        return true
    else
        return false
    end
end



local timing, isPlayerWhitelisted = math.ceil(Config.Timer * 60000), false
local streetName, playerGender
local pixelTimer = 5000
local coords = nil
local pixelMark = false

--zonas sin alertas
--ammu zancudo
-- local ammuzancudo = PolyZone:Create({
-- 	vector2(828.04467773438, -2162.259765625),
--   	vector2(815.1083984375, -2162.4931640625),
--   	vector2(815.1083984375, -2165.3728027344),
--   	vector2(828.02850341797, -2165.2229003906)
--   }, {
-- 	name="ammuzancudo",
-- 	minZ = 28.619020462036,
-- 	maxZ = 31.656896591187,
-- 	debugGrid=false,
--     gridDivisions=25
--   }
-- )

-- --ammu ciudad
-- local ammuciudad = PolyZone:Create({
-- 	vector2(7.0950231552124, -1096.0167236328),
--   	vector2(19.241334915161, -1100.4770507812),
--   	vector2(20.241334915161, -1097.8975830078),
--   	vector2(7.9189615249634, -1093.6114501953)
--   }, {
-- 	name="ammuciudad",
-- 	minZ = 28.619020462036,
-- 	maxZ = 31.656896591187,
-- 	debugGrid=false,
--     gridDivisions=25
--   }
-- )

--yate
local yate = PolyZone:Create({
	vector2(-2008.37, -1055.04),
  	vector2(-2001.16, -1028.08),
  	vector2(-2135.69, -988.05),
  	vector2(-2144.42, -1020.98)
  }, {
	name="yate",
	minZ = -02.05,
	maxZ = 30.00,
	debugGrid=false,
    gridDivisions=25
  }
)

--torre admin
local torreadmin = PolyZone:Create({
	vector2(-88.87, -829.0),
  	vector2(-93.51, -813.56),
  	vector2(-57.36, -803.19),
  	vector2(-54.02, -826.65)
  }, {
	name="torreadmin",
	minZ = 313.51,
	maxZ = 335.6,
	debugGrid=false,
    gridDivisions=25
  }
)

--Cayo Perico
local cayoperico = PolyZone:Create({
	vector2(3544.76, -4360.27),
  	vector2(5086.49, -3776.34),
  	vector2(6104.07, -5853.47),
  	vector2(4191.93, -6800.23)
  }, {
	name="cayoperico",
	minZ = -25.00,
	maxZ = 150.0,
	debugGrid=false,
    gridDivisions=25
  }
)

--Name: paintball | 2021-06-28T22:17:45Z
local paintball = PolyZone:Create({
	vector2(-1125.6396484375, -1261.6782226563),
	vector2(-1125.6290283203, -1220.6259765625),
	vector2(-1124.4392089844, -1220.7429199219),
	vector2(-1123.7032470703, -1220.9796142578),
	vector2(-1123.5847167969, -1231.0257568359),
	vector2(-1117.2487792969, -1231.3729248047),
	vector2(-1117.2476806641, -1218.3680419922),
	vector2(-1124.498046875, -1218.3680419922),
	vector2(-1125.6401367188, -1215.9913330078),
	vector2(-1178.8214111328, -1215.9925537109),
	vector2(-1179.0910644531, -1255.2530517578),
	vector2(-1181.1468505859, -1243.0340576172),
	vector2(-1187.7041015625, -1242.6791992188),
	vector2(-1187.6920166016, -1257.6638183594),
	vector2(-1180.2241210938, -1257.6391601563),
	vector2(-1178.4938964844, -1261.6771240234)
  }, {
	name="paintball",
	minZ = -82.970603942871,
	maxZ = -75.970474243164,
	debugGrid=false
  })

--Name: maria | Tue May 18 2021
local maria = CircleZone:Create(vector2(-1089.39, 4922.73), 103.06, {
	name="maria"
})

--Name: venta de armas | Tue May 18 2021
local armero = CircleZone:Create(vector2(1528.79, 1698.48), 64.61, {
	name="venta de armas"
})

--Name: tortugas | Tue May 18 2021
local tortugas = CircleZone:Create(vector2(-100.00, 6169.70), 25.90, {
	name="tortugas"
})

--combinar zonas
local zonascalientes = ComboZone:Create({maria, armero, tortugas, yate, torreadmin, cayoperico, paintball}, {name="zonascalientes", debugPoly=false})
--fin zonas sin alertas

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		if NetworkIsSessionStarted() then
			DecorRegister('isOutlaw', 3)
			DecorSetInt(PlayerPedId(), 'isOutlaw', 1)

			break
		end
	end
end)

-- -- Gets the player's current street.
-- -- Aaalso get the current player gender
-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(3000)

-- 		local playerCoords = GetEntityCoords(PlayerPedId())
-- 		streetName,street2 = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
-- 		streetName = GetStreetNameFromHashKey(streetName)..' | '..GetStreetNameFromHashKey(street2)
-- 	end
-- end)

function refreshPlayerWhitelisted()
    local xPlayer = QBCore.Functions.GetPlayerData()
    if xPlayer.job.name == 'police' then
        return true
    else
	    return false
    end
end


RegisterNetEvent('esx_outlawalert:outlawNotify')
AddEventHandler('esx_outlawalert:outlawNotify', function(type, data, length)
    if showAlerts == true then
        if isPlayerWhitelisted and muted == false then
            
            local sex = nil
            if sex == 1 then
                sex = "Mujer"
            else
                sex = "Hombre"
            end
            TriggerEvent("origen_notify:SendNotification", {
                text = data.name .. " " .. data.loc.. " " .. sex .. " </br> <span style='font-size:0.8em;'>Pulsa <span style='font-weight:bold;'>M</span> para aceptar</span>",
                type = "disparos",
                timeout = math.random(5000, 10000),
                layout = "topRight",
                queue = "disparos"
            })
            PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1) 

        elseif isPlayerWhitelisted and muted == true then
            local sex = nil
            if sex == 1 then
                sex = "Mujer"
            else
                sex = "Hombre"
            end
            TriggerEvent("origen_notify:SendNotification", {
                text = data.name .. " " .. data.loc.. " " .. sex .. " </br> <span style='font-size:0.8em;'>Pulsa <span style='font-weight:bold;'>M</span> para aceptar</span>",
                type = "disparos",
                timeout = math.random(5000, 10000),
                layout = "topRight",
                queue = "disparos"
            })
        end
    end
end)

RegisterCommand('mutealerts', function()
    muted = not muted
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)

		if DecorGetInt(PlayerPedId(), 'isOutlaw') == 2 then
			Citizen.Wait(timing)
			DecorSetInt(PlayerPedId(), 'isOutlaw', 1)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local wait = 800

		local playerPed = PlayerPedId()
		if IsPedArmed(playerPed, 7) then
			wait = 0
			if IsPedShooting(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and Config.GunshotAlert then
				local playerCoords = GetEntityCoords(playerPed)
				streetName,street2 = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
				streetName = GetStreetNameFromHashKey(streetName)..' | '..GetStreetNameFromHashKey(street2)
				Wait(3000)
               
                if (isPlayerWhitelisted and Config.ShowCopsMisbehave and not (GetCurrentPedWeapon(PlayerPedId() == 600439132))) or not isPlayerWhitelisted and not zonascalientes:isPointInside(playerCoords) then
                    DecorSetInt(playerPed, 'isOutlaw', 2)
                    local inVeh = {'Civil', ''}
                    if(IsPedInAnyVehicle(playerPed)) then local vehicle = GetVehiclePedIsIn(playerPed) local color = GetVehicleColours(vehicle) local r, g, b = GetVehicleColor(vehicle) local color2 = r..', '..g..', '..b inVeh = {GetVehicleNumberPlateText(vehicle), Config.Colors[tonumber(color)], color2} end 
                    TriggerServerEvent('esx_outlawalert:gunshotInProgress', {
                        x = QBCore.Math.Round(playerCoords.x, 1),
                        y = QBCore.Math.Round(playerCoords.y, 1),
                        z = QBCore.Math.Round(playerCoords.z, 1)
                    }, streetName, playerGender, inVeh)
                end

			end
		end
		Wait(wait)
	end
end)




RegisterNetEvent('esx_outlawalert:carJackInProgress')
AddEventHandler('esx_outlawalert:carJackInProgress', function(targetCoords)
    if isPlayerWhitelisted then
        if Config.CarJackingAlert then
            local alpha = 250
            local thiefBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipJackingRadius)
            pixelTimer = 500 pcoords = targetCoords pixelMark = true
            SetBlipHighDetail(thiefBlip, true)
            SetBlipColour(thiefBlip, 1)
            SetBlipAlpha(thiefBlip, alpha)
            SetBlipAsShortRange(thiefBlip, true)

            while alpha ~= 0 do
                Citizen.Wait(Config.BlipJackingTime * 4)
                alpha = alpha - 1
                SetBlipAlpha(thiefBlip, alpha)

                if alpha == 0 then
                    RemoveBlip(thiefBlip)
                    return
                end
            end

        end
    end
end)

RegisterNetEvent('esx_outlawalert:gunshotInProgress')
AddEventHandler('esx_outlawalert:gunshotInProgress', function(targetCoords)
    if isPlayerWhitelisted and Config.GunshotAlert then
        local alpha = 250
        local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipGunRadius)
        pixelTimer = 500 pcoords = targetCoords pixelMark = true
        SetBlipHighDetail(gunshotBlip, true)
        SetBlipColour(gunshotBlip, 1)
        SetBlipAlpha(gunshotBlip, alpha)
        SetBlipAsShortRange(gunshotBlip, true)

        while alpha ~= 0 do
            Citizen.Wait(Config.BlipGunTime * 3)
            alpha = alpha - 1
            SetBlipAlpha(gunshotBlip, alpha)

            if alpha == 0 then
                RemoveBlip(gunshotBlip)
                return
            end
        end
    end
end)

RegisterNetEvent('esx_outlawalert:combatInProgress')
AddEventHandler('esx_outlawalert:combatInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.MeleeAlert then
		local alpha = 250
		local meleeBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipMeleeRadius)
		pixelTimer = 500 pcoords = targetCoords pixelMark = true
		SetBlipHighDetail(meleeBlip, true)
		SetBlipColour(meleeBlip, 17)
		SetBlipAlpha(meleeBlip, alpha)
		SetBlipAsShortRange(meleeBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipMeleeTime * 2)
			alpha = alpha - 1
			SetBlipAlpha(meleeBlip, alpha)

			if alpha == 0 then
				RemoveBlip(meleeBlip)
				return
			end
		end
	end
end)
-- edited by uPixelar for www.enoroleplay.com and for God's Sake

Citizen.CreateThread(function()
	while true do
		if pixelMark then
			pixelTimer = pixelTimer-1
			if(IsControlJustPressed(0, 244)) then
				SetNewWaypoint(pcoords.x, pcoords.y)
				PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
				pixelMark = false
				pixelTimer = 0
			end
			if(pixelTimer == 0) then 
				pixelMark = false
			end
		end
		Citizen.Wait(1)
	end
end)


RegisterNetEvent('origen_dispatch:client:togglealertsadmin')
AddEventHandler('origen_dispatch:client:togglealertsadmin', function(boolean)
	toggleAlertsAdmin = boolean
end)
