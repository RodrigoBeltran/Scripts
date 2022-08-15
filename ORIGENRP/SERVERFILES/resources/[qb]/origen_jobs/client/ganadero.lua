local started = false
local gan = nil
local repeated = {}
local animalblip
local ganblip
local object
local notif
local gandone = 0
local ganveh

function ganStart(inicoords, carcoords, vehicle, carh)

    local ped = PlayerPedId()

    QBCore.Functions.Notify('Subete al vehículo que tienes delante y te voy a ir dando instrucciones')
    Citizen.Wait(2000)
    local hash = GetHashKey(vehicle)
    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end
    local ganveh = CreateVehicle(hash, carcoords, carh, true, true)
    started = true
    while true do
        local wait = 1000
        if IsPedInVehicle(ped, ganveh) and started then
            wait = 100
            createGanMarkers(ganveh)
            break
        end
        Citizen.Wait(wait)  
    end

end


function createGanMarkers(ganveh)
    if gandone ~= Config.Gan.max then 
        gan = math.random(1, Config.Gan.max)
        if repeated[gan] then 
            createGanMarkers(ganveh)
        else
            SpawnAnimal('a_c_cow', vector3(Config.Gan.locations[gan].x, Config.Gan.locations[gan].y, Config.Gan.locations[gan].z), Config.Gan.locations[gan].h)

            notif = false
            repeated[gan] = true

            point = true
        
            while point do
                local near = false
                local wait = 1500
                local pcoords = GetEntityCoords(PlayerPedId(-1))

                dista = #(pcoords - vector3(Config.Gan.locations[gan].x, Config.Gan.locations[gan].y, Config.Gan.locations[gan].z))
                if dista < 25 then
                    if not notif then
                        QBCore.Functions.Notify('Sal del vehículo para coger el cubo')
                        notif = true
                    end

                    local vehcoords = GetEntityCoords(ganveh)

                    distocar = #(pcoords - vehcoords)
                    if distocar < 3 and distocar > 0.05 then
                        wait = 0

                        if DoesEntityExist(ganveh) and not IsPedInAnyVehicle(PlayerPedId(-1)) then
                            QBCore.Functions.HelpNotify("Presiona ~r~G~w~ para sacar el cubo del vehículo", vehcoords + vector3(0.0, 0.0, 1.5))
                            if IsControlJustPressed(1, 47) then

                                RequestAnimDict("amb@prop_human_bum_bin@idle_b")
                                while not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b") do
                                    Wait(1)
                                end
                                TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, -1, 0, false, false, false)
                                Citizen.Wait(2000)
                                ClearPedTasks(PlayerPedId())
                                fobject = CreateObject(GetHashKey("prop_bucket_01a"), pcoords, true, true, true)
                                SetEntityAsMissionEntity(object)
                                AttachEntityToEntity(fobject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0, -0.1, -0.15, 0.0, 0.0, 0.0, true, true, true, false, false, true)
                                RequestAnimDict("anim@heists@box_carry@")
                                while not HasAnimDictLoaded("anim@heists@box_carry@") do
                                    Wait(1)
                                end
                                local pos = GetEntityCoords(PlayerPedId(), false)
                                TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                                Citizen.Wait(500)
                                QBCore.Functions.Notify('Ahora ve a ordeñar a la vaca')
                                ord(ganveh, fobject)

                                break
                            end
                        else 
                            near = false
                            break
                        end
                    end
                end

                Citizen.Wait(wait)
            end
        end
    else
        finishGanJob(ganveh)
    end

end

function SpawnAnimal(ped, coords, h)
    local hash = GetHashKey(ped)
    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end

    animalped = CreatePed("PED_TYPE_ANIMAL", ped, coords, h, false, false)
    SetEntityAsMissionEntity(animalped, true, true)
    SetBlockingOfNonTemporaryEvents(animalped, true)
    CreateAnimalBlip(coords)
    QBCore.Functions.Notify('Ve al lugar donde está la vaca')
end

function ord(ganveh, fobject)
    while true do 
        local wait = 1500

        local pcoords = GetEntityCoords(PlayerPedId())
        local animalcoords = GetEntityCoords(animalped)
        distgan = #(pcoords - animalcoords)
        if distgan < 15 then
            wait = 500
            if distgan < 1.5 then
                wait = 5
                QBCore.Functions.HelpNotify('Presiona ~r~G~w~ para ordeñar la vaca', animalcoords)
                if IsControlJustPressed(1, 47) then
                    ClearPedTasks(PlayerPedId())
                    DeleteObject(fobject)

                    local object = CreateObjectNoOffset(GetHashKey('prop_bucket_01a'), animalcoords + vector3(0, 0, -1.0), false, false, false)
                    FreezeEntityPosition(object, true)

                    local ped = PlayerPedId()
                    RemoveBlip(animalblip)

                    RequestAnimDict("amb@medic@standing@tendtodead@idle_a")
                    while not HasAnimDictLoaded("amb@medic@standing@tendtodead@idle_a") do
                        Wait(1)
                    end
                    TaskPlayAnim(ped, "amb@medic@standing@tendtodead@idle_a", "idle_a", 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)

                    FreezeEntityPosition(animalped, true)
                    FreezeEntityPosition(ped, true)
                    Citizen.Wait(8000)
                    FreezeEntityPosition(animalped, false)
                    FreezeEntityPosition(ped, false)
                    ClearPedTasks(ped)

                    CatchBucket(ganveh, object)
                    QBCore.Functions.HelpNotify('Ahora ve a guardar el cubo')
                    break
                end
            end
        end
        Citizen.Wait(wait)
    end
