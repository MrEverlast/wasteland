function OnGetWeapon(player)
	SetPlayerWeapon(player, 3, 30, true, 1, true)
end
AddRemoteEvent("OnGetWeapon", OnGetWeapon)