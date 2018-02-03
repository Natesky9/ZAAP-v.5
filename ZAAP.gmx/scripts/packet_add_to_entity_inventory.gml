///packet_template(packet_array)
//###//
//might not be necesary until later?
var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.null)
        break
        }
    //----------------//
    case "client read":
        {
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
