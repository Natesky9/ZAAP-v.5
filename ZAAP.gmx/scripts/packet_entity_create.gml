var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.entity_create)
        
        var get_uuid = get_packet_array[data.arg_0]
        uuid_write_to_buffer(get_uuid,bout)
        
        //old code
        /*
        var get_x = get_packet_array[data.arg_1]
        var get_y = get_packet_array[data.arg_2]
        
        buffer_write(bout,buffer_u8,packet.entity_create)
        buffer_write(bout,buffer_u32,get_uuid)
        buffer_write(bout,buffer_s32,get_x)
        buffer_write(bout,buffer_s32,get_y)
        */
        
        //send to all
        packet_send_all()
        
        return true
        }
    case "client read":
        {
        var get_list_size = buffer_read(bin,buffer_u8)
        
        var get_entity = create_entity()
        
        repeat get_list_size
            {
            var get_key = buffer_read(bin,buffer_string)
            var get_buffer_type = key_to_buffer_type(get_key)
            var get_value = buffer_read(bin,get_buffer_type)
            entity_add_new_key(get_entity,get_key,get_value)
            }
        var get_uuid = get_entity[? "uuid"]
        ds_map_add(entity_map,get_uuid,get_entity)
        ds_list_add(entity_list,get_uuid)
        
        //old code
        /*
        var get_uuid = buffer_read(bin,buffer_u32)
        var get_x = buffer_read(bin,buffer_s32)
        var get_y = buffer_read(bin,buffer_s32)
        
        var get_entity = create_entity(get_uuid,get_x,get_y)
        */
        return true
        }
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.entity_create)
        
        //request an object to be created
        //most likely not to be used later
        var get_x = get_packet_array[data.arg_0]
        var get_y = get_packet_array[data.arg_1]
        
        buffer_write(bout,buffer_s32,get_x)
        buffer_write(bout,buffer_s32,get_y)
        
        packet_send_host()
        return true
        }
    case "server read":
        {
        //most likely not going to be used
        //since clients shouldn't request objects
        var get_x = buffer_read(bin,buffer_s32)
        var get_y = buffer_read(bin,buffer_s32)
        
        var get_uuid = create_new_entity(get_x,get_y)
        packet_write(packet.entity_create,get_uuid,get_x,get_y)
        return true
        }
    default:
        {
        //spaghetti
        show("Error, no mode defined!")
        show("in packet_template")
        return false
        }
    }
