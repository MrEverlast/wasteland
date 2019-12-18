-- Modified later to player
AddEvent("OnNPCStreamIn", function(npc)
    local team = GetNPCPropertyValue(npc, "westlandTeam")
    local playerTeam = GetPlayerPropertyValue(GetPlayerId(), "westlandTeam")
    if (tostring(team) == tostring(playerTeam)) then
        SetNPCOutline(npc, true)
    end
end)
