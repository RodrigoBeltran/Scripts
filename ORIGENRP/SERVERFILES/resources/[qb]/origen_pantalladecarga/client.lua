-- Variable to check if native has already been run
-- local Ran = false


-- Wait until client is loaded into the map

-- Citizen.CreateThread(function()
-- 	while true do
-- 		
-- 		Citizen.Wait(0)
-- 		if NetworkIsSessionStarted() then
-- 			print("me he colado en el if")
-- 			ShutdownLoadingScreenNui()
-- 			return
-- 		end
-- 	end
-- end)


-- AddEventHandler("onClientMapStart", function ()
-- 	print("estoy dentro")

-- 	-- If not already ran
-- 	if not Ran then
-- 		-- Close loading screen resource
-- 		print("me he colado en el if")

-- 		ShutdownLoadingScreenNui()
-- 		-- Set as ran
-- 		Ran = true
-- 	end
-- end)


RegisterNUICallback('remove', function(data, cb)
	
	--ShutdownLoadingScreenNui()
end)
 

RegisterNetEvent("origen_loading:client:loadedEv")
AddEventHandler("origen_loading:client:loadedEv", function()
	SendNUIMessage({
		action = "terminar"
	})
	Citizen.Wait(1100)
	ShutdownLoadingScreen()
	ShutdownLoadingScreenNui()
end)
