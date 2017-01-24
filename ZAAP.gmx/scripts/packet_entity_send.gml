var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.entity_send)
        var get_uuid = get_packet_array[data.arg_0]
        show("uuid is [" + string(get_uuid) + "]")
        var get_uuid_buffer_type = key_to_buffer_type("uuid")
        buffer_write(bout,get_uuid_buffer_type,get_uuid)
        uuid_write_to_buffer(get_uuid,bout)
        
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_uuid_buffer_type = key_to_buffer_type("uuid")
        var get_uuid = buffer_read(bin,get_uuid_buffer_type)
        var get_entity = entity_from_uuid(get_uuid)
        var get_list_size = buffer_read(bin,buffer_u8)
        
        show("updating entity with uuid of [" + string(get_uuid) + "]")
        repeat get_list_size
            {
            var get_key = buffer_read(bin,buffer_string)
            var get_buffer_type = key_to_buffer_type(get_key)
            var get_value = buffer_read(bin,get_buffer_type);
            get_entity[? get_key] = get_value
            show("updated key [" + get_key + "] with value of [" + string(get_value) + "]")
            }
        break
        }
    //----------------//
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.entity_send)
        
        var get_uuid = get_packet_array[data.arg_0]
        var get_uuid_buffer_type = key_to_buffer_type("uuid")
        buffer_write(bout,get_uuid_buffer_type,get_uuid)
        
        var get_control = get_packet_array[data.arg_1]
        buffer_write(bout,buffer_string,get_control)
        
        if get_control != "update"
            {
            var get_control_value = get_packet_array[data.arg_2]
            var get_control_buffer_type = key_to_buffer_type(get_control)
            buffer_write(bout,get_control_buffer_type,get_control_value)
            }
        
        packet_send_host()
        
        break
        }
    //----------------//
    case "server read":
        {
        var get_uuid_buffer_type = key_to_buffer_type("uuid")
        var get_uuid = buffer_read(bin,get_uuid_buffer_type)
        
        var get_control = buffer_read(bin,buffer_string)
        
        if get_control != "update"
            {
            var get_control_buffer_type = key_to_buffer_type(get_control)
            
            var get_control_value = buffer_read(bin,get_control_buffer_type)
            
            //update the entity
            var get_entity = entity_from_uuid(get_uuid)
            if get_entity == 0
                {
                show("Entity command pointed to entity that does not exist!")
                exit
                }
            get_entity[? get_control] = get_control_value
            }
        
        packet_write(packet.entity_send,get_uuid)
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
