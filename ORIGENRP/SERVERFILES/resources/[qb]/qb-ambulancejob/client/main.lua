DoScreenFadeIn(100)

inBedDict = "misslamar1dead_body"
inBedAnim = "dead_idle"

getOutDict = 'switch@franklin@bed'
getOutAnim = 'sleep_getup_rubeyes'

isLoggedIn = false

isInHospitalBed = false
canLeaveBed = true

bedOccupying = nil
bedObject = nil
bedOccupyingData = nil
currentTp = nil
usedHiddenRev = false

isBleeding = 0
bleedTickTimer, advanceBleedTimer = 0, 0
fadeOutTimer, blackoutTimer = 0, 0

legCount = 0
armcount = 0
headCount = 0

playerHealth = nil
playerArmour = nil

isDead = false

closestBed = nil

isStatusChecking = false
statusChecks = {}
statusCheckPed = nil
statusCheckTime = 0

isHealingPerson = false
healAnimDict = "mini@cpr@char_a@cpr_str"
healAnim = "cpr_pumpchest"

doctorsSet = false
doctorCount = 0

PlayerJob = {}
onDuty = false

injured = {}

BodyParts = {
    ['HEAD'] = { label = 'cabeza', causeLimp = false, isDamaged = false, severity = 0 },
    ['NECK'] = { label = 'cuello', causeLimp = false, isDamaged = false, severity = 0 },
    ['SPINE'] = { label = 'columna', causeLimp = true, isDamaged = false, severity = 0 },
    ['UPPER_BODY'] = { label = 'parte superior del cuerpo', causeLimp = false, isDamaged = false, severity = 0 },
    ['LOWER_BODY'] = { label = 'parte inferior del cuerpo', causeLimp = true, isDamaged = false, severity = 0 },
    ['LARM'] = { label = 'brazo izquierdo', causeLimp = false, isDamaged = false, severity = 0 },
    ['LHAND'] = { label = 'mano izquierda', causeLimp = false, isDamaged = false, severity = 0 },
    ['LFINGER'] = { label = 'dedos izquierdos', causeLimp = false, isDamaged = false, severity = 0 },
    ['LLEG'] = { label = 'pierna izquierda', causeLimp = true, isDamaged = false, severity = 0 },
    ['LFOOT'] = { label = 'pie izquierdo', causeLimp = true, isDamaged = false, severity = 0 },
    ['RARM'] = { label = 'brazo derecho', causeLimp = false, isDamaged = false, severity = 0 },
    ['RHAND'] = { label = 'mano derecha', causeLimp = false, isDamaged = false, severity = 0 },
    ['RFINGER'] = { label = 'dedos derechos', causeLimp = false, isDamaged = false, severity = 0 },
    ['RLEG'] = { label = 'pierna derecha', causeLimp = true, isDamaged = false, severity = 0 },
    ['RFOOT'] = { label = 'pie derecho', causeLimp = true, isDamaged = false, severity = 0 },
}

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
        local armor = GetPedArmour(ped)

        if not playerHealth then
            playerHealth = health
        end

        if not playerArmor then
            playerArmor = armor
        end

        local armorDamaged = (playerArmor ~= armor and armor < (playerArmor - Config.ArmorDamage) and armor > 0) -- Players armor was damaged
        local healthDamaged = (playerHealth ~= health) -- Players health was damaged

        local damageDone = (playerHealth - health)

        if armorDamaged or healthDamaged then
            local hit, bone = GetPedLastDamageBone(ped)
            local bodypart = Config.Bones[bone]
            local weapon = GetDamagingWeapon(ped)

            if hit and bodypart ~= 'NONE' then
                local checkDamage = false
                if damageDone >= Config.HealthDamage then
                    if weapon ~= nil then
                        if armorDamaged and (bodypart == 'SPINE' or bodypart == 'UPPER_BODY') or weapon == Config.WeaponClasses['NOTHING'] then
                            checkDamage = false -- Don't check damage if the it was a body shot and the weapon class isn't that strong
                            if armorDamaged then
                                TriggerServerEvent("hospital:server:SetArmor", GetPedArmour(ped))
                            end
                        end
    
                        if checkDamage then
    
                            if IsDamagingEvent(damageDone, weapon) then
                                --CheckDamage(ped, bone, weapon, damageDone)
                            end
                        end
                    end
                elseif Config.AlwaysBleedChanceWeapons[weapon] then
                    if armorDamaged and (bodypart == 'SPINE' or bodypart == 'UPPER_BODY') or weapon == Config.WeaponClasses['NOTHING'] then
                        checkDamage = false -- Don't check damage if the it was a body shot and the weapon class isn't that strong
                    end
                    if math.random(100) < Config.AlwaysBleedChance and checkDamage then
                        --ApplyBleed(1)
                    end
                end
            end

            -- CheckWeaponDamage(ped)
        end

        playerHealth = health
        playerArmor = armor

        Citizen.Wait(100)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait((1000 * Config.MessageTimer))
        DoLimbAlert()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        SetClosestBed()
        if isStatusChecking then
            statusCheckTime = statusCheckTime - 1
            if statusCheckTime <= 0 then
                statusChecks = {}
                isStatusChecking = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-254.88, 6324.5, 32.58)
    SetBlipSprite(blip, 61)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 0)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Hospital de Paleto")
    EndTextCommandSetBlipName(blip)

    local blip = AddBlipForCoord(304.27, -600.33, 43.28)
    SetBlipSprite(blip, 61)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 0)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Hospital de Pillbox")
    EndTextCommandSetBlipName(blip)

    -- while true do
    --     Citizen.Wait(1)
    --     if QBCore ~= nil then
    --         local pos = GetEntityCoords(PlayerPedId())
    --         local wait = 1200
    --         if #(pos - vector3(Config.Locations["checking"].x, Config.Locations["checking"].y, Config.Locations["checking"].z)) < 1.5 then
    --             wait = 0
    --             if doctorCount >= Config.MinimalDoctors then
    --                 QBCore.Functions.DrawText3D(Config.Locations["checking"].x, Config.Locations["checking"].y, Config.Locations["checking"].z, "E - Llamar al doctor")
    --             else
    --                 QBCore.Functions.DrawText3D(Config.Locations["checking"].x, Config.Locations["checking"].y, Config.Locations["checking"].z, "E - Ingresar")
    --             end
    --             if IsControlJustReleased(0, 38) then
    --                 -- if doctorCount >= Config.MinimalDoctors then
    --                 --     QBCore.Functions.Notify("Se ha enviado un aviso a los médicos de servicio. Espere.", "Error")
    --                 --     TriggerServerEvent("hospital:server:SendDoctorAlert")
    --                 -- else
    --                     TriggerEvent('animations:client:EmoteCommandStart', {"notepad"})
    --                     QBCore.Functions.Progressbar("hospital_checkin", "Revisando heridas..", 2000, false, true, {
    --                         disableMovement = true,
    --                         disableCarMovement = true,
    --                         disableMouse = false,
    --                         disableCombat = true,
    --                     }, {}, {}, {}, function() -- Done
    --                         TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    --                         local bedId = GetAvailableBed()
    --                         if bedId ~= nil then 
    --                             TriggerServerEvent("hospital:server:SendToBed", bedId, true)
    --                         else
    --                             QBCore.Functions.Notify("Las camillas están ocupadas.", "Error")
    --                         end
    --                     end, function() -- Cancel
    --                         TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    --                         QBCore.Functions.Notify("¡El registro falló!", "Error")
    --                     end)
    --                 -- end
    --             end
    --         end
            
    --         if closestBed ~= nil and not isInHospitalBed then
    --             if #(pos - vector3(Config.Locations["beds"][closestBed].coords.x, Config.Locations["beds"][closestBed].coords.y, Config.Locations["beds"][closestBed].coords.z)) < 1.5 then
    --                 wait = 0
    --                 QBCore.Functions.DrawText3D(Config.Locations["beds"][closestBed].coords.x, Config.Locations["beds"][closestBed].coords.y, Config.Locations["beds"][closestBed].coords.z + 0.3, "E - Para acostarse en la camilla")
    --                 if IsControlJustReleased(0, 38) then
    --                     if GetAvailableBed(closestBed) ~= nil then 
    --                         TriggerServerEvent("hospital:server:SendToBed", closestBed, false)
    --                     else
    --                         QBCore.Functions.Notify("Las camillas están ocupadas.", "Error")
    --                     end
    --                 end
    --             end
    --         end
    --         Wait(wait)
    --     else
    --         Citizen.Wait(1000)
    --     end
    -- end
