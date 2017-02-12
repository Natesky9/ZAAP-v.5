///entity_create_advanced(get_x,get_y,get_type)
//creates a serverside entity

var get_x = argument0
var get_y = argument1
var get_type = argument2

//create a uuid for it
var get_uuid = random_32()

//create it and get it's id
var get_entity = entity_create_basic()

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
    get_grid[# 2, 0] = 5
    get_grid[# 1, 1] = true
    get_grid[# 2, 1] = 2
    get_grid[# 3, 1] = true
    get_grid[# 1, 2] = 3
    get_grid[# 2, 2] = 4
    get_grid[# 3, 2] = 3
    get_grid[# 0, 3] = 8
    get_grid[# 1, 3] = 2
    get_grid[# 3, 3] = 2
    get_grid[# 4, 3] = 8
    get_grid[# 0, 4] = true
    get_grid[# 4, 4] = true
    map_add_new_key(get_entity,"grid",get_grid)
    show("grid added with an id of: " + string(get_grid))
    }

//add to entity list and map to uuid
ds_map_add(entity_map,get_uuid,get_entity)
ds_list_add(entity_list,get_uuid)

show("entity created with uuid of [" + string(get_uuid) + "]")

return get_uuid
