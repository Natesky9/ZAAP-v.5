var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        var get_socket = get_packet_array[data.arg_0]
        var get_ping = get_packet_array[data.arg_1]
        
        show("received ping of: " + string(get_ping))
        
        buffer_write(bout,buffer_u8,packet.ping)
        buffer_write(bout,buffer_u32,get_ping)
        
        packet_send(get_socket)
        return true
        }
    //----------------//
    case "client read":
        {
        var get_timestamp = buffer_read(bin,buffer_u32)
        
        var get_ping = current_time - get_timestamp
        
        var get_socket_map = socket_map[? SSS];
        get_socket_map[? "ping timeout"] = ping_timeout
        
        show("Ping of [" + string(get_ping) + "]")
        packet_write(packet.ping_report,get_ping)
        
        return true
        }
    //----------------//
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.ping)
        //write the current time
        buffer_write(bout,buffer_u32,current_time)
        //send
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        //read the ping
        var get_ping = buffer_read(bin,buffer_u32)
        //get the socket?
        var get_socket = ds_map_find_value(async_load,"id")
        
        var get_socket_map = ds_map_find_value(socket_map,get_socket)
        
        //don't send the ping yet
        //ds_map_replace(get_socket_map,"ping",get_ping)
        
        
        //write the packet
        packet_write(packet.ping,get_socket,get_ping)
        break
        }
    //----------------//
    default:
        {
        show("Error, no mode defined!")
        show("in packet_template")
        return false
        }
    //----------------//
    }
