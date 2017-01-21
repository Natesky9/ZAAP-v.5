var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.update_sockets)
        var get_update_socket = get_packet_array[data.arg_0]
        //update all the clients on the sockets
        var sockets = ds_list_size(socket_list) -1
        
        //socket update packet
        buffer_write(bout,buffer_u8,sockets)
        for (var i = 0;i < sockets+1;i += 1)
            {
            var get_socket = ds_list_find_value(socket_list,i)
            
            if get_socket != get_update_socket
                {
                var get_socket_map = ds_map_find_value(socket_map,get_socket)
                var get_ping = ds_map_find_value(get_socket_map,"ping")
                
                buffer_write(bout,buffer_u8,get_socket)
                buffer_write(bout,buffer_u16,get_ping)
                }
            }
        
        packet_send(get_update_socket)
        break
        }
    //----------------//
    case "client read":
        {
        var sockets = buffer_read(bin,buffer_u8)
        
        
        
        for (var i = 0;i < sockets;i += 1)
            {
            var get_socket = buffer_read(bin,buffer_u8)
            var get_ping = buffer_read(bin,buffer_u16)
            
            var get_map = ds_create(ds_type_map)
            ds_map_add(get_map,"ping",get_ping)
            ds_map_add(get_map,"ping timeout",ping_timeout)
            show("added the ping timeout")
            ds_map_add(socket_map,get_socket,get_map)
            
            ds_list_add(socket_list,get_socket)
            }
        break
        }
    //----------------//
    case "client write":
        {
        break
        }
    //----------------//
    case "server read":
        {
        break
        }
    //----------------//
    default:
        {
        console_add("Error, no packet defined");break
        }
    //----------------//
    }
