///grid_from_entity(entity)
//returns grid

var get_entity = argument0

if get_entity == 0
    {
    show("can't get grid from entity: entity is 0")
    return false
    }

var get_grid = ds_get(get_entity,"grid")

if get_grid == 0
    {
    return false
    }
return get_grid
