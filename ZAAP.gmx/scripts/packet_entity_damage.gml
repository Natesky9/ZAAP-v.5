var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.entity_damage)
        var get_uuid = get_packet_array[data.arg_0]
        var get_damage = get_packet_array[data.arg_1]
        
        uuid_buffer_type = key_to_buffer_type("uuid")
        buffer_write(bout,uuid_buffer_type,get_uuid)
        buffer_write(bout,buffer_u8,get_damage)
        packet_send_all()
        console_add("Sent damage packet")
        break
        }
    //----------------//
    case "client read":
        {
        var uuid_buffer_type = key_to_buffer_type("uuid")
        var get_uuid = buffer_read(bin,uuid_buffer_type)
        var get_damage = buffer_read(bin,buffer_u8)
        
        var get_entity = entity_from_uuid(get_uuid)
        
        var get_x = ds_get(get_entity,"x")
        var get_y = ds_get(get_entity,"y")
        
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
