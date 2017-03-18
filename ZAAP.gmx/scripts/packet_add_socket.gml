var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.add_socket)
        var get_socket = get_packet_array[data.arg_0]
        show("adding socket: " + string(get_socket))
        socket_write_to_buffer(get_socket)
        
        packet_send_all()
        console_add("Adding Socket[" + string(get_socket) + "]")
        break
        }
    //----------------//
    case "client read":
        {
        var get_list_size = buffer_read(bin,buffer_u8)
        
        var get_map = create_socket()
        show("adding socket")
        
        repeat get_list_size
            {
            var get_key = buffer_read(bin,buffer_string)
            var get_buffer_type = key_to_buffer_type(get_key)
            var get_value = buffer_read(bin,get_buffer_type)
            socket_add_new_key(get_map,get_key,get_value)
            show("added key: " + get_key)
            show("with value: " + string(get_value))
            }
        var get_socket = get_map[? "socket"]
        show("socket added: " + string(get_socket))
        ds_map_add(socket_map,get_socket,get_map)
        ds_list_add(socket_list,get_socket)
        //old code
        /*
        ds_list_add(socket_list,get_socket)
        var get_socket_map = ds_create(ds_type_map)
        ds_map_add(get_socket_map,"ping timeout",ping_timeout)
        ds_map_add(socket_map,get_socket,get_socket_map)
        */
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
