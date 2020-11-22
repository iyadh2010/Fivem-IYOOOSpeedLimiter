ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local IsLimiteractive = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		
		if IsControlJustPressed(1, 47) then
		end
		
	end
end)

function setSpeedLimit()
	local playerPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	local speed = (GetEntitySpeed(vehicle))
	local InVeh = IsPedInVehicle(playerPed, vehicle, false)
	if InVeh and speed > 0 then
		IsLimiteractive = not IsLimiteractive
		if not IsLimiteractive then
			SetEntityMaxSpeed(vehicle, speed)
			ESX.ShowNotification('Speed limiter ~g~Activated~g~')
		else
			SetEntityMaxSpeed(vehicle, 250.0)
			ESX.ShowNotification('Speed limiter ~g~Desactivated~g~')
		end
	end
end
