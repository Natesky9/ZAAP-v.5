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
        var get_uuid = buffer_read(bin,buffer_u32)
        
        var get_entity = entity_from_uuid(get_uuid)
        
        if get_socket == -1
            {
            ds_map_replace(get_entity,"pilot",undefined)
            exit
            }
        
        var get_map = ds_map_find_value(socket_map,get_socket)
        
        ds_map_replace(get_map,"ship",get_uuid)
        ds_map_replace(get_entity,"pilot",get_socket)
        
        if get_socket == SSS
        Ship = get_entity
        if Ship == undefined
            {
            console_add("Ship was undefined")
            }
        console_add("Taken control of entity[" + string(Ship) + "]")
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
        var get_map = ds_map_find_value(socket_map,get_socket)
        
        var previous_ship = ds_map_find_value(get_map,"ship")
        if previous_ship != undefined
            {
            packet_write(packet.entity_command,-1,previous_ship)
            ds_map_replace(previous_ship,"pilot",undefined)
            }
        
        packet_write(packet.entity_command,get_socket,get_uuid)
        
        ds_map_replace(get_entity,"pilot",get_socket)
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
