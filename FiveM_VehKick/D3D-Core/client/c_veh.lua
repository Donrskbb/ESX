function ManageRestrictVehicles()
	local ped = PlayerPedId()
	local veh = nil

	if IsPedInAnyVehicle(ped, false) then
		veh = GetVehiclePedIsUsing(ped)
	else
		veh = GetVehiclePedIsTryingToEnter(ped)
	end
	
	if veh and DoesEntityExist(veh) then
		local model = GetEntityModel(veh)
		local driver = GetPedInVehicleSeat(veh, -1)
		if driver == ped then
			
			if HuidigOVRechtenLvl < OVRechtenLvl["DriedorpStaff"] then
				for i = 1, #restrictedVehsGen do
					local restrictedModel = GetHashKey(restrictedVehsGen[i])
					if (model == restrictedModel) or (GetVehicleClass(veh) == 19) then
						ShowInfo("~r~Niet toegestaan voertuig.")
						DeleteEntity(veh)
						ClearPedTasksImmediately(ped)
					end
				end
			end

			if HuidigOVRechtenLvl < OVRechtenLvl["OverheidsMedewerker"] then
				for i = 1, #restrictedVehsOverheidsMedewerker do
					local restrictedModel = GetHashKey(restrictedVehsOverheidsMedewerker[i])
					if model == restrictedModel then
						ShowInfo("~r~Niet toegestaan voertuig.")
						ClearPedTasksImmediately(ped)	
					end
				end
			end	
		end
	end
end