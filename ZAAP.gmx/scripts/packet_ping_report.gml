var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.ping_report)
        
        var list_size = ds_list_size(socket_list)
        
        buffer_write(bout,buffer_u8,list_size)
        
        for (var i = 0;i < list_size;i += 1)
            {
            var get_socket = ds_list_find_value(socket_list,i)
            
            var get_socket_map = map_from_socket(get_socket)
            
            var get_ping = ds_get(get_socket_map,"ping")
            
            if get_ping > 9999
                {
                get_ping = 9999
                }
            buffer_write(bout,buffer_u8,get_socket)
            buffer_write(bout,buffer_u16,get_ping)
            }
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_list_size = buffer_read(bin,buffer_u8)
        
        for (var i = 0;i < get_list_size;i += 1)
            {
            var get_socket = buffer_read(bin,buffer_u8)
            var get_ping = buffer_read(bin,buffer_u16)
            
            var get_socket_map = map_from_socket(get_socket)
            
            if get_socket_map != 0
                {//check for existence
                get_socket_map[? "ping"] = get_ping
                }
            if get_socket_map == 0
            console_add("error")
            }
            
        break
        }
    //----------------//
    case "client write":
        {
        var get_ping = get_packet_array[data.arg_0]
        
        buffer_write(bout,buffer_u8,packet.ping_report)
        buffer_write(bout,buffer_u16,get_ping)
        
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        var get_socket = ds_map_find_value(async_load,"id")
        var get_ping = buffer_read(bin,buffer_u16)
        
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
