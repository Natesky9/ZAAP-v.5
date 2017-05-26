///packet_entity_command(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        console_add("Changing pilot")
        buffer_write(bout,buffer_u8,packet.entity_command)
        
        var get_pilot = get_packet_array[data.arg_0]
        var get_uuid = get_packet_array[data.arg_1]
        
        var get_entity = entity_from_uuid(get_uuid)
        var get_pilot_map = map_from_socket(get_pilot)
        ds_set(get_entity,"pilot",get_pilot)
        ds_map_replace(get_pilot,"ship",get_uuid)
        
        
        var pilot_buffer_type = key_to_buffer_type("pilot")
        var uuid_buffer_type = key_to_buffer_type("uuid")
        
        console_add("client commanding a ship")
        
        buffer_write(bout,pilot_buffer_type,get_pilot)
        buffer_write(bout,uuid_buffer_type,get_uuid)
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_pilot = buffer_read(bin,buffer_s8)
        console_add("pilot is [" + string(get_pilot) + "]")
        var get_uuid = buffer_read(bin,buffer_u32)
        console_add("uuid is [" + string(get_uuid) + "]")
        
        var current_map = map_from_socket(SSS)
        var current_ship = ds_get(current_map,"ship")
        
        var get_entity = entity_from_uuid(get_uuid)
        show("entity is [" + string(get_entity) + "]")
        
        if is_zero(get_pilot)
            {
            if get_uuid == current_ship
                {
                //my ship lost control
                //reset view for now
                current_map[? "ship"] = 0
                view_reset()
                }
            }
        
        if not is_zero(get_pilot)
            {
            //update the pilot's ship
            var get_map = map_from_socket(get_pilot)
            ds_map_replace(get_map,"ship",get_uuid)
            }
        
        get_entity[? "pilot"] = get_pilot
        
        if get_pilot == SSS
            {
            //if this is you, do something?
            }

        break
        }
    //----------------//
    case "client write":
        {
        exit
        //unused
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
        
        var get_current_pilot = ds_get(get_entity,"pilot")
        if not is_zero(get_current_pilot)
            {
            //this ship is already piloted
            exit
            }
        
        var get_socket = ds_map_find_value(async_load,"id")
        var get_map = map_from_socket(get_socket)
        
        ds_set(get_map,"ship",get_uuid)
        
        var previous_ship = get_map[? "ship"]
        if not is_zero(previous_ship)
            {
            //replace the previously controlled ship's pilot with nothing
            //packet_entity_command
            packet_write(packet.entity_command,0,previous_ship)
            var get_ship = entity_from_uuid(previous_ship)
            ds_map_replace(get_ship,"pilot",0)
            }
        //packet_entity_command
        packet_write(packet.entity_command,get_socket,get_uuid)
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