end)

function GetAvailableBed(bedId)
    local retval = nil
    if bedId == nil then 
        for k, v in pairs(Config.Locations["beds"]) do
            if not Config.Locations["beds"][k].taken then
                retval = k
            end
        end
    else
        if not Config.Locations["beds"][bedId].taken then
            retval = bedId
        end
    end
    return retval
end

RegisterNetEvent('qb-ambulancejob:reviveFromNPC')
AddEventHandler('qb-ambulancejob:reviveFromNPC', function()
    if doctorCount >= Config.MinimalDoctors then
        TriggerServerEvent("hospital:server:SendDoctorAlert")
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"notepad"})
        QBCore.Functions.Progressbar("hospital_checkin", "Revisando heridas..", 2000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            local bedId = GetAvailableBed()
            if bedId ~= nil then 
                TriggerServerEvent("hospital:server:SendToBed", bedId, true)
            else
                QBCore.Functions.Notify("Las camillas están ocupadas.", "Error")
            end
        end, function() -- Cancel
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("¡El registro falló!", "Error")
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        if QBCore ~= nil then
            if isInHospitalBed and canLeaveBed then
                local pos = GetEntityCoords(PlayerPedId())
                QBCore.Functions.HelpNotify("E - Salir de la camilla")
                if IsControlJustReleased(0, 38) then
                    LeaveBed()
                end
            else
                Citizen.Wait(1000)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

RegisterNetEvent('hospital:client:Revive')
AddEventHandler('hospital:client:Revive', function()
    local player = PlayerPedId()

    if isDead then
        SetLaststand(false)
		local playerPos = GetEntityCoords(player, true)
        NetworkResurrectLocalPlayer(playerPos, true, true, false)
        isDead = false
        SetEntityInvincible(player, false)
    elseif InLaststand then
        local playerPos = GetEntityCoords(player, true)
        NetworkResurrectLocalPlayer(playerPos, true, true, false)
        isDead = false
        SetEntityInvincible(player, false)
        SetLaststand(false)
    end

    if isInHospitalBed then
        loadAnimDict(inBedDict)
        TaskPlayAnim(player, inBedDict , inBedAnim, 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
        SetEntityInvincible(player, true)
        canLeaveBed = true
    end

    injured = {}

    TriggerServerEvent("hospital:server:RestoreWeaponDamage")
    SetEntityMaxHealth(player, 200)
    SetEntityHealth(player, 200)
    ClearPedBloodDamage(player)
    SetPlayerSprint(PlayerId(), true)
    ResetAll()
    TriggerEvent('hud:client:ocultar-muerte')
    TriggerServerEvent('hud:server:RelieveStress', 100)
    TriggerServerEvent("hospital:server:SetDeathStatus", false)
    TriggerServerEvent("hospital:server:SetLaststandStatus", false)
    ExecuteCommand('walk reset')
    QBCore.Functions.Notify("Estas completamente sano/a de nuevo!")
end)

RegisterNetEvent('hospital:client:SetPain')
AddEventHandler('hospital:client:SetPain', function()
    --ApplyBleed(math.random(1,4))
    if not BodyParts[Config.Bones[24816]].isDamaged then
        BodyParts[Config.Bones[24816]].isDamaged = true
        BodyParts[Config.Bones[24816]].severity = math.random(1, 4)
        table.insert(injured, {
            part = Config.Bones[24816],
            label = BodyParts[Config.Bones[24816]].label,
            severity = BodyParts[Config.Bones[24816]].severity
        })
    end

    if not BodyParts[Config.Bones[40269]].isDamaged then
        BodyParts[Config.Bones[40269]].isDamaged = true
        BodyParts[Config.Bones[40269]].severity = math.random(1, 4)
        table.insert(injured, {
            part = Config.Bones[40269],
            label = BodyParts[Config.Bones[40269]].label,
            severity = BodyParts[Config.Bones[40269]].severity
        })
    end

    TriggerServerEvent('hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })
end)

RegisterNetEvent('hospital:client:KillPlayer')
AddEventHandler('hospital:client:KillPlayer', function()
    SetEntityHealth(PlayerPedId(), 0)
end)

RegisterNetEvent('hospital:client:HealInjuries')
AddEventHandler('hospital:client:HealInjuries', function(type)
    if type == "full" then
        ResetAll()
    else
        ResetPartial()
    end
    TriggerServerEvent("hospital:server:RestoreWeaponDamage")
    QBCore.Functions.Notify("Tus heridas han sido curadas!")
end)

RegisterNetEvent('hospital:client:SendToBed')
AddEventHandler('hospital:client:SendToBed', function(id, data, isRevive)
    bedOccupying = id
    bedOccupyingData = data
    SetBedCam()
    Citizen.CreateThread(function ()
        Citizen.Wait(5)
        if isRevive then
            QBCore.Functions.Notify("Te están ayudando...")
            Citizen.Wait(Config.AIHealTimer * 1000)
            TriggerEvent("hospital:client:Revive")
        else
            canLeaveBed = true
        end
    end)
end)

RegisterNetEvent('hospital:client:SetBed')
AddEventHandler('hospital:client:SetBed', function(id, isTaken)
    Config.Locations["beds"][id].taken = isTaken
end)


RegisterNetEvent('hospital:client:RespawnAtHospital')
AddEventHandler('hospital:client:RespawnAtHospital', function()
    TriggerServerEvent("hospital:server:RespawnAtHospital")
    TriggerEvent("police:client:DeEscort")
end)

RegisterNetEvent('hospital:client:SendBillEmail')
AddEventHandler('hospital:client:SendBillEmail', function(amount)
    SetTimeout(math.random(2500, 4000), function()
        local gender = "Mr."
        if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = "Mrs."
        end
        local charinfo = QBCore.Functions.GetPlayerData().charinfo
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = "Pillbox",
            subject = "Factura del Hospital",
            message = gender .. " " .. charinfo.lastname .. ",<br /><br />Por la presente recibió un correo electrónico con los costos de la última visita al hospital.<br />Los costos finales se han convertido: <strong>$"..amount.."</strong><br /><br />¡Le deseamos una rápida recuperación!",
            button = {}
        })
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    TriggerServerEvent("hospital:server:SetDoctor")
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    exports.spawnmanager:setAutoSpawn(false)
    local ped = PlayerPedId()
    local player = PlayerId()
    isLoggedIn = true
    TriggerServerEvent("hospital:server:SetDoctor")
    Citizen.CreateThread(function()
        Citizen.Wait(5000)
        SetEntityMaxHealth(ped, 200)
        SetEntityHealth(ped, 200)
        SetPlayerHealthRechargeMultiplier(player, 0.0)
        SetPlayerHealthRechargeLimit(player, 0.0)
    end)
    Citizen.CreateThread(function()
        Wait(1000)
        QBCore.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
            onDuty = PlayerData.job.onduty
            SetPedArmour(ped, PlayerData.metadata["armor"])
            if (not PlayerData.metadata["inlaststand"] and PlayerData.metadata["isdead"]) then
                deathTime = Laststand.ReviveInterval
                OnDeath(true)
                DeathTimer()
            elseif (PlayerData.metadata["inlaststand"] and not PlayerData.metadata["isdead"]) then
                SetLaststand(true, true)
            else
                TriggerServerEvent("hospital:server:SetDeathStatus", false)
                TriggerServerEvent("hospital:server:SetLaststandStatus", false)
            end
        end)
    end)
end)

RegisterNetEvent('hospital:client:SetDoctorCount')
AddEventHandler('hospital:client:SetDoctorCount', function(amount)
    doctorCount = amount
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
    TriggerServerEvent("hospital:server:SetDoctor")
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    local ped = PlayerPedId()
    TriggerServerEvent("hospital:server:SetDeathStatus", false)
    TriggerServerEvent('hospital:server:SetLaststandStatus', false)
    TriggerServerEvent("hospital:server:SetArmor", GetPedArmour(ped))
    if bedOccupying ~= nil then 
        TriggerServerEvent("hospital:server:LeaveBed", bedOccupying)
    end
    isDead = false
    deathTime = 0
    SetEntityInvincible(ped, false)
    SetPedArmour(ped, 0)
    ResetAll()
end)

function GetDamagingWeapon(ped)
    for k, v in pairs(Config.Weapons) do
        if HasPedBeenDamagedByWeapon(ped, k, 0) then
            ClearEntityLastDamageEntity(ped)
            return v
        end
    end

    return nil
end

function IsDamagingEvent(damageDone, weapon)
    math.randomseed(GetGameTimer())
    local luck = math.random(100)
    local multi = damageDone / Config.HealthDamage

    return luck < (Config.HealthDamage * multi) or (damageDone >= Config.ForceInjury or multi > Config.MaxInjuryChanceMulti or Config.ForceInjuryWeapons[weapon])
end

function DoLimbAlert()
    if not isDead then
        if #injured > 0 then
            local limbDamageMsg = ''
            if #injured <= Config.AlertShowInfo then
                for k, v in pairs(injured) do
                    limbDamageMsg = limbDamageMsg .. "Tu " .. v.label .. " siente "..Config.WoundStates[v.severity]
                    if k < #injured then
                        limbDamageMsg = limbDamageMsg .. " | "
                    end
                end
            else
                limbDamageMsg = "Tienes dolor en muchos lugares..."
            end
            QBCore.Functions.Notify(limbDamageMsg, "Primero", 5000)
        end
    end
end

function DoBleedAlert()
    if not isDead and tonumber(isBleeding) > 0 then
        QBCore.Functions.Notify("Estás "..Config.BleedingStates[tonumber(isBleeding)].label, "Error", 5000)
    end
end

function IsInjuryCausingLimp()
    for k, v in pairs(BodyParts) do
        if v.causeLimp and v.isDamaged then
            return true
        end
    end

    return false
end

function SetClosestBed() 
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil
    for k, v in pairs(Config.Locations["beds"]) do
        local dist2 = #(pos - vector3(Config.Locations["beds"][k].coords.x, Config.Locations["beds"][k].coords.y, Config.Locations["beds"][k].coords.z))
        if current ~= nil then
            if dist2 < dist then
                current = k
                dist = dist2
            end
        else
            dist = dist2
            current = k
        end
    end
    if current ~= closestBed and not isInHospitalBed then
        closestBed = current
    end
end

function ResetPartial()
    for k, v in pairs(BodyParts) do
        if v.isDamaged and v.severity <= 2 then
            v.isDamaged = false
            v.severity = 0
        end
    end

    for k, v in pairs(injured) do
        if v.severity <= 2 then
            v.severity = 0
            table.remove(injured, k)
        end
    end

    if isBleeding <= 2 then
        isBleeding = 0
        bleedTickTimer = 0
        advanceBleedTimer = 0
        fadeOutTimer = 0
        blackoutTimer = 0
    end
    
    TriggerServerEvent('hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })

    ProcessRunStuff(PlayerPedId())
    DoLimbAlert()
    DoBleedAlert()

    TriggerServerEvent('hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })
end

function ResetAll()
    isBleeding = 0
    bleedTickTimer = 0
    advanceBleedTimer = 0
    fadeOutTimer = 0
    blackoutTimer = 0
    onDrugs = 0
    wasOnDrugs = false
    onPainKiller = 0
    wasOnPainKillers = false
    injured = {}

    for k, v in pairs(BodyParts) do
        v.isDamaged = false
        v.severity = 0
    end
    
    TriggerServerEvent('hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })

    CurrentDamageList = {}
    TriggerServerEvent('hospital:server:SetWeaponDamage', CurrentDamageList)

    ProcessRunStuff(PlayerPedId())
    DoLimbAlert()
    DoBleedAlert()

    TriggerServerEvent('hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })
    TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", 100)
    TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", 100)
end

function SetBedCam()
    isInHospitalBed = true
    canLeaveBed = false
    local player = PlayerPedId()

    DoScreenFadeOut(1000)

    while not IsScreenFadedOut() do
        Citizen.Wait(100)
    end

	if IsPedDeadOrDying(player) then
		local playerPos = GetEntityCoords(player, true)
		NetworkResurrectLocalPlayer(playerPos, true, true, false)
    end
    
    bedObject = GetClosestObjectOfType(bedOccupyingData.coords.x, bedOccupyingData.coords.y, bedOccupyingData.coords.z, 1.0, bedOccupyingData.model, false, false, false)
    FreezeEntityPosition(bedObject, true)

    SetEntityCoords(player, bedOccupyingData.coords.x, bedOccupyingData.coords.y, bedOccupyingData.coords.z + 0.02)
    --SetEntityInvincible(PlayerPedId(), true)
    Citizen.Wait(500)
    FreezeEntityPosition(player, true)

    loadAnimDict(inBedDict)

    TaskPlayAnim(player, inBedDict , inBedAnim, 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
    SetEntityHeading(player, bedOccupyingData.coords.w)

    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
    AttachCamToPedBone(cam, player, 31085, 0, 1.0, 1.0 , true)
    SetCamFov(cam, 90.0)
    SetCamRot(cam, -45.0, 0.0, GetEntityHeading(player) + 180, true)

    DoScreenFadeIn(1000)

    Citizen.Wait(1000)
    FreezeEntityPosition(player, true)
end

function LeaveBed()
    local player = PlayerPedId()

    RequestAnimDict(getOutDict)
    while not HasAnimDictLoaded(getOutDict) do
        Citizen.Wait(0)
    end
    
    FreezeEntityPosition(player, false)
    SetEntityInvincible(player, false)
    SetEntityHeading(player, bedOccupyingData.coords.w + 90)
    TaskPlayAnim(player, getOutDict , getOutAnim, 100.0, 1.0, -1, 8, -1, 0, 0, 0)
    Citizen.Wait(4000)
    ClearPedTasks(player)
    TriggerServerEvent('hospital:server:LeaveBed', bedOccupying)
    FreezeEntityPosition(bedObject, true)

    
    RenderScriptCams(0, true, 200, true, true)
    DestroyCam(cam, false)

    bedOccupying = nil
    bedObject = nil
    bedOccupyingData = nil
    isInHospitalBed = false
end

function GetClosestPlayer()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

function DrawText3D(x, y, z, text)
    QBCore.Functions.HelpNotify(text)
end

function loadAnimDict(dict)
	while(not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(1)
	end
end
