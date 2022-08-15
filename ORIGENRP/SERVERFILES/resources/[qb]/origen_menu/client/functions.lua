GetClosestPlayer = function()
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

function PlayerInFront()
	local playerPedId = PlayerPedId()
	  local pos = GetEntityCoords(playerPedId)
	  local entityWorld = GetOffsetFromEntityInWorldCoords(playerPedId, 0.0, 4.0, 0.0)
	  local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 4, playerPedId, 0)
	  local a, b, c, d, result = GetRaycastResult(rayHandle)
	  return result
  end

local pedMugshot

local function GetPedMugshot(ped, transparent)
    if DoesEntityExist(ped) then
		local mugshot
		
		if transparent then
			mugshot = RegisterPedheadshot(ped)
		else
			mugshot = RegisterPedheadshot(ped)
		end

		while not IsPedheadshotReady(mugshot) do
			Citizen.Wait(0)
		end

		return mugshot, GetPedheadshotTxdString(mugshot)
	else
		return
	end
end

function UpdateMugShot(source)
	local newMugshot, txd = GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(source)), true)

	if IsPedheadshotValid(pedMugshot) then
		UnregisterPedheadshot(pedMugshot)
	end

	pedMugshot = newMugshot
    return "https://nui-img/"..txd.."/"..txd
end