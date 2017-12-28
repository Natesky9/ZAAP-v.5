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
            console_add("error #packet_grid_set No UUID")
            exit
            }
        
        var get_grid = grid_from_entity(get_entity)
        if is_zero(get_grid)
            {
            console_add("error #packet_grid_set No entity")
            exit
            }
        
        write(get_uuid)
        write(get_grid_x)
        write(get_grid_y)
        write(get_value)
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_uuid = read()
        var get_grid_x = read()
        var get_grid_y = read()
        var get_value = read()
        
        
        
        var get_entity = entity_from_uuid(get_uuid)
        if is_zero(get_entity)
            {
            console_add("error #packet_grid_set No Entity")
            exit
            }
        
        var get_grid = grid_from_entity(get_entity)
        if is_zero(get_grid)
            {
            console_add("error #packet_grid_set No UUID")
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
        
        write(get_uuid)
        write(get_grid_x)
        write(get_grid_y)
        write(get_value)
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        var get_uuid = read()
        var get_grid_x = read()
        var get_grid_y = read()
        var get_value = read()
        
        var get_entity = entity_from_uuid(get_uuid)
        var get_grid = grid_from_entity(get_entity)
        
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
