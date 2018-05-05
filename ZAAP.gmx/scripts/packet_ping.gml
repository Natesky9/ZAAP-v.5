///packet_ping(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.ping)
        var get_socket = get_packet_array[data.arg_0]
        var get_ping = get_packet_array[data.arg_1]
        
        //show("received ping of: " + string(get_ping))
        
        write(get_ping)
        
        packet_send(get_socket)
        return true
        }
    //----------------//
    case "client read":
        {
        var get_timestamp = read()
        
        var get_ping = current_time - get_timestamp
        
        //show("got a ping of: " + string(get_ping))
        
        var get_player = my_socket();
        if is_zero(get_player) exit
        
        set("ping timeout",0)
        //packet_ping_report
        packet_write(packet.ping_report,get_ping)
        
        return true
        }
    //----------------//
    case "client write":
        {
        write_type(packet.ping)
        //write the current time
        write(current_time)
        //send
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        //read the ping
        var get_ping = read()
        //get the socket?
        var get_socket = ds_get(async_load,"id")
        
        var get_player = map_from_socket(get_socket)
        
        //don't send the ping yet
        //ds_map_replace(get_player,"ping",get_ping)
        
        
        //write the packet
        //packet_ping
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
