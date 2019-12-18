AddEvent("OnPackageStart", function()
	
	local SQL_HOST = "localhost"
	local SQL_PORT = 3306
	local SQL_USER = "root"
	local SQL_PASS = ""
	local SQL_DATA = "onset_westland"
	local SQL_CHAR = "utf8mb4"
	local SQL_LOGL = "debug"

	mariadb_log(SQL_LOGL)

    sql = mariadb_connect(SQL_HOST .. ':' .. SQL_PORT, SQL_USER, SQL_PASS, SQL_DATA)
    print(sql)

	if (sql ~= false) then
		print("MariaDB: Connected to " .. SQL_HOST)
		mariadb_set_charset(sql, SQL_CHAR)
	else
		print("MariaDB: Connection failed to " .. SQL_HOST .. ", see mariadb_log file")

		-- Immediately stop the server if we cannot connect
--		ServerExit()
	end
end)

function OnPlayerJoin(player)
    -- Set the player spawn
    SetPlayerSpawnLocation(player, -105776.00, 195838.00, 1700.00, 90.0)
end
AddEvent("OnPlayerJoin", OnPlayerJoin)

function OnPlayerSteamAuth(player)
    local steamId = tostring(GetPlayerSteamId(player))
    local query = mariadb_prepare(sql, "SELECT * FROM player WHERE steam_id = '?';", steamId)
    mariadb_query(sql, query, checkForNewAccount, player, steamId)
end
AddEvent("OnPlayerSteamAuth", OnPlayerSteamAuth)

function checkForNewAccount(player, steamId)
    local rows = mariadb_get_row_count()
    if (rows == 0) then
        print(steamId)
        local query = mariadb_prepare(sql, "INSERT INTO `player`(`steam_id`) VALUES (?);", steamId)
        mariadb_query(sql, query)
    else
        AddPlayerChat(player, "Welcome back " .. GetPlayerName(player) .. "!")
        SetPlayerPropertyValue(player, "westlandTeam", "none")
        AddPlayerChat(player, GetPlayerPropertyValue(player, "testValue"))
    end
end

-- Set Westland team --
function SetPlayerWestlandTeam(player, team)
    SetPlayerPropertyValue(player, "westlandTeam", team)
end
AddRemoteEvent("SetPlayerWestlandTeam", SetPlayerWestlandTeam)

-- End Set Westland team --

-- Debug --
