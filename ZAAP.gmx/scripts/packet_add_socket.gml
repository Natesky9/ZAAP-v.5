var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        var get_socket = get_packet_array[data.arg_0]
        buffer_write(bout,buffer_u8,packet.add_socket)
        buffer_write(bout,buffer_u8,get_socket)
        
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_socket = buffer_read(bin,buffer_u8)
        
        ds_list_add(socket_list,get_socket)
        var get_socket_map = ds_create(ds_type_map)
        ds_map_add(socket_map,get_socket,get_socket_map)
        
        console_add("Player [" + string(get_socket) + "] connected!")
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
