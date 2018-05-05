///ds_delete(map,key)
//deletes an entry from a map
//and the key list
var get_map = argument0
var get_key = argument1

var key_list = ds_get(get_map,"key list")

ds_map_delete(get_map,get_key)

var pos = ds_list_find_index(key_list,get_key)
ds_list_delete(key_list,pos)
