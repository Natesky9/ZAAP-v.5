///packet_entity_dock(packet_array)
//###//
//add in all the cases where docking may be broken
//and add a script to account for that
var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.entity_dock)
        
        var get_uuid = get_packet_array[data.arg_0]
        var get_target = get_packet_array[data.arg_1]
        
        write_key_to_buffer("uuid",get_uuid)
        write_key_to_buffer("uuid",get_target)
        packet_send_all()
        
        break
        }
    //----------------//
    case "client read":
        {
        var uuid_buffer_type = key_to_buffer_type("uuid")
        
        var get_uuid = buffer_read(bin,uuid_buffer_type)
        var get_target = buffer_read(bin,uuid_buffer_type)
        
        entity_dock_pair(get_uuid,get_target)
        break
        }
    //----------------//
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.entity_dock)
        
        var get_uuid = get_packet_array[data.arg_0]
        var get_target = get_packet_array[data.arg_1]
        
        write_key_to_buffer("uuid",get_uuid)
        write_key_to_buffer("uuid",get_target)
        
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        var uuid_buffer_type = key_to_buffer_type("uuid")
        
        var get_uuid = buffer_read(bin,uuid_buffer_type)
        var get_target = buffer_read(bin,uuid_buffer_type)
        
        var result = entity_dock_pair_advanced(get_uuid,get_target)
        
        if result
        //packet_entity_dock
        packet_write(packet.entity_dock,get_uuid,get_target)
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
