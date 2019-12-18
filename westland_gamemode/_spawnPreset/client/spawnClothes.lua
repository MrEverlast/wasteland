function OnGetClothes(zone)
    local team = GetPlayerPropertyValue(GetPlayerId(), "westlandTeam")
    AddPlayerChat("You choose: "..tostring(team))
    AddPlayerChat("Vous avez choisit: "..tostring(zone))
    CallEvent("OnChangeclothes", team)
    CallRemoteEvent("OnSpawnWeapon", GetPlayerId())
    CallRemoteEvent("OnSelectedTeamSpawn", tostring(zone))
end
AddEvent("OnGetClothes", OnGetClothes)

AddEvent("OnChangeclothes", function(team)
    local player = GetPlayerId()
    local SMC = GetPlayerSkeletalMeshComponent(player, "Body")
    if (team == "teamBlue") then
        SMC = GetPlayerSkeletalMeshComponent(player, "Body")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/Military/Meshes/SK_SpecialForces04"))
    end
    if (team == "teamRed") then
        SMC = GetPlayerSkeletalMeshComponent(player, "Body")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Normal01_LPR"))
        SMC = GetPlayerSkeletalMeshComponent(player, "Clothing0")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/SkeletalMesh/HZN_CH3D_Normal_Hair_01_LPR"))
        SMC = GetPlayerSkeletalMeshComponent(player, "Clothing1")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/Clothing/Meshes/SK_Undershirt01"))
        SMC = GetPlayerSkeletalMeshComponent(player, "Clothing2")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/Clothing/Meshes/SK_Jeans01"))
        SMC = GetPlayerSkeletalMeshComponent(player, "Clothing3")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/Clothing/Meshes/SK_Shoes01"))
        SMC = GetPlayerSkeletalMeshComponent(player, "Clothing4")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_AgentGlasses_LPR"))
    end
    if (team == "teamGreen") then
        SMC = GetPlayerSkeletalMeshComponent(player, "Body")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Pimp_LPR"))
        SMC = GetPlayerSkeletalMeshComponent(player, "Clothing0")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/SkeletalMesh/HZN_CH3D_Normal_Hair_02_LPR"))
        SMC = GetPlayerSkeletalMeshComponent(player, "Clothing1")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_TShirt_Knitted_LPR"))
        SMC = GetPlayerSkeletalMeshComponent(player, "Clothing2")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_FormalPants_LPR"))
        SMC = GetPlayerSkeletalMeshComponent(player, "Clothing3")
        SMC:SetSkeletalMesh(USkeletalMesh.LoadFromAsset("/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_NormalShoes_LPR"))
    end
end)