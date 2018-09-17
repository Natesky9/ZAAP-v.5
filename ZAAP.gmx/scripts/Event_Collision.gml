///Event_Collision()
if not am_client()
and not am_server()
exit
var get_uuid,get_other_uuid,
    get_entity,get_other_entity,
    get_x,get_y,get_other_x,get_other_y,
    get_other_grid,get_grid_value,
    get_width,get_height,
    grid_position,grid_x,grid_y,
    get_lifetime,
    i,j,

//only run bullets?
var get_map = fetch_entity_map(entity.bullet)
show("get map is: " + string(get_map))
var get_list = keys(get_map)
var get_list_size = ds_list_size(get_list)
var get_other_map = fetch_entity_map(entity.asteroid)
var get_other_list = keys(get_other_map)
var get_other_list_amount = ds_list_size(get_other_list)


for (i = 0;i < get_list_size;i++)
    {
    //loop through all the bullets and search for collisions
    get_uuid = ds_list_find_value(get_list,i)
    get_entity = entity_from_uuid(get_uuid)
    
    get_x = ds_get(get_entity,"x")
    get_y = ds_get(get_entity,"y")
    
    if am_server()
    for (j = 0;j < get_other_list_amount;j++)
        {
        get_other_uuid = ds_list_find_value(get_other_list,j)
        get_other_entity = entity_from_uuid(get_other_uuid)
        get_other_grid = ds_get(get_other_entity,"grid")
        get_width = ds_grid_width(get_other_grid)
        get_height = ds_grid_height(get_other_grid)
        
        get_other_x = ds_get(get_other_entity,"x")
        get_other_y = ds_get(get_other_entity,"y")
        
        //do the collision check
        
        grid_position = point_to_hex_grid(get_other_entity,get_x,get_y)
        grid_x = grid_position[0]
        grid_y = grid_position[1]
        
        if not grid_in_bounds(get_width,get_height,grid_x,grid_y)
        continue
        
        get_grid_value = ds_grid_get(get_other_grid,grid_x,grid_y)
        if not get_grid_value
        continue
        //no grid collision
        
        show("bullet hit!-------------------")
        
        //destroy the bullet
        //packet_entity_destroy
        show("grid was hit: " + string(grid_x) + ":" + string(grid_y))
        entity_destroy_basic(get_uuid)
        
        //change the grid cell that was hit
        
        //packet_entity_destroy
        packet_write(packet.entity_destroy,get_uuid)
        entity_asteroid_break_cell(get_other_uuid,get_other_entity,get_other_grid,grid_x,grid_y)
        
        //we're done for now
        continue
        
        //entity_ship_break_cell(get_other_uuid,get_other_entity,get_other_grid,grid_x,grid_y)
        }
    
    get_lifetime = ds_get(get_entity,"lifetime")
    
    if not get_lifetime
    entity_destroy_basic(get_uuid)
    
    ds_set(get_entity,"lifetime",get_lifetime-1,key.value)
    }
