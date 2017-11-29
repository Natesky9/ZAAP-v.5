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
        write_type(packet.entity_dock)
        console_add("initiallizing dock")
        
        var get_uuid = get_packet_array[data.arg_0]
        var get_target = get_packet_array[data.arg_1]
        
        var uuid_buffer_type = key_to_buffer_type("uuid")
        
        buffer_write(bout,uuid_buffer_type,get_uuid)
        buffer_write(bout,uuid_buffer_type,get_target)
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
        write_type(packet.entity_dock)
        
        var get_uuid = get_packet_array[data.arg_0]
        var get_target = get_packet_array[data.arg_1]
        
        var uuid_buffer_type = key_to_buffer_type("uuid")
        
        buffer_write(bout,uuid_buffer_type,get_uuid)
        buffer_write(bout,uuid_buffer_type,get_target)
        
        packet_send_host()
        console_add("sending dock request")
        break
        }
    //----------------//
    case "server read":
        {
        var uuid_buffer_type = key_to_buffer_type("uuid")
        
        var get_uuid = buffer_read(bin,uuid_buffer_type)
        var get_target = buffer_read(bin,uuid_buffer_type)
        
        console_add("uuid is: " + string(get_uuid))
        
        var result = entity_dock_pair_advanced(get_uuid,get_target)
        
        console_add("docking result: " + string(result))
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
