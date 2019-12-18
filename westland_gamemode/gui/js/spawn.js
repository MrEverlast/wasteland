$(".SpawnButton").on('click', () => {
    var zone = $("#spawnZone option:selected").val()
//    CallEvent("SetwestlandSpawnZone", player, zone)
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWestlandUI")
})