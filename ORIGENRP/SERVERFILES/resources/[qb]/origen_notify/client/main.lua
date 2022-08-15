local loadingScreenFinished = false
local openIdcard = false
local statusNotify = false

RegisterNetEvent('origen_notify:ShowNotification')
AddEventHandler('origen_notify:ShowNotification', function(text, title)
  if statusNotify == true then
    while true do
      Wait(100)
      if statusNotify == false then
        break
      end
    end
  end
  if title == nil then
    title = "Notificación"
  end
  SendNUIMessage({
    action = "SendNotification",
    text = text,
    title = title
  })
end)

RegisterNetEvent('notify:client:statusNotify')
AddEventHandler('notify:client:statusNotify', function(bool)
  statusNotify = bool
end)

RegisterCommand("quinox", function()
  TriggerEvent('origen_notify:ShowNotification', "¡TEST!", "Easter Egg")
end, false)

RegisterNetEvent('origen_notify:ShowHelpNotification')
AddEventHandler('origen_notify:ShowHelpNotification', function(text)
 
  SendNUIMessage({
     action = "SendHelpNotification",
     text = text,
  })
  
end)

RegisterNetEvent('origen_notify:SendNotification')
AddEventHandler('origen_notify:SendNotification', function(options)
  if statusNotify == true then
    while true do
      Wait(100)
      if statusNotify == false then
        break
      end
    end
  end
  SendNUIMessage({
    action = "SendNotification",
    text = options.text,
    type = options.type,
    queue = options.queue,
    timeout = options.timeout,
    layout = options.layout

  })
end)

RegisterNetEvent('origen_notify:SetQueueMax')
AddEventHandler('origen_notify:SetQueueMax', function(queue, value)
	SendNUIMessage({
    action = "SetQueueMax",
		queue = queue,
		value = value
	})
end)