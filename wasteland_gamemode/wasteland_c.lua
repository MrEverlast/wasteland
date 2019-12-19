AddEvent("OnPackageStart", function()
    CreateWastelandUI("http://asset/wasteland_gamemode/gui/html/team.html")
end)

function OnResolutionChange(width, height)
    AddPlayerChat("Resolution changed to "..width.."x"..height)
    -- SetWebSize(teamUI, width, height)
end
AddEvent("OnResolutionChange", OnResolutionChange)

function SetWastelandTeam(team)
    CallRemoteEvent("SetPlayerWastelandTeam", tostring(team))
end
AddEvent("SetWastelandTeam", SetWastelandTeam)

function CreateWastelandUI(url) 
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
AddRemoteEvent("CreateWastelandUI", CreateWastelandUI)

function DestroyWastelandUI()
    SetInputMode(INPUT_GAME)
    ShowMouseCursor(false)
    SetWebVisibility(teamUI, WEB_HIDDEN)
    DestroyWebUI(teamUI)
end
AddEvent("DestroyWastelandUI", DestroyWastelandUI)
