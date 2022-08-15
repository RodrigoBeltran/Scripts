Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) -- Level 1
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) -- Level 2
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0) -- Level 4
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1)
		if IsPedOnFoot(PlayerPedId()) then 
			SetRadarZoom(1100)
		elseif IsPedInAnyVehicle(PlayerPedId(), true) then
			SetRadarZoom(1100)
		end
    end
end)
--npcs comisaria sandy
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local myCoords = GetEntityCoords(PlayerPedId())
    if #(GetEntityCoords(PlayerPedId()) - vector3(1856.10,3679.10,33.7)) < 80 then
      ClearAreaOfPeds(1856.10,3679.10,33.7, 58.0, 0)
    end
  end
end)

local function getInterriorByType(x, y, z, name, iplName)
	local id = 0

	if not IsIplActive(iplName) then
		RequestIpl(iplName)

		while not IsIplActive(iplName) do
			RequestIpl(iplName)
			--print("Request Ipl:", iplName)
			Wait(100)
		end
	end

	while id == 0 do
		id = GetInteriorAtCoordsWithType(x, y, z, name)
		--print("Interrior:", name, id)
		Wait(100)
	end

	return id
end
--casino
Citizen.CreateThread(function()
	RequestIpl("vw_casino_penthouse")
	RequestIpl("hei_dlc_windows_casino")
	local penthouse = getInterriorByType(976.6364,70.2947,115.1641,"vw_dlc_casino_apart", "vw_casino_penthouse")
	local uj_casino_vault = getInterriorByType(946.251,43.2715,58.9172,"uj_casino_vault", "uj_casino_vault_milo_")
	local uj_casino_main = getInterriorByType(935.1050,42.5656,71.2737,"uj_casino_main", "uj_casino_main_milo_")
	local uj_casino_back = getInterriorByType(974.5600,22.5161,70.8396,"uj_casino_back", "uj_casino_back_milo_")
	local uj_casino_tunnel = getInterriorByType(930.1539,-0.2010,59.1323,"uj_casino_tunnel", "uj_casino_tunnel_milo_")

	EnableInteriorProp(penthouse, "set_pent_tint_shell")
	DisableInteriorProp(penthouse, "set_pent_bar_party_1")  
	EnableInteriorProp(penthouse, "set_pent_media_bar_open")
	EnableInteriorProp(penthouse, "set_pent_spa_bar_open")
	EnableInteriorProp(penthouse, "set_pent_dealer")
	DisableInteriorProp(penthouse, "set_pent_nodealer")
	DisableInteriorProp(penthouse, "set_pent_media_bar_closed")
	DisableInteriorProp(penthouse, "set_pent_spa_bar_closed")
	DisableInteriorProp(penthouse, "set_pent_pattern_01")
	DisableInteriorProp(penthouse, "set_pent_pattern_03")
	DisableInteriorProp(penthouse, "set_pent_pattern_02")
	DisableInteriorProp(penthouse, "set_pent_pattern_04")
	DisableInteriorProp(penthouse, "set_pent_pattern_05")
	DisableInteriorProp(penthouse, "set_pent_pattern_06")
	DisableInteriorProp(penthouse, "set_pent_pattern_07")
	DisableInteriorProp(penthouse, "set_pent_pattern_08")
	EnableInteriorProp(penthouse, "set_pent_pattern_09")
	DisableInteriorProp(penthouse, "set_pent_arcade_modern")
	EnableInteriorProp(penthouse, "set_pent_arcade_retro")
	EnableInteriorProp(penthouse, "set_pent_clutter_03")
	EnableInteriorProp(penthouse, "set_pent_clutter_02")
	EnableInteriorProp(penthouse, "set_pent_clutter_01")
	DisableInteriorProp(penthouse, "set_pent_lounge_blocker")
	DisableInteriorProp(penthouse, "set_pent_guest_blocker")
	DisableInteriorProp(penthouse, "set_pent_office_blocker")
	DisableInteriorProp(penthouse, "set_pent_cine_blocker")
	DisableInteriorProp(penthouse, "set_pent_spa_blocker")
	DisableInteriorProp(penthouse, "set_pent_bar_blocker")
	DisableInteriorProp(penthouse, "set_pent_bar_party_after")
	DisableInteriorProp(penthouse, "set_pent_bar_clutter")
	EnableInteriorProp(penthouse, "set_pent_bar_party_2")
	DisableInteriorProp(penthouse, "set_pent_bar_light_0")
	DisableInteriorProp(penthouse, "set_pent_bar_light_01")
	DisableInteriorProp(penthouse, "set_pent_bar_light_02")
	DisableInteriorProp(penthouse, "set_pent_bar_party_0")
	DisableInteriorProp(penthouse, "set_pent_bar_party_1")

    SetInteriorEntitySetColor(penthouse,"set_pent_tint_shell","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_party_1","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_tint_shell","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_media_bar_open","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_spa_bar_open","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_dealer","0") -- Дверцы
    SetInteriorEntitySetColor(penthouse, "set_pent_nodealer","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_media_bar_closed","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_spa_bar_closed","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_01","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_03","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_02","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_04","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_05","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_06","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_07","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_08","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_pattern_09","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_arcade_modern","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_arcade_retro","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_clutter_03","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_clutter_02","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_clutter_01","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_lounge_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_guest_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_office_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_cine_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_spa_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_blocker","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_party_after","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_clutter","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_party_2","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_light_0","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_light_01","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_light_02","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_party_0","0")
    SetInteriorEntitySetColor(penthouse, "set_pent_bar_party_1","0")
	RefreshInterior(penthouse)

	EnableInteriorProp(uj_casino_vault, "set_vault_diamonds_02")
	EnableInteriorProp(uj_casino_vault, "set_vault_diamonds_01")
	EnableInteriorProp(uj_casino_vault, "set_vault_gold_02")
	EnableInteriorProp(uj_casino_vault, "set_vault_gold_01")
	EnableInteriorProp(uj_casino_vault, "set_vault_art_02")
	EnableInteriorProp(uj_casino_vault, "set_vault_art_01")
	EnableInteriorProp(uj_casino_vault, "set_vault_cash_02")
	EnableInteriorProp(uj_casino_vault, "set_vault_cash_01")
	EnableInteriorProp(uj_casino_vault, "set_vault_dressing")
	EnableInteriorProp(uj_casino_vault, "set_spawn_group2")
	EnableInteriorProp(uj_casino_vault, "set_spawn_group1")
	DisableInteriorProp(uj_casino_vault, "set_vault_door_broken")
	EnableInteriorProp(uj_casino_vault, "set_vault_door")
	DisableInteriorProp(uj_casino_vault, "set_vault_door_closed")
	RefreshInterior(uj_casino_vault)

	EnableInteriorProp(uj_casino_main, "casino_manager_default")
	EnableInteriorProp(uj_casino_main, "casino_manager_workout")
	RefreshInterior(uj_casino_main)

	EnableInteriorProp(uj_casino_back, "casino_back_laundry_damage")
	RefreshInterior(uj_casino_back)
	
	EnableInteriorProp(uj_casino_tunnel, "set_tunnel_collapse")
	RefreshInterior(uj_casino_tunnel)
end)