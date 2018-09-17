///ds_get(get_map,get_key)
//returns the value of the key
//NOT the array
var get_map = argument0
var get_key = argument1

var get_array = ds_map_find_value(get_map,get_key)

if get_array == undefined
return false

var value = get_array[1]

return value
