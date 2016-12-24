if keyboard_check_pressed(ord('S'))
server_create()


if keyboard_check_pressed(vk_escape)
    {
    game_end()
    }
if keyboard_check_pressed(vk_enter)
    {
    if game_server >= 0
        or game_client >= 0
            {
            //console_add(keyboard_string)
            packet_write(packet.chat,keyboard_string)
            }
    if keyboard_string != ""
        {
        if game_server == -1
        and game_client == -1
            {
            var ip = keyboard_string
            var port = 5678
            var client_created = client_create()
            if client_created
                {
                var client_connected = client_connect(ip,port)
                if !client_connected
                    {
                    network_destroy(game_client)
                    }
                }
            if !client_created
                {
                console_add("Error, client failed to create")
                }
            }

        keyboard_string = ""
        }
    }
if keyboard_check_pressed(vk_f4)
    {
    show_debug = !show_debug
    show_debug_overlay(show_debug)
    console_add("Toggled debug overlay")
    }
    
if mouse_check_button_pressed(mb_left)
    {
    if game_server >= 0
        {
        //create an entity
        var get_entity = create_entity(mouse_x,mouse_y)
        packet_write(packet.entity_create,get_entity,mouse_x,mouse_y)
        exit
        }
    if game_client >= 0
        {
        packet_write(packet.entity_create,mouse_x,mouse_y)
        exit
        }
    }
