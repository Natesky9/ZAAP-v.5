///packet_entity_set_pilot(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.entity_set_pilot)
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
        buffer_write(bout,buffer_u8,packet.null)
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
