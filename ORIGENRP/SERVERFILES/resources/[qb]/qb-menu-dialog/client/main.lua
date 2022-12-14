Citizen.CreateThread(function()
	QBCore = nil
	local Timeouts, OpenedMenus, MenuType = {}, {}, 'dialog'

	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end

	local openMenu = function(namespace, name, data)
		for i=1, #Timeouts, 1 do
			QBCore.ClearTimeout(Timeouts[i])
		end

		OpenedMenus[namespace .. '_' .. name] = true

		SendNUIMessage({
			action = 'openMenu',
			namespace = namespace,
			name = name,
			data = data
		})

		local timeoutId = QBCore.SetTimeout(200, function()
			SetNuiFocus(true, true)
		end)

		table.insert(Timeouts, timeoutId)
	end

	local closeMenu = function(namespace, name)
		OpenedMenus[namespace .. '_' .. name] = nil

		SendNUIMessage({
			action = 'closeMenu',
			namespace = namespace,
			name = name,
			data = data
		})

		if QBCore.Table.SizeOf(OpenedMenus) == 0 then
			SetNuiFocus(false)
		end

	end

	QBCore.UI.Menu.RegisterType(MenuType, openMenu, closeMenu)

	AddEventHandler('qb-menu-dialog:message:menu_submit', function(data)
		local menu = QBCore.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		local cancel = false

		if menu.submit then
			-- is the submitted data a number?
			if tonumber(data.value) then
				data.value = QBCore.Math.Round(tonumber(data.value))

				-- check for negative value
				if tonumber(data.value) <= 0 then
					cancel = true
				end
			end

			data.value = QBCore.Math.Trim(data.value)

			-- don't submit if the value is negative or if it's 0
			if cancel then
				print('That input is not allowed!')
			else
				menu.submit(data, menu)
			end
		end
	end)

	AddEventHandler('qb-menu-dialog:message:menu_cancel', function(data)
		local menu = QBCore.UI.Menu.GetOpened(MenuType, data._namespace, data._name)

		if menu.cancel ~= nil then
			menu.cancel(data, menu)
		end
	end)

	AddEventHandler('qb-menu-dialog:message:menu_change', function(data)
		local menu = QBCore.UI.Menu.GetOpened(MenuType, data._namespace, data._name)

		if menu.change ~= nil then
			menu.change(data, menu)
		end
	end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)

			if QBCore.Table.SizeOf(OpenedMenus) > 0 then
				DisableControlAction(0, 1,   true) -- LookLeftRight
				DisableControlAction(0, 2,   true) -- LookUpDown
				DisableControlAction(0, 142, true) -- MeleeAttackAlternate
				DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
				DisableControlAction(0, 12, true) -- WeaponWheelUpDown
				DisableControlAction(0, 14, true) -- WeaponWheelNext
				DisableControlAction(0, 15, true) -- WeaponWheelPrev
				DisableControlAction(0, 16, true) -- SelectNextWeapon
				DisableControlAction(0, 17, true) -- SelectPrevWeapon
			else
				Citizen.Wait(500)
			end
		end
	end)
end)