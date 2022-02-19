D3DcWhiteL = false 

RegisterServerEvent("D3D:ControleerWhitelist")
AddEventHandler('D3D:ControleerWhitelist', function()

    local source = source
    if IsPlayerAceAllowed(source, "DriedorpStaff") then
        TriggerClientEvent("setPlayerGroup", source, "DriedorpStaff")
    elseif IsPlayerAceAllowed(source, "OverheidsMedewerker") then
        TriggerClientEvent("setPlayerGroup", source, "OverheidsMedewerker")
    else
        TriggerClientEvent("setPlayerGroup", source, "Speler")
    end
end)

-- OHV (OverHeidsVoertuig) Command
RegisterCommand("ohv", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "DriedorpStaff") then
        TriggerClientEvent("D3DCore:GoedgekeurdJa", source)
	else
		print('D3DCore : Toegang geweigerd na gebruik van /OHV.')
	end
end)