end

function CatchBucket(ganveh, object)
    while true do 
        local wait2 = 1500
        local pcoords = GetEntityCoords(PlayerPedId())
        local buckcoords = GetEntityCoords(object)

        distobucker = #(pcoords - buckcoords)
        if distobucker < 3 and distobucker > 0.05 then
            wait2 = 0
            if DoesEntityExist(ganveh) and not IsPedInAnyVehicle(PlayerPedId(-1)) then
                QBCore.Functions.HelpNotify("Presiona ~r~G~w~ para coger el cubo", buckcoords + vector3(0.0, 0.0, 0.5))
                if IsControlJustPressed(1, 47) then
                    DeleteObject(object)

                    fobject = CreateObject(GetHashKey("prop_bucket_01a"), pcoords, true, true, true)
                    SetEntityAsMissionEntity(object)
                    AttachEntityToEntity(fobject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0, -0.1, -0.15, 0.0, 0.0, 0.0, true, true, true, false, false, true)
                    RequestAnimDict("anim@heists@box_carry@")
                    while not HasAnimDictLoaded("anim@heists@box_carry@") do
                        Wait(1)
                    end
                    local pos = GetEntityCoords(PlayerPedId(), false)
                    TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                    Citizen.Wait(500)
                    QBCore.Functions.Notify('Ahora ve a guardar el cubo en el coche')
                    Save(ganveh, fobject)

                    break
                end
            else 
                near = false
                break
            end
        end

        Citizen.Wait(wait2)
    end
end

function Save(ganveh, fobject)
    local ped = PlayerPedId()

    fixed = true
    while fixed do 
        local wait3 = 1000
        local pcoords = GetEntityCoords(PlayerPedId())
        local vehcoords = GetEntityCoords(ganveh)

        distocar2 = #(pcoords - vehcoords)

        if distocar2 < 3 and distocar > 0.05 then
            wait3 = 5
            QBCore.Functions.HelpNotify("Presiona ~r~G~w~ para guardar el cubo y seguir trabajando", vehcoords + vector3(0, 0, 1.5))
            if IsControlJustPressed(1, 47) then
                DeleteObject(fobject)
                RequestAnimDict("amb@prop_human_bum_bin@idle_b")
                while not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b") do
                    Wait(1)
                end
                TaskPlayAnim(ped, "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, 8.0, -1, 0, false, false, false)
                Citizen.Wait(3000)
                ClearPedTasks(ped)
                gandone = gandone + 1
                createGanMarkers(ganveh)
                fixed = false
            end
        end
        Citizen.Wait(wait3)
    end
end

function finishGanJob(ganveh)
    QBCore.Functions.Notify('Has terminado el trabajo, dirigete de vuelta al Granero')
    CreateGanBlip(Config.Gan.FinishPoint)
    while true do
        local wait4 = 1500
        local pcoords = GetEntityCoords(PlayerPedId())
        dist = #(pcoords - Config.Gan.FinishPoint)
        if dist < 8 then
            wait4 = 250
            if dist < 2 then
                wait4 = 5
                QBCore.Functions.HelpNotify("Presiona ~g~G~w~ para dejar el vehículo y recibir la paga", Config.Gan.FinishPoint)
                if IsControlJustPressed(1, 47) then
                    DeleteVehicle(ganveh)
                    Citizen.Wait(100)
                    TriggerServerEvent('esx_actividades:pay', "ganadero")
                    Citizen.Wait(100)
                    gandone = 0
                    RemoveBlip(ganblip)
                    repeated = {}
                    start()
                    break
                end
            end
        end
        Citizen.Wait(wait4)
    end
end

function CreateGanBlip(pos)
    ganblip = AddBlipForCoord(pos.x, pos.y)
	SetBlipHighDetail(ganblip, true)
	SetBlipSprite(ganblip, 1)
	SetBlipScale(ganblip, 0.8)
	SetBlipColour(ganblip, 5)
	SetBlipRoute(ganblip, true)
	SetBlipRouteColour(ganblip, 4)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Granero")
	EndTextCommandSetBlipName(ganblip)
end

function CreateAnimalBlip(pos)
    animalblip = AddBlipForCoord(pos.x, pos.y)
	SetBlipHighDetail(animalblip, true)
	SetBlipSprite(animalblip, 1)
	SetBlipScale(animalblip, 0.8)
	SetBlipColour(animalblip, 1)
	SetBlipRoute(animalblip, true)
	SetBlipRouteColour(animalblip, 4)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Vaca")
	EndTextCommandSetBlipName(animalblip)
end

RegisterCommand("terminarganadero", function()
    --print("tes")
    RemoveBlip(ganblip)
    RemoveBlip(ganblip)
    point = false
    QBCore.Functions.Notify('Actividad cancelada')
    start()
end)
