var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.update_entities)
        
        var get_socket = get_packet_array[data.arg_0]
        
        var list_size = ds_list_size(entity_list)
        buffer_write(bout,buffer_u32,list_size)
        
        for (var i = 0;i < list_size;i += 1)
            {
            var get_entity = ds_list_find_value(entity_list,i)
            var get_x = ds_map_find_value(get_entity,"x")
            var get_y = ds_map_find_value(get_entity,"y")
            
            buffer_write(bout,buffer_u32,get_entity)
            buffer_write(bout,buffer_s32,get_x)
            buffer_write(bout,buffer_s32,get_y)
            }
        packet_send(get_socket)
        return true
        }
    //----------------//
    case "client read":
        {
        var list_size = buffer_read(bin,buffer_u32)
        
        //add a check to not update so that
        //clients can update instead of repopulate their lists
        
        for (var i = 0;i < list_size;i += 1)
            {
            var get_entity = buffer_read(bin,buffer_u32)
            var get_x = buffer_read(bin,buffer_s32)
            var get_y = buffer_read(bin,buffer_s32)
            
            var get_new_entity = create_entity(get_x,get_y)
            ds_map_add(get_new_entity,"ssn",get_entity)
            
            //map entity to server's side
            ds_map_add(entity_map,get_entity,get_new_entity)
            }
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
