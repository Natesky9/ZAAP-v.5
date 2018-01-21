///Event_Collision()
if not am_client()
and not am_server()
exit

//only run bullets?
var get_list = entity_list(entity.bullet)
var get_list_amount = ds_list_size(get_list)
var get_other_list = entity_list(entity.asteroid)
var get_other_list_amount = ds_list_size(get_other_list)
var get_uuid,get_other_uuid
var get_entity,get_other_entity
var get_x,get_y,get_other_x,get_other_y
var get_other_grid,get_grid_value
var get_width,get_height
var grid_position,grid_x,grid_y
var get_lifetime
var i,j

for (i = 0;i < get_list_amount;i++)
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
        
        
        packet_write(packet.entity_destroy,get_uuid)
        grid_set_value_advanced(get_other_entity,get_other_grid,grid_x,grid_y,false)
        
        //we're done for now
        continue
        
        //get the position of that cell that was destroyed
        var array = hex_cell_to_point(get_other_entity,grid_x,grid_y)
        var new_x = array[0]
        var new_y = array[1]
        
        //create an item drop
        var new_uuid = entity_create_server(new_x,new_y,entity.item)
        var new_entity = entity_from_uuid(new_uuid)
        ds_set(new_entity,"id",item.square)
        ds_set(new_entity,"pickup timer",60)
        ds_set(new_entity,"heading",get_entity_heading)
        ds_set(new_entity,"direction",irandom(360))
        ds_set(new_entity,"speed",irandom(4))
        //packet_entity_create
        packet_write(packet.entity_create,new_uuid)
        }
    
    get_lifetime = ds_get(get_entity,"lifetime")
    
    if not get_lifetime
    entity_destroy_basic(get_uuid)
    
    ds_set(get_entity,"lifetime",get_lifetime-1)
    }
