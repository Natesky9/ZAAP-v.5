///entity_find_from_point(x,y,type,blacklist)
//returns uuid

var get_x = argument0
var get_y = argument1
var get_type = argument2
var get_blacklist = argument3

var get_map = fetch_entity_map(get_type)
var get_list = keys_from_map(get_map)
var keys = ds_list_size(get_list)

for (var i = 0;i < keys;i += 1)
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
            
            //aabb testing
            if abs(get_x - get_entity_x) <= x_start
                {
                if abs(get_y - get_entity_y) <= y_start
                    {
                    //precise testing
                    var get_grid_x = x_to_grid_x(mouse_x,mouse_y,get_entity)
                    var get_grid_y = y_to_grid_y(mouse_x,mouse_y,get_entity)
                    
                    if grid_in_bounds(get_width,get_height,get_grid_x,get_grid_y)
                        {
                        if ds_grid_get(get_grid,get_grid_x,get_grid_y)
                        or get("selected entity") == get_uuid
                            {
                            is_found = true
                            }
                        }
                    }
                }
            if is_found return get_uuid
            if not is_found continue
            }
        //----//
        case entity.asteroid:
            {
            var get_grid = grid_from_entity(get_entity)
            //search based off of the grid
            var get_width = ds_grid_width(get_grid)
            var get_height = ds_grid_height(get_grid)
            
            //get the starting position of the grid
            var x_start = ((get_width-1)*rock_grid_size * 1.5)/2
            var y_start = ((get_height-1)*rock_grid_size * sqrt(3))/2
            
            var is_found = false
            
            //aabb testing
            //###//
            //if abs(get_x - get_entity_x) <= x_start
                {
                //if abs(get_y - get_entity_y) <= y_start
                    {
                    //precise testing
                    var grid_position = point_to_hex_grid(get_entity,mouse_x,mouse_y)
                    var get_grid_x = grid_position[0]
                    var get_grid_y = grid_position[1]
                    
                    if grid_in_bounds(get_width,get_height,get_grid_x,get_grid_y)
                        {
                        if ds_grid_get(get_grid,get_grid_x,get_grid_y)
                        or get("selected entity") == get_uuid
                        is_found = true
                        }
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
