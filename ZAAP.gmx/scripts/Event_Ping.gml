if am_client()
    {
    
    if SSS != -1
        {
        //timeout script
        var get_map = map_from_socket(SSS);
        if get_map == 0
            {
            show("Error, socket is undefined")
            exit
            }
        get_map[? "ping timeout"] -= 1
        if get_map[? "ping timeout"] <= 0
            {
            console_add("Can't communicate with Server")
            //disconnect
            data_structure_clear_all()
            network_destroy(game_client)
            SSS = -1
            host_connection = -1
            game_client = -1
            view_reset()
            console_add("You have been disconnected")
            }
        //end timeout scrip
        
        //send a ping
        if !(ds_get(environment,"steps since start") mod 30)
            {
            //show("ping")
            packet_write(packet.ping)
            }
        //end send ping
        }
    }

if am_server()
    {
    for (var i = 0;i < ds_list_size(socket_list);i += 1)
        {
        var get_socket = ds_list_find_value(socket_list,i);
        var get_map = map_from_socket(get_socket);
        var get_ping_timeout = ds_get(get_map,"ping timeout");
        get_map[? "ping timeout"] = get_ping_timeout - 1
        var text = "Can't communicate with socket[" + string(get_socket) + "]"
        var console_text = ds_list_find_index(console_list,text)
        if get_map [? "ping timeout"] <= 0
        and console_text != -1
            {
            console_add(text)
            }
        }
    
    //report ping to clients
    if ds_list_size(socket_list)
    and !(ds_get(environment,"steps since start") mod 15)
        {
        //show("return ping")
        packet_write(packet.ping_report)
        }
    }
