///packet_template(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.entity_set_grid)
        var get_uuid = get_packet_array[data.arg_0]
        var get_grid = get_packet_array[data.arg_1]
        
        write(get_uuid)
        write_grid_to_buffer(get_grid)
        
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_uuid = read()
        var get_entity = entity_from_uuid(get_uuid)
        var get_grid = ds_get(get_entity,"grid")
        if is_zero(get_entity)
            {
            show("entity was null! #packet_entity_set_grid")
            exit
            }
        
        if is_zero(get_grid)
            {
            var get_grid = ds_create(ds_type_grid,1,1)
            ds_set(get_entity,"grid",get_grid)
            }
        read_buffer_to_grid(get_grid)
        var success = entity_create_hex_vertex_buffer(get_entity)
        if not success
            {
            console_add("avoided crash #packet_entity_set_grid")
            entity_destroy_basic(get_uuid)
            }
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.null)
        break
        }
    //----------------//
    case "server read":
        {
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
