if mouse_check_button_pressed(mb_left)
    {
    if am_server()
        {
        //create an entity
        var get_entity = create_entity(mouse_x,mouse_y)
        packet_write(packet.entity_create,get_entity,mouse_x,mouse_y)
        exit
        }
    if am_client()
        {
        if keyboard_check(vk_shift)
        and keyboard_check(vk_control)
            {
            var get_entity = find_rectangle(mouse_x,mouse_y)
            console_add("Requesting control of entity: " + string(get_entity))
            if get_entity != undefined
            packet_write(packet.entity_command,get_entity)
            exit
            }
        packet_write(packet.entity_create,mouse_x,mouse_y)
        exit
        }
    }
if mouse_check_button(mb_right)
    {
    if am_server()
        {
        var get_entity = find_rectangle(mouse_x,mouse_y)
            {
            if get_entity != undefined
                {
                console_add("get_entity is: " + string(get_entity))
                packet_write(packet.entity_destroy,get_entity)
                destroy_entity(get_entity)
                console_add("destroyed " + string(get_entity))
                exit
                }
            }
        }
    }
