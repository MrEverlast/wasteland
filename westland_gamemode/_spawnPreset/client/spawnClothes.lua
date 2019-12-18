AddEvent("OnPlayerSpawn", function()
    CallRemoteEvent("OnGetClothes")
end)

AddRemoteEvent("changeclothes", function()
    local SMC = GetPlayerSkeletalMeshComponent(GetPlayerId(), "Body")
    nbr = Random(1, 4)
    SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/Military/Meshes/SK_SpecialForces0"..nbr))
end)