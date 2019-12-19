-- Modified later to player
AddEvent("OnNPCStreamIn", function(npc)
    local team = GetNPCPropertyValue(npc, "wastelandTeam")
    local playerTeam = GetPlayerPropertyValue(GetPlayerId(), "wastelandTeam")
    if (tostring(team) == tostring(playerTeam)) then
        SetNPCOutline(npc, true)
    end
end)
