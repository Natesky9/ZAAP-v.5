var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        var get_socket = get_packet_array[data.arg_0]
        
        buffer_write(bout,buffer_u8,packet.remove_socket)
        buffer_write(bout,buffer_u8,get_socket)
        
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_socket = buffer_read(bin,buffer_u8)
        var pos = ds_list_find_index(socket_list,get_socket)
        
        if !is_undefined(pos)
            {
            ds_list_delete(socket_list,pos)
            var get_map = ds_map_find_value(socket_map,get_socket)
            if !is_undefined(get_map)
                {
                //delete the map client side
                ds_map_destroy(get_map)
                }
            }
        
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
