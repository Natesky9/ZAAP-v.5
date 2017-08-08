///packet_template(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        var get_uuid = get_packet_array[data.arg_0]
        
        var socket_list_size = ds_list_size(socket_list)
        for (var i = 0;i < socket_list_size;i += 1)
            {
            var get_socket = ds_list_find_value(socket_list,i)
            var get_ship = get_ship_from_socket(get_socket)
            show("ship: " + string(get_ship))
            if is_zero(get_ship)
            continue
            var get_socket_ship_uuid = uuid_from_entity(get_ship)
            
            
            if get_socket_ship_uuid == get_uuid
                {
                show("yes")
                buffer_write(bout,buffer_u8,packet.inventory)
                packet_send(get_socket)
                break
                }
            }
        break
        }
    //----------------//
    case "client read":
        {
        audio_play_sound(clunk,1,false)
        break
        }
    //----------------//
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.null)
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