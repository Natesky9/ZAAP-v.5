///packet_set_ownership(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.set_ownership)
        var get_client = get_packet_array[data.arg_0]
        var get_uuid = get_packet_array[data.arg_1]
        write(get_uuid)
        packet_send(get_client)
        break
        }
    //----------------//
    case "client read":
        {
        var get_uuid = read()
        show("got the ownership packet")
        
        var get_entity = entity_from_uuid(get_uuid)
        if is_zero(get_entity)
            {
            console_add("this entity doesn't exist yet")
            show("error11")
            exit
            }
        
        var get_target = ds_get(get_entity,"target")
        if is_zero(get_target)
            {
            console_add("no target")
            show("error12")
            exit
            }
        
        autopilot_start(get_uuid)
        autopilot_add_node(get_uuid,"target",get_target)
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
