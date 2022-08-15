-- Core
PlayerData = {}
PlayerJob = nil
Citizen.CreateThread(function() 
    Wait(1000)
    createPed()
    --createPeds()
end)


RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo.name
end)

-- Fin core

-- Variables

local done = 1
local money = 0

local started = false
local elec = nil
local repeated = {}
local blip
local pblip
local points = {}
local object
local attach
local notif
local done = 0


-- Fin variables

-- Threads


-- Fin threads

-- Functions

function createPed()
    startblip = AddBlipForCoord(Config.jobBlip)
    SetBlipSprite(startblip, 318)
    SetBlipColour(startblip, 0)
    SetBlipScale(startblip, 0.8)
    SetBlipAsShortRange(startblip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.blipText)
    EndTextCommandSetBlipName(startblip)

    local ped = GetHashKey('s_m_m_trucker_01')
    RequestModel(ped)

    while not HasModelLoaded(ped) do
        Citizen.Wait(1)
    end

    local cped = CreatePed("PED_TYPE_CIVMALE", ped, Config.pedCoords, Config.pedHeading, false, false)
    SetEntityAsMissionEntity(cped, true, true)
    FreezeEntityPosition(cped, true)
    SetEntityInvincible(cped, true)
    SetBlockingOfNonTemporaryEvents(cped, true)

    
    Citizen.Wait(1000)

    for k,v in pairs(Config.Act) do
        points = Config.Act.Points
    end

    for k,v in pairs(points) do
        local hash = GetHashKey(v.ped)
        RequestModel(hash)
    
        while not HasModelLoaded(hash) do
            Citizen.Wait(1)
        end

        ped = CreatePed("PED_TYPE_CIVMALE", v.ped, v.coords, v.h, false, false)
        SetEntityAsMissionEntity(ped, true, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)

        blip = AddBlipForCoord(v.coords)
        SetBlipSprite(blip, 280)
        SetBlipColour(blip, 0)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.bliptext)
        EndTextCommandSetBlipName(blip)

    end
    start()
end

Citizen.CreateThread(function()
    Citizen.Wait(10000)
    startJob()
end)

function start()
    started = false
    Citizen.CreateThread(function()
        while true do
            local wait = 1000
            local pcoords = GetEntityCoords(PlayerPedId())
            for k,v in pairs(points) do
                local dist = #(pcoords - v.coords)
                if dist < 2 and started == false then
                    --print(v.recogn)
                    if v.recogn == "Portuario" and PlayerJob == 'portuario' then
                        wait = 0
                        QBCore.Functions.HelpNotify('Presiona [~g~E~w~] para hablar con el ' .. v.recogn)
                        if IsControlJustPressed(1, 38) then
                            started = true
                            mechStart(v.coords, v.carspawn, v.veh, v.carh)
                        end
                    end
                    if v.recogn == "Electricista" and PlayerJob == 'electricista' then
                        wait = 0
                        QBCore.Functions.HelpNotify('Presiona [~g~E~w~] para hablar con el ' .. v.recogn)
                        if IsControlJustPressed(1, 38) then
                            started = true
                            elecStart(v.coords, v.carspawn, v.veh, v.carh)
                        end
                    end
                    if v.recogn == "Granjero" and PlayerJob == 'granjero' then
                        wait = 0
                        QBCore.Functions.HelpNotify('Presiona [~g~E~w~] para hablar con el ' .. v.recogn)
                        if IsControlJustPressed(1, 38) then
                            started = true
                            farmStart(v.coords, v.carspawn, v.veh, v.carh)
                        end
                    end
                    if v.recogn == "Ganadero" and PlayerJob == 'ganadero' then
                        wait = 0
                        QBCore.Functions.HelpNotify('Presiona [~g~E~w~] para hablar con el ' .. v.recogn)
                        if IsControlJustPressed(1, 38) then
                            started = true
                            ganStart(v.coord, v.carspawn, v.veh, v.carh)
                        end
                    end
                end

            end
            Citizen.Wait(wait)
        end
    end)
end


function startJob()
    local s = true
    while s do
        local wait = 1000
        local pedcoords = GetEntityCoords(PlayerPedId())
        local dist = #(pedcoords - Config.pedCoords)

        if dist < 3 then
            wait = 0
            if PlayerJob == "camionero" then
                QBCore.Functions.HelpNotify('Presiona ~r~E~w~ para hablar con el camionero', Config.pedCoords + vector3(0,0,0+2))
                if IsControlJustPressed(1, 38) then
                    getMenu()
                    s = false
                end
            end
        end
        Citizen.Wait(wait)
    end

end