///packet_entity_create(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.entity_create)
        
        var get_uuid = get_packet_array[data.arg_0]
        uuid_write_to_buffer(get_uuid)
        
        packet_send_all()
        exit
        }
    //
    case "client read":
        {
        read_buffer_to_uuid()
        return true
        }
    //
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.entity_create)
        //placeholder
        var get_x = get_packet_array[data.arg_0]
        var get_y = get_packet_array[data.arg_1]
        
        var coordinate_buffer_type = key_to_buffer_type("x")
        
        buffer_write(bout,coordinate_buffer_type,get_x)
        buffer_write(bout,coordinate_buffer_type,get_y)
        
        packet_send_host()
        return true
        }
    //
    case "server read":
        {
        var get_socket = ds_map_find_value(async_load,"id")
        var coordinate_buffer_type = key_to_buffer_type("x")
        
        var get_x = buffer_read(bin,coordinate_buffer_type)
        var get_y = buffer_read(bin,coordinate_buffer_type)
        
        var get_uuid = entity_create_advanced(get_x,get_y,entity.ship)
        //set the grid
        var basic_grid = ds_create(ds_type_grid,9,9);
        basic_grid[# 4,4] = true
        basic_grid[# 4,3] = 2
        basic_grid[# 3,4] = 3
        basic_grid[# 5,4] = 3
        var get_entity = entity_from_uuid(get_uuid)
        ds_set(get_entity,"grid",basic_grid)
        //end setting the grid
        
        var get_socket_map = map_from_socket(get_socket)
        ds_set(get_socket_map,"ship",get_uuid)
        
        packet_write(packet.entity_create,get_uuid)
        
        packet_write(packet.entity_command,get_socket,get_uuid)
        
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
