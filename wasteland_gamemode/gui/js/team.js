$(".child").on('click', (e) => {
    CallEvent("SetWastelandTeam", e.target.id)
    //alert(e.target.id);
})