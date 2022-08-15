QBCore = nil 

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent("origen_dispatch:sendAlert")
AddEventHandler("origen_dispatch:sendAlert", function(text, coords, id)
    TriggerClientEvent("origen_dispatch:alertToClient", -1, text, coords, id)
end)

RegisterServerEvent("origen_dispatch:sendAmbuAlert")
AddEventHandler("origen_dispatch:sendAmbuAlert", function(text, coords, id)
    TriggerClientEvent("origen_dispatch:auxToClient", -1, text, coords, id)
end)

RegisterServerEvent("origen_dispatch:sendMecaAlert")
AddEventHandler("origen_dispatch:sendMecaAlert", function(text, coords, id)
    TriggerClientEvent("origen_dispatch:mecaToClient", -1, text, coords, id)
end)

RegisterServerEvent("origen_dispatch:sendVehRob")
AddEventHandler("origen_dispatch:sendVehRob", function(coords, model, color, id)
    TriggerClientEvent("origen_dispatch:vehToClient", -1, coords, model, color, id)
end)

RegisterServerEvent("origen_dispatch:sendTaxiaAlert")
AddEventHandler("origen_dispatch:sendTaxiaAlert", function(text, coords, id)
    TriggerClientEvent("origen_dispatch:taxiToClient", -1, text, coords, id)
end)

RegisterServerEvent("origen_dispatch:sendRobaAlert")
AddEventHandler("origen_dispatch:sendRobaAlert", function(type, coords, id)
    TriggerClientEvent("origen_dispatch:robberyToClient", -1, type, coords, id)
end)