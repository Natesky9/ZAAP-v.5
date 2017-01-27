var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.fire_weapon)
        break
        }
    //----------------//
    case "client read":
        {
        break
        }
    //----------------//
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.fire_weapon)
        //add in other arguments
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        var get_socket = async_load[? "id"]
        var get_ship = get_ship_from_socket(get_socket)
        if is_zero(get_ship)
            {
            console_add("player tried to issue a command without a ship!")
            exit
            }
        
        var get_x = ds_get(get_ship,"x")
        var get_y = ds_get(get_ship,"y")
        var get_direction = ds_get(get_ship,"direction")
        var get_speed = ds_get(get_ship,"speed")
        //create the bullet
        var get_uuid = create_new_entity(get_x,get_y)
        var get_entity = entity_from_uuid(get_uuid);
        get_entity[? "speed"] = get_speed + 10
        get_entity[? "thrust"] = true
        get_entity[? "direction"] = get_direction
        packet_write(packet.entity_create,get_uuid)
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
