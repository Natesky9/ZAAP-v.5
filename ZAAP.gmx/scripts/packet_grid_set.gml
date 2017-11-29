///packet_grid_set(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.grid_set)
        var get_uuid = get_packet_array[data.arg_0]
        var get_grid_x = get_packet_array[data.arg_1]
        var get_grid_y = get_packet_array[data.arg_2]
        var get_value = get_packet_array[data.arg_3]
        
        var get_entity = entity_from_uuid(get_uuid)
        if is_zero(get_entity)
            {
            console_add("error")
            exit
            }
        
        var get_grid = grid_from_entity(get_entity)
        if is_zero(get_grid)
            {
            console_add("error2")
            exit
            }
        
        var uuid_buffer_type = key_to_buffer_type("uuid")
        buffer_write(bout,uuid_buffer_type,get_uuid)
        buffer_write(bout,buffer_u8,get_grid_x)
        buffer_write(bout,buffer_u8,get_grid_y)
        buffer_write(bout,buffer_u8,get_value)
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var uuid_buffer_type = key_to_buffer_type("uuid")
        var get_uuid = buffer_read(bin,uuid_buffer_type)
        var get_grid_x = buffer_read(bin,buffer_u8)
        var get_grid_y = buffer_read(bin,buffer_u8)
        var get_value = buffer_read(bin,buffer_u8)
        
        
        
        var get_entity = entity_from_uuid(get_uuid)
        if is_zero(get_entity)
            {
            console_add("error 3")
            exit
            }
        
        var get_grid = grid_from_entity(get_entity)
        if is_zero(get_grid)
            {
            console_add("error 4")
            exit
            }
        
        grid_set_value(get_entity,get_grid,get_grid_x,get_grid_y,get_value)
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.grid_set)
        var get_uuid = get_packet_array[data.arg_0]
        var get_grid_x = get_packet_array[data.arg_1]
        var get_grid_y = get_packet_array[data.arg_2]
        var get_value = get_packet_array[data.arg_3]
        
        var uuid_buffer_type = key_to_buffer_type("uuid")
        buffer_write(bout,uuid_buffer_type,get_uuid)
        buffer_write(bout,buffer_u8,get_grid_x)
        buffer_write(bout,buffer_u8,get_grid_y)
        buffer_write(bout,buffer_u8,get_value)
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        
        var uuid_buffer_type = key_to_buffer_type("uuid")
        var get_uuid = buffer_read(bin,uuid_buffer_type)
        var get_entity = entity_from_uuid(get_uuid)
        var get_grid = grid_from_entity(get_entity)
        var get_grid_x = buffer_read(bin,buffer_u8)
        var get_grid_y = buffer_read(bin,buffer_u8)
        var get_value = buffer_read(bin,buffer_u8)
        
        grid_set_value_advanced(get_entity,get_grid,get_grid_x,get_grid_y,get_value)
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
