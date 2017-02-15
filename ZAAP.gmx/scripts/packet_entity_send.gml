///DISCONTINUED
//pls delete


var get_packet_array = argument0
switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.entity_send)
        var get_uuid = get_packet_array[data.arg_0]
        var get_key = get_packet_array[data.arg_1]
        var get_value = get_packet_array[data.arg_2]
        
        var get_buffer_type = key_to_buffer_type("uuid")
        buffer_write(bout,get_buffer_type,get_uuid)
        
        write_key_to_buffer(get_key,get_value)

        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var uuid_buffer_type = key_to_buffer_type("uuid")
        var get_uuid = buffer_read(bin,uuid_buffer_type)
        
        var get_entity = entity_from_uuid(get_uuid)
        
        read_buffer_to_key(get_entity)
        /*
        var get_key = buffer_read(bin,buffer_string)
        
        var get_buffer_type = key_to_buffer_type(get_key)
        var get_value = buffer_read(bin,get_buffer_type)
        
        
        if not is_zero(get_entity)
            {
            get_entity[? get_key] = get_value
            //we're done here?
            }
        
        //read_buffer_to_uuid()
        */
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
        //removed
        /*
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
        */
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
