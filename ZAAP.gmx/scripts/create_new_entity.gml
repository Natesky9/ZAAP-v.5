var get_x = argument0
var get_y = argument1

//create a uuid for it
var get_uuid = random_32()

//create it and get it's id
var get_entity = create_entity()

entity_add_new_key(get_entity,"uuid",get_uuid)
entity_add_new_key(get_entity,"x",get_x)
entity_add_new_key(get_entity,"y",get_y)
entity_add_new_key(get_entity,"xspd",0)
entity_add_new_key(get_entity,"yspd",0)
entity_add_new_key(get_entity,"steer",0)
entity_add_new_key(get_entity,"thrust",0)
entity_add_new_key(get_entity,"brake",0)

//add to entity list and map to uuid
ds_map_add(entity_map,get_uuid,get_entity)
ds_list_add(entity_list,get_uuid)

show("entity created with uuid of [" + string(get_uuid) + "]")

return get_uuid
