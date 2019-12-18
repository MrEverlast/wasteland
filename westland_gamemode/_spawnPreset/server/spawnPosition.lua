function OnSelectedTeamSpawn(player)
    SetPlayerLocation(player, -105776.00, 19000.00, 4000.00)
end
AddRemoteEvent("OnSelectedTeamSpawn", OnSelectedTeamSpawn)