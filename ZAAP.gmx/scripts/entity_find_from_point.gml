///entity_find_from_point(x,y,type,blacklist)
//returns uuid

var get_x = argument0
var get_y = argument1
var get_type = argument2
var get_blacklist = argument3

var get_list = entity_list(get_type)//entity_list(entity.types)

for (var i = 0;i < ds_list_size(get_list);i += 1)
    {
    var get_uuid = ds_list_find_value(get_list,i)
    var get_entity = entity_from_uuid(get_uuid)
    
    //early exit if the entity does not exist
    //or is the blacklisted entity
    if is_zero(get_entity)
    or get_entity == get_blacklist
    continue
    
    //get the entity's values
    var get_entity_x = ds_get(get_entity,"x")
    var get_entity_y = ds_get(get_entity,"y")
    var get_heading = ds_get(get_entity,"heading")
    var get_type = ds_get(get_entity,"type")
    
    switch get_type
        {
        //----//
        case entity.ship:
            {
            var get_grid = grid_from_entity(get_entity)
            //search based off of the grid
            var get_width = ds_grid_width(get_grid)
            var get_height = ds_grid_height(get_grid)
            
            //get the starting position of the grid
            var x_start = (get_width*ship_grid_size)/2
            var y_start = (get_height*ship_grid_size)/2
            
            var is_found = false
            
            if abs(get_x - get_entity_x) <= x_start
                {
                if abs(get_y - get_entity_y) <= y_start
                    {
                    is_found = true
                    }
                }
            if is_found return get_uuid
            if not is_found continue
            }
        //----//
        default:
            {
            //search based off of a 32 pixel square if no grid
            if get_x < get_entity_x + 32
            and get_x > get_entity_x - 32
                {
                if get_y < get_entity_y + 32
                and get_y > get_entity_y - 32
                    {
                    return get_uuid
                    }
                }
            }
        //----//
        }
    }
return false
