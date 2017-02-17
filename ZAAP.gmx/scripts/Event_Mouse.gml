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
        exit
        //removed
        var get_entity = entity_find_from_point(mouse_x,mouse_y)
        if get_entity != 0
        var get_uuid = uuid_from_entity(get_entity)
        
        if keyboard_check(vk_shift)
        and keyboard_check(vk_control)
        and get_entity != 0
            {
            console_add("Requesting control of entity: " + string(get_entity))
            if get_entity != 0
                {
                packet_write(packet.entity_command,get_uuid)
                }
            exit
            }
        
        if get_entity != 0
        and get_uuid != 0
            {
            //packet_write(packet.entity_send,get_uuid,"update")
            exit
            }
        //this is temporary
        exit
        //end temporary
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
    if am_client()
        {
        var get_entity = entity_find_from_point(mouse_x,mouse_y)
        if is_zero(get_entity) exit
        
        var grid_x = x_to_grid_x(mouse_x,mouse_y,get_entity)
        var grid_y = y_to_grid_y(mouse_x,mouse_y,get_entity)
        
        if grid_x == -1
        or grid_y == -1
        exit
        
        console_add(string(grid_x) + ":" + string(grid_y))
        }
    }
