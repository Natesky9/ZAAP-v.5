//get_function is "read" or "write"
var get_function
//get_mode is the specific direction
var get_mode
//get_packet_array is the filled out packet
var get_packet_array


get_function = argument[0]

get_packet_array = argument[1]

get_mode = packet_mode(get_function);

get_packet_array[0] = get_mode

//get the packet type
//if reading, read the first byte
//if writing, use the first argument
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
