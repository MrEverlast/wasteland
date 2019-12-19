AddEvent("OnPackageStart", function()
    CreateWestlandUI("http://asset/westland_gamemode/gui/html/team.html")
end)

function OnResolutionChange(width, height)
    AddPlayerChat("Resolution changed to "..width.."x"..height)
    -- SetWebSize(teamUI, width, height)
end
AddEvent("OnResolutionChange", OnResolutionChange)

function SetWestlandTeam(team)
    CallRemoteEvent("SetPlayerWestlandTeam", tostring(team))
end
AddEvent("SetWestlandTeam", SetWestlandTeam)

function CreateWestlandUI(url) 
    if (teamUI) then
        DestroyWebUI(teamUI)
    end
    teamUI = CreateWebUI(0, 0, 0, 0, 0, 60)
    SetWebAlignment(teamUI, 0.0, 0.0)
    SetWebAnchors(teamUI, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(teamUI, WEB_VISIBLE)
    SetInputMode(INPUT_GAMEANDUI)
    ShowMouseCursor(true)
    LoadWebFile(teamUI, url)
end
AddRemoteEvent("CreateWestlandUI", CreateWestlandUI)

function DestroyWestlandUI()
    SetInputMode(INPUT_GAME)
    ShowMouseCursor(false)
    SetWebVisibility(teamUI, WEB_HIDDEN)
    DestroyWebUI(teamUI)
end
AddEvent("DestroyWestlandUI", DestroyWestlandUI)
