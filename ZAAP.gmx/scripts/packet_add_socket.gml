///packet_add_socket(packet_array)
//###//
//change the names and the naming conventions
//to use "player" to distinguish
//between sockets and player maps

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.add_socket)
        var get_socket = get_packet_array[data.arg_0]
        show("adding socket: " + string(get_socket))
        
        write_socket_to_buffer(get_socket)
        
        packet_send_all()
        console_add("Adding Socket[" + string(get_socket) + "]")
        break
        }
    //----------------//
    case "client read":
        {
        read_buffer_to_socket()
        
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.null)
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
        show("Error, no mode defined!")
        show("in packet_template")
        break
        }
    //----------------//
    }
