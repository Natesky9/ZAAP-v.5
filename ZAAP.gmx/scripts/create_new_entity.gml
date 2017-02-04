var get_x = argument0
var get_y = argument1
var get_type = argument2

//create a uuid for it
var get_uuid = random_32()

//create it and get it's id
var get_entity = create_entity()

map_add_new_key(get_entity,"uuid",get_uuid)
map_add_new_key(get_entity,"x",get_x)
map_add_new_key(get_entity,"y",get_y)
map_add_new_key(get_entity,"type",get_type)
/*
map_add_new_key(get_entity,"speed",0)
map_add_new_key(get_entity,"direction",90)
map_add_new_key(get_entity,"heading",90)
*/


if get_type == entity.ship
    {
    var get_grid = ds_create(ds_type_grid,5,5);
    get_grid[# 2, 2] = true
    map_add_new_key(get_entity,"grid",get_grid)
    show("grid added with an id of: " + string(get_grid))
    }

//add to entity list and map to uuid
ds_map_add(entity_map,get_uuid,get_entity)
ds_list_add(entity_list,get_uuid)

show("entity created with uuid of [" + string(get_uuid) + "]")

return get_uuid
