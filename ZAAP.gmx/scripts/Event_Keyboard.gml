if keyboard_check_pressed(ord('S'))
server_create()
if keyboard_check_pressed(ord('V'))
keyboard_pressed_v()


if keyboard_check_pressed(vk_escape)
    {
    if am_client()
        {
        data_structure_clear_all()
        network_destroy(game_client)
        SSS = -1
        host_connection = -1
        game_client = -1
        }
    //game_end()
    }
if keyboard_check_pressed(vk_enter)
    {
    if am_server()
    or am_client()
        {
        //console_add(keyboard_string)
        packet_write(packet.chat,keyboard_string)
        }
    if keyboard_string != ""
        {
        
        
        //client creation
        if not am_server()
        and not am_client()
            {
            var ip = keyboard_string
            var port = 5678
            var client_created = client_create()
            if client_created
                {
                var client_connected = client_connect(ip,port)
                console_add("client connected is: " + string(client_connected))
                
                if client_connected == -1
                    {
                    console_add("Client not connected")
                    show("Client: " + string(client_connected))
                    //find a way to move this into a timeout script
                    //since this advances too quickly for client_connected to be read?
                    client_destroy()
                    }
                }
            if !client_created
                {
                console_add("Error, client failed to create")
                }
            }
        //end client creation

        keyboard_string = ""
        }
    }
if keyboard_check_pressed(vk_f4)
    {
    show_debug = !show_debug
    show_debug_overlay(show_debug)
    console_add("Toggled debug overlay")
    }

if keyboard_check_pressed(vk_f3)
    {
    show_debug_data_structures = !show_debug_data_structures
    console_add("Toggled debug overlay")
    }
