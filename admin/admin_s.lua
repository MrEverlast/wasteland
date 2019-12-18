AddEvent("OnPackageStart", function()
    spec = false
end)

function cmd_vehicle(player, model)
	model = tonumber(model)
	local x, y, z = GetPlayerLocation(player)
	local h = GetPlayerHeading(player)

	local vehicle = CreateVehicle(model, x, y, z, h)
	SetPlayerInVehicle(player, vehicle)
end

AddCommand("v", cmd_vehicle)

function cmd_w(player, weapon, slot, ammo)
	if (weapon == nil or slot == nil or ammo == nil) then
		return AddPlayerChat(player, "Usage: /w <weapon> <slot> <ammo>")
	end

	SetPlayerWeapon(player, weapon, ammo, true, slot, true)
end
AddCommand("w", cmd_w)
AddCommand("weapon", cmd_w)


function cmd_animation(player, animationId)
    SetPlayerAnimation(player, animationId)
end
AddCommand("a", cmd_animation)

function cmd_skin(player, select)
	CallRemoteEvent(player, "ChangeSkin", select)
end
AddCommand("skin", cmd_skin)

function cmd_test(player)
	AddPlayerChat(player, "Team selected : " .. GetPlayerPropertyValue(player, "westlandTeam"))
end
AddCommand("t", cmd_test)

function cmd_spec(player)
	spec = not spec
	SetPlayerSpectate(player, spec)
end
AddCommand("spec", cmd_spec)