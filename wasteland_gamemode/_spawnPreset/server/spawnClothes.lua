function OnSpawnWeapon(player)
	SetPlayerWeapon(player, 3, 40, true, 1, true)
end
AddRemoteEvent("OnSpawnWeapon", OnSpawnWeapon)