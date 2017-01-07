var get_x = argument0
var get_y = argument1

var get_entity = ds_create(ds_type_map)

ds_map_add(get_entity,"x",get_x)
ds_map_add(get_entity,"y",get_y)

show("entity [" + string(get_entity) + "] created")

ds_list_add(entity_list,get_entity)

return get_entity


