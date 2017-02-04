//find_entity_from_point(get_x,get_y)

var get_x = argument0
var get_y = argument1

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    //loop through the list of entities
    var get_uuid = ds_list_find_value(entity_list,i)
    var get_entity = entity_from_uuid(get_uuid)
    //early exit if the entity does not exist
    if is_zero(get_entity) exit
    
    //get the entity's values
    var get_entity_x = ds_get(get_entity,"x")
    var get_entity_y = ds_get(get_entity,"y")
    var get_heading = ds_get(get_entity,"heading")
    
    var get_grid = ds_get(get_entity,"grid")
    
    if not is_zero(get_grid)
        {
        //search based off of the grid
        var get_width = ds_grid_width(get_grid)
        var get_height = ds_grid_height(get_grid)
        
        //get the starting position of the grid
        var x_start = (get_width*ship_grid_size)/2
        var y_start = (get_height*ship_grid_size)/2
        
        //var get_radius = point_distance(0,0,x_start,y_start)
        
        //var get_distance = point_distance(get_x,get_y,get_entity_x,get_entity_y)
        
        var is_found = (sqr(get_entity_x - get_x) + sqr(get_entity_y - get_y)
                        <
                        (sqr(x_start) + sqr(y_start)))
        
        if is_found return get_entity
        if not is_found continue
        }
    
    if is_zero(get_grid)
        {
        //search based off of a 32 pixel square if no grid
        if get_x < get_entity_x + 32
        and get_x > get_entity_x - 32
            {
            if get_y < get_entity_y + 32
            and get_y > get_entity_y - 32
                {
                return get_entity
                }
            }
        }
    }
return 0
