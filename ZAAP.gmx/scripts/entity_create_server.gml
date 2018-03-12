///entity_create_server(get_x,get_y,get_type)
//creates a serverside entity and sends it to clients
//returns uuid

var get_x = argument0
var get_y = argument1
var get_type = argument2

//create a uuid for it
var get_uuid = random_32()

//create it and get it's id
var get_entity = entity_create_basic()

var name = name_from_type(get_type)

ds_set(get_entity,"uuid",get_uuid)
ds_set(get_entity,"x",get_x)
ds_set(get_entity,"y",get_y)
ds_set(get_entity,"type",get_type)
ds_set(get_entity,"I am a",name)


//add to pending entity list and map to uuid
entity_map_uuid(get_entity)

//show("entity created with uuid of [" + string(get_uuid) + "]")

return get_uuid
