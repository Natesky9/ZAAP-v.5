var get_entity = argument0

var pos = ds_list_find_index(entity_list,get_entity)
console_add("pos is: " + string(pos))
ds_list_delete(entity_list,pos)

ds_delete(ds_type_map,get_entity)
