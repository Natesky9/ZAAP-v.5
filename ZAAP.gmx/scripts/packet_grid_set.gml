var get_packet_array = argument0
console_add("packet grid set")
switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        console_add("server write")
        buffer_write(bout,buffer_u8,packet.grid_set)
        var get_uuid = get_packet_array[data.arg_0]
        var get_grid_x = get_packet_array[data.arg_1]
        var get_grid_y = get_packet_array[data.arg_2]
        var get_value = get_packet_array[data.arg_3]
        
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
        console_add("start here")
        var uuid_buffer_type = key_to_buffer_type("uuid")
        var get_uuid = buffer_read(bin,uuid_buffer_type)
        var get_grid_x = buffer_read(bin,buffer_u8)
        var get_grid_y = buffer_read(bin,buffer_u8)
        var get_value = buffer_read(bin,buffer_u8)
        
        var get_entity = entity_from_uuid(get_uuid)
        if is_zero(get_entity)
        exit
        
        var get_grid = ds_get(get_entity,"grid")
        if is_zero(get_grid)
        exit
        
        var get_vertex_buffer = ds_get(get_entity,"vertex buffer")
        
        if not is_zero(get_vertex_buffer)
        vertex_delete_buffer(get_vertex_buffer)
        
        ds_set(get_entity,"vertex buffer",false)
        
        get_grid[# get_grid_x,get_grid_y] = get_value
        
        console_add("grid edited")
        break
        }
    //----------------//
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.grid_set)
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
        var get_grid_x = buffer_read(bin,buffer_u8)
        var get_grid_y = buffer_read(bin,buffer_u8)
        var get_value = buffer_read(bin,buffer_u8)
        
        var get_entity = entity_from_uuid(get_uuid)
        if is_zero(get_entity)
        exit
        
        var get_grid = ds_get(get_entity,"grid")
        if is_zero(get_grid)
        exit
        
        var get_vertex_buffer = ds_get(get_entity,"vertex buffer")
        if not is_zero(get_vertex_buffer)
        vertex_delete_buffer(get_vertex_buffer)
        
        ds_set(get_entity,"vertex buffer",false)
        
        get_grid[# get_grid_x,get_grid_y] = get_value
        
        console_add("grid edited")
        
        packet_write(packet.grid_set,get_uuid,get_grid_x,get_grid_y,get_value)
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
