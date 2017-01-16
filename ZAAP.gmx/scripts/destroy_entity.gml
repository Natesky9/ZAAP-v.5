var get_uuid = argument0

var get_entity = entity_from_uuid(get_uuid)

var pos = ds_list_find_index(entity_list,get_uuid)
console_add("pos is: " + string(pos))
ds_list_delete(entity_list,pos)
ds_map_delete(entity_map,get_uuid)

ds_delete(ds_type_map,get_entity)
