//get_packet_array is the filled out packet
get_packet_array = argument[0]

//get the packet type
var get_packet = packet_type(get_function,get_packet_array)

switch get_packet
    {
    //----------------//
    case packet.update_sockets:
        {
        packet_update_sockets(get_packet_array);break
        }
    //----------------//
    case packet.chat:
        {
        packet_chat(get_packet_array);break
        }
    //----------------//
    default:
        {
        console_add("Error, no packet defined");break
        }
    //----------------//
    }
