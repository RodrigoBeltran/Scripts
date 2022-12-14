InBank = false
blips = {}
local banks
local showing = false
playerData, playerLoaded = nil, false

RegisterNetEvent('esx:Client:OnPlayerLoaded')
AddEventHandler('esx:Client:OnPlayerLoaded', function(data)
    playerData = data
    playerLoaded = true
    createBlips()
    if showing then
        showing = false
    end
end)

RegisterNetEvent('esx:Client:OnPlayerUnload')
AddEventHandler('esx:Client:OnPlayerUnload', function()
    playerLoaded = false
    playerData = nil
    banks = nil
    removeBlips()
    if showing then
        showing = false
    end
end)

RegisterNetEvent('mrs_banking:client:syncBanks')
AddEventHandler('mrs_banking:client:syncBanks', function(data)
    banks = data
    if showing then
        showing = false
    end
end)

RegisterNetEvent('mrs_banking:updateCash')
AddEventHandler('mrs_banking:updateCash', function(data)
    if playerLoaded and playerData then
        playerData.cash = data
        currentCash = playerData.cash
    end
end)

function createBlips()
    for k, v in pairs(Config.BankLocations) do
        blips[k] = AddBlipForCoord(tonumber(v.x), tonumber(v.y), tonumber(v.z))
        SetBlipSprite(blips[k], Config.Blip.blipType)
        SetBlipDisplay(blips[k], 4)
        SetBlipScale  (blips[k], 0.8)
        SetBlipColour (blips[k], Config.Blip.blipColor)
        SetBlipAsShortRange(blips[k], true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(tostring(Config.Blip.blipName))
        EndTextCommandSetBlipName(blips[k])
    end
end

function removeBlips()
    for k, v in pairs(Config.BankLocations) do
        RemoveBlip(blips[k])
    end
    blips = {}
end

function openAccountScreen()
    ESX.TriggerServerCallback('mrs_banking:getBankingInformation', function(banking)
        if banking ~= nil then
            InBank = true
            SetNuiFocus(true, true)
            SendNUIMessage({
                status = "openbank",
                information = banking
            })

            TriggerEvent("debug", 'Banking: Open UI', 'success')
        end        
    end)
end

function atmRefresh()
    ESX.TriggerServerCallback('mrs_banking:getBankingInformation', function(infor)
        InBank = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            status = "refreshatm",
            information = infor
        })
    end)
end

RegisterNetEvent('mrs_banking:openBankScreen')
AddEventHandler('mrs_banking:openBankScreen', function()
    openAccountScreen()
end)

local letSleep = true
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        letSleep = true
        if playerLoaded and ESX ~= nil and not InBank then 
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed, true)
            for k, v in pairs(Config.BankLocations) do 
                local bankDist = #(playerCoords - v)
                if bankDist < 3.0 then
                    letSleep = false

                    DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false) 

                    if bankDist < 1.0 then
                        DrawText3Ds(v.x, v.y, v.z-0.25, '~g~E~w~ - Acceder al Banco')

                        if IsControlJustPressed(0, 38) then
                            openAccountScreen()
                        end
                    end
                end
            end
        elseif InBank then
            letSleep = false
        end

        if letSleep then
            Citizen.Wait(100)
        end
    end
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('mrs_banking:transferError')
AddEventHandler('mrs_banking:transferError', function(msg)
    SendNUIMessage({
        status = "transferError",
        error = msg
    })
end)

RegisterNetEvent('mrs_banking:successAlert')
AddEventHandler('mrs_banking:successAlert', function(msg)
    SendNUIMessage({
        status = "successMessage",
        message = msg
    })
end)