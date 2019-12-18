
AddEvent("OnRenderHUD", function()
    local x, y, z = GetPlayerLocation()
    local ScreenX, ScreenY = GetScreenSize()

    SetDrawColor(RGB(255, 255, 255))
    DrawText(2, ScreenY - 40, tostring("Player location: "..x..", "..y..", "..z))
end)

function ChangeSkin(select)
    select = tonumber(select)
	local SMC = GetPlayerSkeletalMeshComponent(GetPlayerId(), "Body")
    SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/Military/Meshes/SK_SpecialForces0" .. select))
end
AddRemoteEvent("ChangeSkin", ChangeSkin)
