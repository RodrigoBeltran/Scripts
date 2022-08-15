local main = { }
main.__isMenuOpened = false
main.__isLoaded = false
main.__auth = false

RegisterNUICallback("submitAnim", function(cb, post)
    if string.find(cb.animation, "walk") or string.find(cb.animation, "e ") then
        ExecuteCommand(cb.animation)
    else 
        SetFacialIdleAnimOverride(PlayerPedId(), cb.animation, 0)
    end
end)

RegisterCommand("openkeymenu2", function()
    if main.__isMenuOpened then
        SendNUIMessage({
            esc = true
        })
        main.__isMenuOpened = false
        return
    end
    if not main.__isLoaded then
        return
    end
    if not main.__auth then 
        return
    end
    main.__isMenuOpened = true
    SendNUIMessage({
        show = true
    })
    menuOpen()
end)

CreateThread(function()
    Wait(1000)
    print("[INFO] Set up started")
    for k,v in pairs(DP.Dances) do
        SendNUIMessage({
            type = "dance",
            command = "e " ..k,
            name = v[3]
        })
    end
    for k,v in pairs(DP.Emotes) do
        SendNUIMessage({
            type = "emote",
            command = "e " ..k,
            name = v[3]
        })
    end
    for k,v in pairs(DP.PropEmotes) do
        SendNUIMessage({
            type = "prop",
            command = "e " ..k,
            name = v[3]
        })
    end
    for k,v in pairs(DP.Shared) do
        SendNUIMessage({
            type = "shared",
            command = "e " ..k,
            name = v[3]
        })
    end
    for k,v in pairs(DP.Walks) do
        SendNUIMessage({
            type = "w",
            command = "walk " ..k,
            name = k
        })
    end
    for k,v in pairs(DP.Sex) do
        SendNUIMessage({
            type = "s",
            command = "e " ..k,
            name = v[3]
        })
    end
    for k,v in pairs(DP.Expressions) do
        SendNUIMessage({
            type = "m",
            command = v[2],
            name = k
        })
    end
    SendNUIMessage( { type = "finish" } )
    Wait(1000)
    SendNUIMessage({
        rigth = true
    })
    Wait(1)
    SendNUIMessage({
        left = true
    })
    Wait(1)
    SendNUIMessage({
        down = true
    })
    Wait(1)
    SendNUIMessage({
        down = true
    })
    Wait(1)
    SendNUIMessage({
        down = true
    })
    Wait(1)
    SendNUIMessage({
        down = true
    })
    Wait(1)
    SendNUIMessage({
        down = true
    })
    Wait(1)
    SendNUIMessage({
        down = true
    })
    Wait(1)
    SendNUIMessage({
        down = true
    })
    Wait(1)
    main.__isLoaded = true
    print("[INFO] Set up finished")
end)

RegisterNetEvent("motes", function(t)
    main.__auth = true
    SendNUIMessage({heyhey = t})
end)

menuOpen = function()
    CreateThread(function()
        while main.__isMenuOpened do
            Wait(0)
            if IsControlPressed(1, 172) then -- UP
                SendNUIMessage({
                    up = true
                })
                Wait(100)
            elseif IsControlPressed(1, 173) then -- Down
                SendNUIMessage({
                    down = true
                })
                Wait(100)
            elseif IsControlPressed(1, 174) then -- Left
                SendNUIMessage({
                    left = true
                })
                Wait(100)
            elseif IsControlPressed(1, 175) then -- Right
                SendNUIMessage({
                    rigth = true
                })
                Wait(100)
            elseif IsControlPressed(1, 177) then -- Delete
                SendNUIMessage({
                    esc = true
                })
                main.__isMenuOpened = false
                break
            elseif IsControlPressed(1, 176) then
                SendNUIMessage({
                    enter = true
                })
                Wait(150)
            end
        end
    end)
end

RegisterNUICallback("exit", function(cb, post)
    SetNuiFocus(false, false)
end)

RegisterKeyMapping("openkeymenu2", "Abrir menu", "keyboard", "f9")