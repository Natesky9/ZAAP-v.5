///packet_update_entities(packet_array)
//###//
//update to use the new entity list format
//instead of the old one

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.update_entities)
        
        var get_socket = get_packet_array[data.arg_0]
        
        var get_map = fetch_entity_map(entity.types)
        var get_list = keys_from_map(get_map)
        var keys = ds_list_size(get_list)
        
        write(keys)
        show("/////")
        show("list id of keys is: " + string(get_list))
        show("entity list size is [" + string(keys) + "]")
        
        for (var i = 0;i < keys;i += 1)
            {
            var get_uuid = ds_list_find_value(get_list,i)
            write_uuid_to_buffer(get_uuid)
            }
        
        packet_send(get_socket)
        return true
        }
    //----------------//
    case "client read":
        {
        var get_entity_list_size = read()
        show("entity list size is [" + string(get_entity_list_size) + "]")
        repeat get_entity_list_size
            {
            console_add("update entity")
            read_buffer_to_uuid()
            }
        }
    //----------------//
    case "client write":
        {
        write_type(packet.null)
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
