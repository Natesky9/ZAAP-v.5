///packet_entity_destroy(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.entity_destroy)
        var get_uuid = get_packet_array[data.arg_0]
        
        write(get_uuid)
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_uuid = read()
        var get_entity = entity_from_uuid(get_uuid);
        if get_entity == 0
            {
            show("entity to destroy was already destroyed")
            exit
            }
        
        entity_destroy_basic(get_uuid)
        
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
