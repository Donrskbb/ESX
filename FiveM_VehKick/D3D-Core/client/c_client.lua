AddEventHandler('onClientMapStart', function()
	TriggerServerEvent('D3D:ControleerWhitelist')
end)

D3Dteam = "Niet-Goedgekeurd"

RegisterNetEvent('D3DCore:GoedgekeurdJa')
AddEventHandler('D3DCore:GoedgekeurdJa', function()
	D3Dteam = "Goedgekeurd"
	ShowInfo('~y~Overheidsvoertuig Rechten ~n~~w~Jij bent nu: Goedgekeurd')
end)

OVRechtenLvl = 
{
	["Speler"] = 0,
	["OverheidsMedewerker"] = 1,
	["DriedorpStaff"] = 2,
}

Citizen.CreateThread(function()
	while true do

		local ped = PlayerPedId()
		if DoesEntityExist(ped) and not IsEntityDead(ped) then
			ManageRestrictVehicles()
			ManageRestrictWeaps()
			ManageRestrictPeds()
		end
		Citizen.Wait(500)
	end
end)

RegisterNetEvent("setPlayerGroup")
AddEventHandler("setPlayerGroup", function(group)
	HuidigOVRechtenLvl = OVRechtenLvl[group]
end)

RegisterNetEvent("sendNotification")
AddEventHandler("sendNotification", function(string)
	ShowInfo(string)
end)

function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName(text)
	DrawNotification(false, false)
end