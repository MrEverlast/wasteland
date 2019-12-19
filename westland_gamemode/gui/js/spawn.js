$(".SpawnButton").on('click', () => {
    var zone = $("#spawnZone option:selected").val()
    CallEvent("OnGetClothes", zone)
    CallEvent("DestroyWestlandUI")
})