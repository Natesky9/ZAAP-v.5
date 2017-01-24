var get_packet_array = argument0
show("packet_update_entities")
switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.update_entities)
        
        var get_socket = get_packet_array[data.arg_0]
        
        var entity_list_size = ds_list_size(entity_list)
        buffer_write(bout,buffer_u32,entity_list_size)
        show("entity list size is [" + string(entity_list_size) + "]")
        
        for (var i = 0;i < entity_list_size;i += 1)
            {
            //loop
            var get_uuid = ds_list_find_value(entity_list,i)
            
            uuid_write_to_buffer(get_uuid,bout)
            //old code
            /*
            var get_entity = entity_from_uuid(get_uuid)
            var key_list = get_entity[? "key list"]
            
            var get_key_list_size = ds_list_size(key_list)
            buffer_write(bout,buffer_u8,get_key_list_size)
            show("key list size is [" + string(get_key_list_size) + "]")
            
            for (var ii = 0;ii < get_key_list_size;ii += 1)
                {
                var get_key = ds_list_find_value(key_list,ii)
                show("key is: " + get_key)
                var buffer_type = key_to_buffer_type(get_key)
                var get_value = ds_map_find_value(get_entity,get_key)
                show("value is: " + string(get_value))
                
                buffer_write(bout,buffer_string,get_key)
                buffer_write(bout,buffer_type,get_value)
                }
            */
            //end old code
            //end loop
            }
        
        //old code
        /*
        for (var i = 0;i < list_size;i += 1)
            {
            var get_uuid = ds_list_find_value(entity_list,i)
            var get_entity = entity_from_uuid(get_uuid)
            var get_x = ds_map_find_value(get_entity,"x")
            var get_y = ds_map_find_value(get_entity,"y")
            
            buffer_write(bout,buffer_u32,get_uuid)
            buffer_write(bout,buffer_s32,get_x)
            buffer_write(bout,buffer_s32,get_y)
            }
        */
        //end old code
        packet_send(get_socket)
        return true
        }
    //----------------//
    case "client read":
        {
        var get_entity_list_size = buffer_read(bin,buffer_u32)
        show("entity list size is [" + string(get_entity_list_size) + "]")
        repeat get_entity_list_size
            {
            var get_list_size = buffer_read(bin,buffer_u8)
            show("key list size is [" + string(get_list_size) + "]")
            var get_entity = create_entity()
            
            repeat get_list_size
                {
                var get_key = buffer_read(bin,buffer_string)
                show("key is [" + get_key + "]")
                var get_buffer_type = key_to_buffer_type(get_key)
                var get_value = buffer_read(bin,get_buffer_type)
                show("value is [" + string(get_value) + "]")
                entity_add_new_key(get_entity,get_key,get_value)
                }
            var get_uuid = get_entity[? "uuid"]
            ds_map_add(entity_map,get_uuid,get_entity)
            ds_list_add(entity_list,get_uuid)
            }
        //old code
        /*
        for (var i = 0;i < list_size;i += 1)
            {
            var get_uuid = buffer_read(bin,buffer_u32)
            var get_x = buffer_read(bin,buffer_s32)
            var get_y = buffer_read(bin,buffer_s32)
            
            var get_new_entity = create_entity(get_uuid,get_x,get_y)
            }
        */
        }
    //----------------//
    case "client write":
        {
        return true
        }
    //----------------//
    case "server read":
        {
        return true
        }
    //----------------//
    default:
        {
        show("Error, no mode defined!")
        show("in packet_template")
        return false
        }
    //----------------//
    }
