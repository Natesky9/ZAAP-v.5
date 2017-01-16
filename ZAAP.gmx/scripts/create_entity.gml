var get_uuid = argument0
var get_x = argument1
var get_y = argument2

var get_entity = ds_create(ds_type_map)

ds_map_add(get_entity,"uuid",get_uuid)
ds_map_add(get_entity,"x",get_x)
ds_map_add(get_entity,"y",get_y)

//add to entity list and map to uuid
ds_map_add(entity_map,get_uuid,get_entity)
ds_list_add(entity_list,get_uuid)

return get_uuid


