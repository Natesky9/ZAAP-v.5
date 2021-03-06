///packet_ping_report(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.ping_report)
        
        var socket_count = ds_size(sockets)
        write(socket_count)
        
        for (var i = 0;i < socket_count;i += 1)
            {
            var get_socket = ds_index(sockets,i)
            var get_player = map_from_socket(get_socket)
            var get_ping = ds_get(get_player,"ping")
            
            if get_ping > 9999
                {
                get_ping = 9999
                }
            write(get_socket)
            write(get_ping)
            }
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_list_size = read()
        
        for (var i = 0;i < get_list_size;i += 1)
            {
            var get_socket = read()
            var get_ping = read()
            
            var get_player = map_from_socket(get_socket)
            
            if get_player != 0
                {//check for existence
                get_player[? "ping"] = get_ping
                }
            if get_player == 0
            console_add("error")
            }
            
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.ping_report)
        var get_ping = get_packet_array[data.arg_0]
        
        write(get_ping)
        
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        var get_socket = ds_get(async_load,"id")
        var get_ping = read()
        
        var get_map = map_from_socket(get_socket);
        get_map[? "ping"] = get_ping
        break
        }
    //----------------//
    default:
        {
        show("Error, no mode defined!")
        show("in packet_template")
        break
        }
    //----------------//
    }
