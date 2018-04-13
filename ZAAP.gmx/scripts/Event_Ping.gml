///Event_Ping()
if am_client()
    {
    if my_socket() != -1
        {
        //timeout script
        var get_map = my_socket()
        if get_map == 0
            {
            show("Error, socket is undefined")
            exit
            }
        ds_add(envar,"ping timeout",1)
        if get("ping timeout") > ping_timeout
            {
            //###//
            //replace with client_destroy
            console_add("Can't communicate with Server")
            show("Can't communicate with Server")
            client_destroy()
            exit
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
    var socket_count = ds_size(sockets)
    for (var i = 0;i < ds_list_size(socket_count);i += 1)
        {
        var get_socket = ds_index(sockets,i)
        var get_map = map_from_socket(get_socket);
        ds_add(get_map,"ping timeout",1)
        var timeout = get_map[? "ping timeout"]
        if get_map [? "ping timeout"] > ping_timeout
            {
            var text = "Can't communicate with socket[" + string(get_socket) + "]"
            var console_text = ds_list_find_index(console_list,text)
            //if this isn't the last thing said, say it
            if console_text != -1
            console_add(text)
            }
        }
    
    //report ping to clients
    if ds_size(sockets)
    and !(get("session time") mod 15)
        {
        //show("return ping")
        //packet_ping_report
        packet_write(packet.ping_report)
        }
    }
