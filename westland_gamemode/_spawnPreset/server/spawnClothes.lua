AddRemoteEvent("OnGetClothes", function(player)
	CallRemoteEvent(player, "changeclothes")
	SetPlayerWeapon(player, 3, 30, true, 1, true)
end)