var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    case "server write":
        {
        var get_entity = get_packet_array[data.arg_0]
        var get_x = get_packet_array[data.arg_1]
        var get_y = get_packet_array[data.arg_2]
        
        buffer_write(bout,buffer_u8,packet.entity_create)
        buffer_write(bout,buffer_u32,get_entity)
        buffer_write(bout,buffer_s32,get_x)
        buffer_write(bout,buffer_s32,get_y)
        
        //send to all
        packet_send_all()
        
        return true
        }
    case "client read":
        {
        var get_ssn = buffer_read(bin,buffer_u32)
        var get_x = buffer_read(bin,buffer_s32)
        var get_y = buffer_read(bin,buffer_s32)
        
        var get_entity = create_entity(get_x,get_y)
        ds_map_add(get_entity,"ssn",get_ssn)
        ds_map_add(entity_map,get_ssn,get_entity)
        
        return true
        }
    case "client write":
        {
        //request an object to be created
        //most likely not to be used later
        var get_x = get_packet_array[data.arg_0]
        var get_y = get_packet_array[data.arg_1]
        
        buffer_write(bout,buffer_u8,packet.entity_create)
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
        
        var get_entity = create_entity(get_x,get_y)
        packet_write(packet.entity_create,get_entity,get_x,get_y)
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
