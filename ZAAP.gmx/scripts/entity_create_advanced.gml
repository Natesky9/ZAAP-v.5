///entity_create_advanced(get_x,get_y,get_type)
//creates a serverside entity

var get_x = argument0
var get_y = argument1
var get_type = argument2

//create a uuid for it
var get_uuid = random_32()

//create it and get it's id
var get_entity = entity_create_basic()

ds_set(get_entity,"uuid",get_uuid)
ds_set(get_entity,"x",get_x)
ds_set(get_entity,"y",get_y)
ds_set(get_entity,"type",get_type)


//add to pending entity list and map to uuid
ds_map_add(entity_map,get_uuid,get_entity)
ds_list_add(entity_create_list,get_uuid)

show("entity created with uuid of [" + string(get_uuid) + "]")

return get_uuid
