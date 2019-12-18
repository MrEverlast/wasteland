function OnSelectedTeamSpawn(player, zone)
    if (zone == "BigCity") then
        local spawn = Random(1, 8)
        spawn = {
            [1] = SetPlayerLocation(player, 177000.00, 160000.00, 4950.00),
            [2] = SetPlayerLocation(player, 212000.00, 159000.00, 1450.00),
            [3] = SetPlayerLocation(player, 215000.00, 190600.00, 1450.00),
            [4] = SetPlayerLocation(player, 176000.00, 211500.00, 1450.00),
            [5] = SetPlayerLocation(player, 158440.00, 184000.00, 900.00),
            [6] = SetPlayerLocation(player, 194000.00, 177000.00, 1450.00),
            [7] = SetPlayerLocation(player, 132000.00, 207000.00, 1400.00),
            [8] = SetPlayerLocation(player, 136000.00, 192000.00, 1400.00),
        }
    end
    if (zone == "DesertCity") then
    end
    if (zone == "Village") then
    end
    if (zone == "WesternTown") then
    end
    if (zone == "OldTown") then
    end
end
AddRemoteEvent("OnSelectedTeamSpawn", OnSelectedTeamSpawn)