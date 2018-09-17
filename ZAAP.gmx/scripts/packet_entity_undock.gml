///packet_entity_undock(packet_array)


//both arguments are in uuid
var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.entity_undock)
        console_add("initiallizing undock")
        
        var get_uuid = get_packet_array[data.arg_0]
        var get_target = get_packet_array[data.arg_1]
        
        write(get_uuid)
        write(get_target)
        packet_send_all()
        
        break
        }
    //----------------//
    case "client read":
        {
        var get_uuid = read()
        var get_other_uuid = read()
        
        var get_entity = entity_from_uuid(get_uuid)
        var get_other_entity = entity_from_uuid(get_other_uuid)
        
        ds_set(get_entity,"docked",false,key.value)
        ds_set(get_other_entity,"docked",false,key.value)
        
        ds_set(get_entity,"build cell x",false,key.value)
        ds_set(get_entity,"build cell y", false,key.value)
        ds_set(get_other_entity,"build cell x",false,key.value)
        ds_set(get_other_entity,"build cell y", false,key.value)
        
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.entity_undock)
        
        var get_uuid = get_packet_array[data.arg_0]
        var get_target = get_packet_array[data.arg_1]
        
        write(get_uuid)
        write(get_target)
        
        packet_send_host()
        console_add("sending undock request")
        break
        }
    //----------------//
    case "server read":
        {
        var get_uuid = read()
        var get_other_uuid = read()
        
        var get_entity = entity_from_uuid(get_uuid)
        var get_other_entity = entity_from_uuid(get_other_uuid)
        
        ds_set(get_entity,"docked",false,key.value)
        ds_set(get_other_entity,"docked",false,key.value)
        
        ds_set(get_entity,"build cell x",false,key.value)
        ds_set(get_entity,"build cell y", false,key.value)
        ds_set(get_other_entity,"build cell x",false,key.value)
        ds_set(get_other_entity,"build cell y", false,key.value)
        
        
        //packet_entity_undock
        packet_write(packet.entity_undock,get_uuid,get_other_uuid)
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
