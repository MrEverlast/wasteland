
function cmd_vehicle(player, model)
	model = tonumber(model)
	local x, y, z = GetPlayerLocation(player)
	local h = GetPlayerHeading(player)

	local vehicle = CreateVehicle(model, x, y, z, h)
	SetPlayerInVehicle(player, vehicle)
end

AddCommand("v", cmd_vehicle)