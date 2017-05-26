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
        buffer_write(bout,buffer_u8,packet.update_entities)
        
        var get_socket = get_packet_array[data.arg_0]
        
        //###//
        //reformat this to use the new entity list
        //also make script to count total entities in all lists?
        var entity_list_size = ds_list_size(entity_list)
        buffer_write(bout,buffer_u32,entity_list_size)
        show("entity list size is [" + string(entity_list_size) + "]")
        
        for (var i = 0;i < entity_list_size;i += 1)
            {
            //loop
            var get_uuid = ds_list_find_value(entity_list,i)
            
            uuid_write_to_buffer(get_uuid)
            //end loop
            }
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
            read_buffer_to_uuid()
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
