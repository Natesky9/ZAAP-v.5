///ds_get(get_map,get_key)
var get_map = argument0
var get_key = argument1

var result = ds_map_find_value(get_map,get_key)

if result == undefined
return false

return result
