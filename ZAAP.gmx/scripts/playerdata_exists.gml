///playerdata_exists(username)
//returns whether a player's save exists
var username = argument0

var playerdata_location = working_directory + "\players\"

return file_exists(playerdata_location + username + ".ini")
