///playerdata_load()
//this needs work
//###//
var username = argument0
var playerdata_location = working_directory + "\players\" + ".dat"
ini_open(playerdata_location + username)

var get_profile = ds_create(data.dynamic,ds_type_map)


ini_close()

return get_profile
