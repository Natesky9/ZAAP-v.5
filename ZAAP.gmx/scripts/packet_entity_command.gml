///packet_entity_command(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.entity_command)
        console_add("Changing pilot")
        
        var get_pilot = get_packet_array[data.arg_0]
        var get_uuid = get_packet_array[data.arg_1]
        
        var get_entity = entity_from_uuid(get_uuid)
        var get_pilot_map = map_from_socket(get_pilot)
        ds_set(get_entity,"pilot",get_pilot,key.value)
        ds_set(get_pilot,"ship",get_uuid,key.value)
        
        console_add("client commanding a ship")
        
        write(get_pilot)
        write(get_uuid)
        
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_pilot = read()
        show("pilot is [" + string(get_pilot) + "]")
        var get_uuid = read()
        show("uuid is [" + string(get_uuid) + "]")
        
        var get_entity = entity_from_uuid(get_uuid)
        show("entity is [" + string(get_entity) + "]")
        
        //###//
        //migrate this into the envar?
        var current_ship = my_ship()
        //
        //do this regardless
        ds_set(get_entity,"pilot",get_pilot,key.value)
        
        if is_zero(get_pilot)
            {
            //do this if the pilot is being reset
            if get_uuid == current_ship
                {
                //my ship lost control
                //reset view for now
                ds_set(envar,"ship",false,key.value)
                view_reset()
                }
            //
            break
            }
        
        if not is_zero(get_pilot)
            {
            //do this if the pilot is being set
            var get_map = map_from_socket(get_pilot)
            ds_set(get_map,"ship",get_uuid,key.value)
            if get_pilot == my_socket()
            ds_set(envar,"ship",get_uuid,key.value)
            //
            break
            }
        //unnecesary break
        break
        }
    //----------------//
    case "client write":
        {
        exit
        //unused
        write_type(packet.entity_command)
        
        var get_uuid = get_packet_array[data.arg_0]
        
        write(get_uuid)
        packet_send_host()
        
        break
        }
    //----------------//
    case "server read":
        {
        var get_uuid = read()
        var get_entity = entity_from_uuid(get_uuid)
        
        var get_current_pilot = ds_get(get_entity,"pilot")
        if not is_zero(get_current_pilot)
            {
            //this ship is already piloted
            exit
            }
        
        var get_socket = ds_get(async_load,"id")
        var get_map = map_from_socket(get_socket)
        
        ds_set(get_map,"ship",get_uuid,key.value)
        
        var previous_ship = get_map[? "ship"]
        if not is_zero(previous_ship)
            {
            //replace the previously controlled ship's pilot with nothing
            //packet_entity_command
            packet_write(packet.entity_command,0,previous_ship)
            var get_ship = entity_from_uuid(previous_ship)
            ds_set(get_ship,"pilot",0,key.value)
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
