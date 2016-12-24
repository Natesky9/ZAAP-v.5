var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        //update all the clients on the sockets
        var sockets = ds_list_size(socket_list)
        
        //socket update packet
        seek()
        buffer_write(bout,buffer_u8,packet.update_sockets)
        buffer_write(bout,buffer_u8,sockets)
        for (var i = 0;i < sockets;i += 1)
            {
            var get_socket = ds_list_find_value(socket_list,i)
            buffer_write(bout,buffer_u8,get_socket)
            }
        
        for (var i = 0;i < sockets;i += 1)
            {
            var get_socket = ds_list_find_value(socket_list,i)
            var data_sent = network_send_packet(get_socket,bout,buffer_tell(bout))
            if !data_sent
            console_add("Packet failed to send")
            if data_sent
            show("Packet of size")
            show("[" + string(data_sent) + "] sent")
            }
        break
        }
    //----------------//
    case "client read":
        {
        seek()
        var sockets = buffer_read(bin,buffer_u8)
        
        ds_list_clear(socket_list)
        
        for (var i = 0;i < sockets;i += 1)
            {
            var get_socket = buffer_read(bin,buffer_u8)
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
