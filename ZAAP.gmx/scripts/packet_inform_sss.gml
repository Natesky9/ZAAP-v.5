///packet_inform_sss(packet_array)
//###//
//rename the SSS naming convention to
//something more relevant?

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.inform_sss)
        
        var get_socket = get_packet_array[data.arg_0]
        write(get_socket)
        
        packet_send(get_socket)
        return true
        }
    //----------------//
    case "client read":
        {
        var get_sss = read()
        
        set("SSS",get_sss)
        var get_map = map_from_socket(get("SSS"));
 
        //get_map[? "ping timeout"] = ping_timeout
 
        
        console_add("You are Player[" + string(get_sss) + "]")
        return true
        }
    //----------------//
    case "client write":
        {
        write_type(packet.null)
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
        show("in packet_inform_sss")
        return false
        }
    //----------------//
    }
