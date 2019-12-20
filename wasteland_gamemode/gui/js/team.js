$(".child").on('click', (e) => {
    CallEvent("SetWastelandTeam", e.target.id)
    CallEvent("DisplayeSelectedTeam", e.target.id)
})