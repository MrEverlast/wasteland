local Player = 0

function OnPackageStart()
	Player = GetPlayerId()
	--[[EditorGui = CreateWebUI(-420.0, 16.0, 400.0, 730.0, 1, 40)
	SetWebAlignment(EditorGui, 0.0, 0.0)
	SetWebAnchors(EditorGui, 1.0, 0.0, 1.0, 0.0) --anchor top right corner]]--
	EditorGui = CreateWebUI(0.0, 0.0, 410.0, 0.0, 1, 60)
	SetWebAlignment(EditorGui, 1.0, 0.0)
	SetWebAnchors(EditorGui, 1.0, 0.0, 1.0, 1.0) -- anchor left top corner to left bottom corner
	LoadWebFile(EditorGui, "http://asset/"..GetPackageName().."/client/gui/pc.html")
	SetWebVisibility(EditorGui, WEB_VISIBLE)

    ShowMouseCursor(true)
	SetInputMode(INPUT_GAMEANDUI)
	AddPlayerChat("hihihih")

end
AddEvent("OnPackageStart", OnPackageStart)

function OnMeshChange(mesh, clothing)
    local SMC = GetPlayerSkeletalMeshComponent(GetPlayerId(), clothing)
    SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset(mesh))

end
AddEvent("OnMeshChange", OnMeshChange)

function jsDebug(message)
    AddPlayerChat(message)
	
end
AddEvent("jsDebug", jsDebug)