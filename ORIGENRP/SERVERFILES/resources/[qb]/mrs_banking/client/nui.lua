RegisterNetEvent("hidemenu")
AddEventHandler("hidemenu", function()
    InBank = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = "closebank"
    })
end)

RegisterNUICallback("NUIFocusOff", function(data, cb)
    InBank = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = "closebank"
    })

    TriggerEvent("debug", 'Banking: Close UI', 'success')
end)

RegisterNetEvent('mrs_banking:client:newCardSuccess')
AddEventHandler('mrs_banking:client:newCardSuccess', function(cardno, ctype)
    SendNUIMessage({
        status = "updateCard",
        number = cardno,
        cardtype = ctype
    })

    TriggerEvent("debug", 'Banking: New ' .. ctype .. ' Card (' .. cardno .. ')', 'success')
end)

RegisterNUICallback("createSavingsAccount", function(data, cb)
    TriggerServerEvent('mrs_banking:createSavingsAccount')
    TriggerEvent("debug", 'Banking: Create Savings Account', 'success')
end)

RegisterNUICallback("doDeposit", function(data, cb)
    if tonumber(data.amount) ~= nil and tonumber(data.amount) > 0 then
        TriggerEvent("debug", 'Banking: Deposit $' .. data.amount, 'success')
        TriggerServerEvent('mrs_banking:doQuickDeposit', data.amount)
        openAccountScreen()
    end
end)

RegisterNUICallback("doWithdraw", function(data, cb)
    if tonumber(data.amount) ~= nil and tonumber(data.amount) > 0 then
        TriggerEvent("debug", 'Banking: Withdraw $' .. data.amount, 'success')
        TriggerServerEvent('mrs_banking:doQuickWithdraw', data.amount, true)
        openAccountScreen()
    end
end)

RegisterNUICallback("doATMWithdraw", function(data, cb)
    if tonumber(data.amount) ~= nil and tonumber(data.amount) > 0 then
        TriggerEvent("debug", 'ATM: Withdraw $' .. data.amount, 'success')
        TriggerServerEvent('mrs_banking:doQuickWithdraw', data.amount, false)
        openAccountScreen()
    end
end)

RegisterNUICallback("savingsDeposit", function(data, cb)
    if tonumber(data.amount) ~= nil and tonumber(data.amount) > 0 then
        TriggerEvent("debug", 'Banking: Savings Deposit ($' .. data.amount .. ')', 'success')
        TriggerServerEvent('mrs_banking:savingsDeposit', data.amount)
        openAccountScreen()
    end
end)

RegisterNUICallback("requestNewCard", function(data, cb)
    TriggerServerEvent('mrs_banking:createNewCard')
end)

RegisterNUICallback("savingsWithdraw", function(data, cb)
    if tonumber(data.amount) ~= nil and tonumber(data.amount) > 0 then
        TriggerEvent("debug", 'Banking: Savings Withdraw ($' .. data.amount .. ')', 'success')
        TriggerServerEvent('mrs_banking:savingsWithdraw', data.amount)
        openAccountScreen()
    end
end)

RegisterNUICallback("doTransfer", function(data, cb)
    if data ~= nil then
        TriggerServerEvent('mrs_banking:initiateTransfer', data)
    end
end)

RegisterNUICallback("createDebitCard", function(data, cb)
    if data.pin ~= nil then
        TriggerServerEvent('mrs_banking:createBankCard', data.pin)
    end
end)

RegisterNUICallback("lockCard", function(data, cb)
    TriggerServerEvent('mrs_banking:toggleCard', true)
end)

RegisterNUICallback("unLockCard", function(data, cb)
    TriggerServerEvent('mrs_banking:toggleCard', false)
end)

RegisterNUICallback("updatePin", function(data, cb)
    if data.pin ~= nil then 
        TriggerServerEvent('mrs_banking:updatePin', data.pin)
        TriggerEvent("debug", 'Banking: Update Pin (' .. data.pin .. ')', 'success')
    end
end)