if am_client()
    {
    
    if SSS != -1
        {
        //timeout script
        var get_map = ds_map_find_value(socket_map,SSS);
        get_map[? "ping timeout"] -= 1
        if get_map[? "ping timeout"] <= 0
            {
            console_add("Can't communicate with Server")
            }
        //end timeout scrip
        
        //send a ping
        if !(steps_since_game_started mod 30)
            {
            show("ping")
            packet_write(packet.ping)
            }
        //end send ping
        }
    }

if am_server()
    {
    for (var i = 0;i < ds_list_size(socket_list);i += 1)
        {
        var get_socket = ds_list_find_value(socket_list,i)
        var get_map = ds_map_find_value(socket_map,get_socket);
        
        get_map[? "ping timeout"] -= 1
        if get_map [? "ping timeout"] <= 0
            {
            console_add("Can't communicate with socket[" + string(get_socket) + "]")
            }
        }
    
    //report ping to clients
    if ds_list_size(socket_list)
    and !(steps_since_game_started mod 30)
        {
        show("return ping")
        packet_write(packet.ping_report)
        }
    }
