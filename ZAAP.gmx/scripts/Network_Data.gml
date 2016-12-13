//get_packet_array is the filled out packet
get_packet_array = argument[0]
show("Packet [" + string(get_packet_array) + "]")

//get the packet type
var get_packet = packet_type(get_packet_array)

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
