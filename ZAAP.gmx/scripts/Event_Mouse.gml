if mouse_check_button_pressed(mb_left)
    {
    if am_server()
        {
        var done
        //do done checks
        
        done = mouse_left_click_entity_list()
        if done exit
        
        done = mouse_create()
        if done exit
        

        exit
        }
    if am_client()
        {
        var get_entity = entity_find_from_point(mouse_x,mouse_y,false)
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

if mouse_check_button_pressed(mb_right)
    {
    if am_server()
        {
        done = mouse_right_click_entity_list()
        if done exit
        
        
        var get_entity = entity_find_from_point(mouse_x,mouse_y,false)
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
