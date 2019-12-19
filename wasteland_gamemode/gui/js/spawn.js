$(".SpawnButtonBig").on('click', () => {
    var zone = "BigCity"
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWastelandUI")
})

$(".SpawnButtonDesert").on('click', () => {
    var zone = "DesertCity"
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWastelandUI")
})

$(".SpawnButtonVillage").on('click', () => {
    var zone = "Village"
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWastelandUI")
})

$(".SpawnButtonWestern").on('click', () => {
    var zone = "WesternTown"
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWastelandUI")
})

$(".SpawnButtonOld").on('click', () => {
    var zone = "OldTown"
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWastelandUI")
})

$(".SpawnButton").on('click', () => {
    var zone = $("#spawnZone option:selected").val()
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWastelandUI")
})