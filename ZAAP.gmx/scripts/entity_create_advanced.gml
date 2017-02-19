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



if get_type == entity.ship
    {
    var get_grid = ds_create(ds_type_grid,7,7);
    get_grid[# 3, 1] = 5
    get_grid[# 2, 2] = true
    get_grid[# 3, 2] = 2
    get_grid[# 4, 2] = true
    get_grid[# 2, 3] = 3
    get_grid[# 3, 3] = 4
    get_grid[# 4, 3] = 3
    get_grid[# 1, 4] = 8
    //get_grid[# 2, 4] = 2
    get_grid[# 4, 4] = 2
    get_grid[# 5, 4] = 8
    get_grid[# 1, 5] = true
    get_grid[# 5, 5] = true
    ds_set(get_entity,"grid",get_grid)
    show("grid added with an id of: " + string(get_grid))
    }

//add to entity list and map to uuid
ds_map_add(entity_map,get_uuid,get_entity)
ds_list_add(entity_list,get_uuid)

show("entity created with uuid of [" + string(get_uuid) + "]")

return get_uuid
