local isInRagdoll = false

Citizen.CreateThread(function()
    while true do
        local wait = 900
        if isInRagdoll then
            wait = 0
            SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
        end
        Wait(wait)
    end
end)

RegisterCommand('ragdoll', function()
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped) then
        if isInRagdoll then
            isInRagdoll = false
        else
            isInRagdoll = true
        end
    end
end)

RegisterKeyMapping('ragdoll', "Tirarte al suelo", 'keyboard', 'z')


local handsup = false

RegisterCommand('levantarlasmanos', function()
    if not handsup then
        local dict = "random@mugging3"
    
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(100)
        end
        TaskPlayAnim(PlayerPedId(), dict, "handsup_standing_base", 8.0, 8.0, -1, 50, 0, false, false, false)
        handsup = true
    else
        handsup = false
        ClearPedTasks(PlayerPedId())
    end
end)

RegisterKeyMapping('levantarlasmanos', "Alzar las manos", 'keyboard', 'x')