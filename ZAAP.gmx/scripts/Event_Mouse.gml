if mouse_check_button_pressed(mb_left)
    {
    if am_server()
        {
        //create an entity
        var get_entity = create_new_entity(mouse_x,mouse_y)
        
        packet_write(packet.entity_create,get_entity,mouse_x,mouse_y)
        exit
        }
    if am_client()
        {
        var get_entity = find_rectangle(mouse_x,mouse_y)
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
            packet_write(packet.entity_send,get_uuid,"update")
            exit
            }
        //this is temporary
        packet_write(packet.entity_create,mouse_x,mouse_y)
        exit
        //end temporary
        }
    }
if mouse_check_button(mb_right)
    {
    if am_server()
        {
        var get_entity = find_rectangle(mouse_x,mouse_y)
            {
            if get_entity != 0
                {
                var get_uuid = uuid_from_entity(get_entity)
                console_add("get_entity is: " + string(get_entity))
                packet_write(packet.entity_destroy,get_uuid)
                destroy_entity(get_uuid)
                console_add("destroyed " + string(get_uuid))
                exit
                }
            }
        }
    }
