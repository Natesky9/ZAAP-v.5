var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.entity_destroy)
        var get_uuid = get_packet_array[data.arg_0]
        
        buffer_write(bout,buffer_u32,get_uuid)
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_uuid = buffer_read(bin,buffer_u32)
        var get_entity = entity_from_uuid(get_uuid);
        if get_entity == 0
            {
            console_add("Error, destroyed entity did not exist")
            exit
            }
        destroy_entity(get_uuid)
        console_add("destroyed " + string(get_uuid))
        
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
