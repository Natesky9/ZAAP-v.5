///packet_entity_create(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //
    case "server write":
        {
        write_type(packet.entity_create)
        
        var get_uuid = get_packet_array[data.arg_0]
        write_uuid_to_buffer(get_uuid)
        
        packet_send_all()
        console_add("created an entity")
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
        write_type(packet.entity_create)
        //client entity request
        var get_x = get_packet_array[data.arg_0]
        var get_y = get_packet_array[data.arg_1]
        
        write(get_x)
        write(get_y)
        
        packet_send_host()
        return true
        }
    //
    case "server read":
        {
        //Event for client requesting an entity
        
        var get_socket = ds_map_find_value(async_load,"id")
        
        var get_x = read()
        var get_y = read()
        
        //create a player ship at the requested location
        
        server_create_entity_player_ship(get_socket,get_x,get_y)
        
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
