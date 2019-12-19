AddEvent("OnPackageStart", function()
    local npc = CreateNPC(-104337.0, 196708.0, 1312.0, 0)
    CreateNPC(-104200.0, 196708.0, 1312.0, 0)
    CreateNPC(-104400.0, 196708.0, 1312.0, 0)
    SetNPCPropertyValue(npc, "wastelandTeam", "teamBlue")
end)

AddEvent("OnNPCDeath", function(npc, player)
    if (player ~= 0) then
        -- If the death is inspected by a real player
        local teamKiller = GetPlayerPropertyValue(player, "wastelandTeam") -- player how kills
        local teamDead = GetNPCPropertyValue(npc, "wastelandTeam") -- player how dies
        local colorKiller, colorDead = GetKillFeedColors(teamKiller, teamDead)

        AddPlayerChatAll('<span color="'..colorKiller..'">'..GetPlayerName(player)..'</> just killed <span color="'..colorDead..'">'.. npc ..'</>')
        if(tostring(teamDead) == tostring(teamKiller)) then
            SetPlayerHealth(player, 0)
        end
    end
end)

function OnPlayerDeath(player, instigator)
    Delay(4000, function()
		CallRemoteEvent(player, "CreateWastelandUI", "http://asset/wasteland_gamemode/gui/html/spawn.html")
	end)
end
AddEvent("OnPlayerDeath", OnPlayerDeath)

function GetKillFeedColors(teamKiller, teamDead)
    local colorKiller = "#FFFFFF"
    local colorDead = "#FFFFFF"

    if (teamKiller == "teamBlue") then colorKiller = "#0e75b5" 
    elseif (teamKiller == "teamRed") then colorKiller = "#b50e0e" 
    elseif (teamKiller == "teamGreen") then colorKiller = "#43b50e" end

    if (teamDead == "teamBlue") then colorDead = "#0e75b5" 
    elseif (teamDead == "teamRed") then colorDead = "#b50e0e" 
    elseif (teamDead == "teamGreen") then colorDead = "#43b50e" end

    return colorKiller, colorDead
end
