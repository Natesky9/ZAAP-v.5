var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.entity_destroy)
        var get_entity = get_packet_array[data.arg_0]
        
        buffer_write(bout,buffer_u32,get_entity)
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_ssn = buffer_read(bin,buffer_u32)
        var get_map = ds_map_find_value(entity_map,get_ssn);
        if get_map == undefined
            {
            console_add("Error, destroyed entity did not exist")
            exit
            }
        destroy_entity(get_map)
        console_add("destroyed " + string(get_ssn))
        
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
