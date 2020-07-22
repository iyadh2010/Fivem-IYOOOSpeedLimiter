ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local a = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local playerPed = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local speed = (GetEntitySpeed(vehicle))
		local InVeh = IsPedInVehicle(playerPed, vehicle, false)
		if IsControlJustPressed(1, 47) and InVeh and speed > 0 then
			if a == false then
				SetEntityMaxSpeed(vehicle, speed)
				a = true
				ESX.ShowNotification('Speed limiter ~g~Activated~g~')
			else
				SetEntityMaxSpeed(vehicle, 9999.9)
				a = false
				ESX.ShowNotification('Speed limiter ~g~Desactivated~g~')
			end
		end
		
	end
end)
