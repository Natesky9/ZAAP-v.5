///packet_inform_sss(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.inform_sss)
        
        var get_socket = get_packet_array[data.arg_0]
        buffer_write(bout,buffer_u8,get_socket)
        
        packet_send(get_socket)
        return true
        }
    //----------------//
    case "client read":
        {
        var get_sss = buffer_read(bin,buffer_u8)
        
        SSS = get_sss
        var get_map = map_from_socket(SSS);
 
        get_map[? "ping timeout"] = ping_timeout
 
        
        console_add("You are Player[" + string(SSS) + "]")
        return true
        }
    //----------------//
    case "client write":
        {
        return true
        }
    //----------------//
    case "server read":
        {
        return true
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
