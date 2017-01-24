var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.entity_command)
        
        var get_socket = get_packet_array[data.arg_0]
        var get_uuid = get_packet_array[data.arg_1]
        

        
        buffer_write(bout,buffer_s8,get_socket)
        buffer_write(bout,buffer_u32,get_uuid)
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_socket = buffer_read(bin,buffer_s8)
        show("socket is [" + string(get_socket) + "]")
        var get_uuid = buffer_read(bin,buffer_u32)
        show("uuid is [" + string(get_uuid) + "]")
        
        var get_entity = entity_from_uuid(get_uuid)
        show("entity is [" + string(get_entity) + "]")
        
        if get_entity == 0
            {
            //if the entity doesn't exist, skip?
            exit
            }
        
        if get_socket == -1
            {
            ds_map_replace(get_entity,"pilot",0)
            exit
            }
        
        if get_socket != 0
            {
            var get_map = map_from_socket(get_socket)
            ds_map_replace(get_map,"ship",get_uuid)
            }
        
        get_entity[? "pilot"] = get_socket
        
        if get_socket == SSS
            {
            console_add("This is me")
            }

        break
        }
    //----------------//
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.entity_command)
        
        var get_uuid = get_packet_array[data.arg_0]
        
        buffer_write(bout,buffer_u32,get_uuid)
        packet_send_host()
        
        break
        }
    //----------------//
    case "server read":
        {
        var get_uuid = buffer_read(bin,buffer_u32)
        var get_entity = entity_from_uuid(get_uuid)
        
        var get_socket = ds_map_find_value(async_load,"id")
        var get_map = map_from_socket(get_socket)
        
        var previous_ship = get_map[? "ship"]
        if previous_ship != 0
            {
            //replace the previously controlled ship's pilot with nothing
            packet_write(packet.entity_command,0,previous_ship)
            var get_ship = entity_from_uuid(previous_ship)
            ds_map_replace(get_ship,"pilot",0)
            }
        
        packet_write(packet.entity_command,get_socket,get_uuid)
        
        get_entity[? "pilot"] = get_socket
        ds_map_replace(get_map,"ship",get_uuid)
        
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
