if mouse_check_button_pressed(mb_left)
    {
    if am_server()
        {
        //create an entity
        var get_uuid = entity_create_advanced(mouse_x,mouse_y,entity.shipyard)
        
        packet_write(packet.entity_create,get_uuid,mouse_x,mouse_y)
        exit
        }
    if am_client()
        {
        var get_entity = entity_find_from_point(mouse_x,mouse_y)
        if is_zero(get_entity)
        exit
        
        var get_uuid = uuid_from_entity(get_entity)
        if is_zero(get_uuid)
        exit
        
        var get_grid = ds_get(get_entity,"grid")
        if is_zero(get_grid)
        exit
        
        var grid_x = x_to_grid_x(mouse_x,mouse_y,get_entity)
        var grid_y = y_to_grid_y(mouse_x,mouse_y,get_entity)
        
        var get_value = grid_get_value(get_grid,grid_x,grid_y)
        var new_value = irandom(10)
        
        packet_write(packet.grid_set,get_uuid,grid_x,grid_y,new_value)
        }
    }

if mouse_check_button(mb_right)
    {
    if am_server()
        {
        var get_entity = entity_find_from_point(mouse_x,mouse_y)
            {
            if get_entity != 0
                {
                var get_uuid = uuid_from_entity(get_entity)
                console_add("get_entity is: " + string(get_entity))
                packet_write(packet.entity_destroy,get_uuid)
                entity_destroy_basic(get_uuid)
                console_add("destroyed " + string(get_uuid))
                exit
                }
            }
        }
    //
    }
