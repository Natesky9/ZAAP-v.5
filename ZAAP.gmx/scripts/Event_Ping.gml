///Event_Ping()
if am_client()
    {
    
    if get("SSS") != -1
        {
        //timeout script
        var get_map = map_from_socket(get("SSS"));
        if get_map == 0
            {
            show("Error, socket is undefined")
            exit
            }
        get_map[? "ping timeout"] -= 1
        if get_map[? "ping timeout"] <= 0
            {
            //###//
            //replace with client_destroy
            console_add("Can't communicate with Server")
            //disconnect
            data_structure_clear_all()
            var get_client = get("client")
            network_destroy(get_client)
            set("client",-1)
            set("SSS",-1)
            host_connection = -1
            view_reset()
            console_add("You have been disconnected")
            }
        //end timeout scrip
        
        //send a ping
        if !(get("session time") mod 30)
            {
            //show("ping")
            //packet_ping
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
    and !(get("session time") mod 15)
        {
        //show("return ping")
        //packet_ping_report
        packet_write(packet.ping_report)
        }
    }
