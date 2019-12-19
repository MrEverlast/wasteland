$(".SpawnButtonBig").on('click', () => {
    var zone = "BigCity"
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWestlandUI")
})

$(".SpawnButtonDesert").on('click', () => {
    var zone = "DesertCity"
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWestlandUI")
})

$(".SpawnButtonVillage").on('click', () => {
    var zone = "Village"
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWestlandUI")
})

$(".SpawnButtonWestern").on('click', () => {
    var zone = "WesternTown"
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWestlandUI")
})

$(".SpawnButtonOld").on('click', () => {
    var zone = "OldTown"
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWestlandUI")
})

$(".SpawnButton").on('click', () => {
    var zone = $("#spawnZone option:selected").val()
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWestlandUI")
})