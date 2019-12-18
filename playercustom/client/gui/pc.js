const character = {
    bodies: [
        '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Business_LPR',
        '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Normal01_LPR',
        '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Normal02_LPR',
        '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Normal03_LPR',
        '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Normal04_LPR',
        '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Pimp_LPR',
        '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Police_LPR',
        '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Scientist_LPR',
        '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_SpecialAgent_LPR',
    ],
    hairs: [
        '/Game/CharacterModels/SkeletalMesh/HZN_CH3D_Hair_Business_LP',
        '/Game/CharacterModels/SkeletalMesh/HZN_CH3D_Hair_Scientist_LP',
        '/Game/CharacterModels/SkeletalMesh/HZN_CH3D_Normal_Hair_01_LPR',
        '/Game/CharacterModels/SkeletalMesh/HZN_CH3D_Police_Hair_LPR',
        '/Game/CharacterModels/SkeletalMesh/HZN_CH3D_Normal_Hair_03_LPR',
        '/Game/CharacterModels/SkeletalMesh/HZN_CH3D_Normal_Hair_02_LPR',
    ],
    shirts: [
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_CH3D_Prisoner_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Knitted_Shirt_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_FormalShirt_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_FormalShirt2_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_Shirt_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_TShirt_Knitted2_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_TShirt_Knitted_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_TShirt_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Police_Shirt-Long_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Police_Shirt-Short_LPR',
        '/Game/CharacterModels/Clothing/Meshes/SK_Pullover',
        '/Game/CharacterModels/Clothing/Meshes/SK_ShirtCombo01',
        '/Game/CharacterModels/Clothing/Meshes/SK_TShirt01',
        '/Game/CharacterModels/Clothing/Meshes/SK_Undershirt01',
    ],
    jackets: [
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_FormalJacket_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_Labcoat_LPR',
    ],
    pants: [
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_CargoPants_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_DenimPants_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_FormalPants_LPR',
        '/Game/CharacterModels/Clothing/Meshes/SK_Jeans01',
    ],
    shoes: [
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_BusinessShoes_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_NormalShoes_LPR',
        '/Game/CharacterModels/Clothing/Meshes/SK_Shoes01',
    ],
    heads: [
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_AgentGlasses_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_ScienceGlasses_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_TacticalGlasses_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_Tie_LPR',
        '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Police_Hat_LPR',
    ]

};

$(document).ready(function() {

    let generateSelect = () => {
        let i = 0;
        Object.keys(character).forEach(key => {
            i+=1;
            let dropdown = '<div id="select'+i+'" class="dropdown"><div id="dropdown-menu'+i+'" class="dropdown-menu" aria-labelledby="dropdownMenuButton"></div></div>';
            let button = '<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'+ key.toLocaleUpperCase() +'</button>';
            
            $(".container").append(dropdown);
            $("#select"+i).append(button);
            
            let value = character[key];
            value.forEach(mesh => {
                let name = mesh.split('/');
                $("#dropdown-menu"+i).append('<a class="dropdown-item" href="#" data-clothing="'+i+'" data-mesh="' + mesh + '">'+ name[name.length - 1] +'</a>');
            });
        });
    }

    generateSelect();


    $(".dropdown-item").on('mouseover', function() {
        let mesh = $(this).data('mesh');
        let id = $(this).data('clothing');
        let clothing = "Body";
        if (id > 1) {
            clothing = "Clothing" + (id - 2);
        }
		CallEvent("OnMeshChange", mesh, clothing);
    });


    let generateButtons = () => {
        meshs.forEach(mesh => {
            let name = mesh.split('/');
            let object = '<button type="button" class="btn btn-primary" data-id="' + mesh + '">' + name[name.length - 1] + '</button>';
            $("#list").append(object);
        });
    }

    let generateButtons2 = () => {
        clothings.forEach(clothing => {
            let name = clothing.split('/');
            let object = '<button type="button" class="btn btn-primary" data-id="' + clothing + '">' + name[name.length - 1] + '</button>';
            $("#list2").append(object);
        });
    }

    $("#list").on('mouseover','button', function() {
        let id = $(this).data('id');
		CallEvent("OnMeshChange", id);
    });

    $("#list2").on('mouseover','button', function() {
        let id = $(this).data('id');
		CallEvent("OnClothingChange", id);
    });
    
    
});

let meshs = [
    '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Business_LPR',
    '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Normal01_LPR',
    '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Normal02_LPR',
    '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Normal03_LPR',
    '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Normal04_LPR',
    '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Pimp_LPR',
    '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Police_LPR',
    '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_Scientist_LPR',
    '/Game/CharacterModels/SkeletalMesh/BodyMerged/HZN_CH3D_SpecialAgent_LPR'
]

let clothings = [
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Set_SpecialAgent_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_CH3D_Prisoner_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Knitted_Shirt_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_AgentGlasses_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_BusinessShoes_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_CargoPants_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_DenimPants_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_FormalJacket_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_FormalPants_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_FormalShirt_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_FormalShirt2_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_Labcoat_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_NormalShoes_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_RingL_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_RingR_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_ScienceGlasses_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_Shirt_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_TacticalGlasses_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_Tie_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_TShirt_Knitted2_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_TShirt_Knitted_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Piece_TShirt_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Police_Hat_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Police_Shirt-Long_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Police_Shirt-Short_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Set_Pimp_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Set_Pimp_Open_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Set_Police_LPR',
    '/Game/CharacterModels/SkeletalMesh/Outfits/HZN_Outfit_Set_Scientist_LPR',
    '/Game/CharacterModels/Mafia/Meshes/SK_Mafia',
    '/Game/CharacterModels/Clothing/Meshes/SK_Jeans01',
    '/Game/CharacterModels/Clothing/Meshes/SK_Pullover',
    '/Game/CharacterModels/Clothing/Meshes/SK_ShirtCombo01',
    '/Game/CharacterModels/Clothing/Meshes/SK_Shoes01',
    '/Game/CharacterModels/Clothing/Meshes/SK_Shorts01',
    '/Game/CharacterModels/Clothing/Meshes/SK_TShirt01',
    '/Game/CharacterModels/Clothing/Meshes/SK_TShirtShorts01',
    '/Game/CharacterModels/Clothing/Meshes/SK_Undershirt01'
]
