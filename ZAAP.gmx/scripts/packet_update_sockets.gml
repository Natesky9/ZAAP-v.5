///packet_update_sockets(packet_array)
//###
//see packet_add_socket

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.update_sockets)
        var get_update_socket = get_packet_array[data.arg_0]
        //update all the clients on the sockets
        var get_list_size = ds_list_size(socket_list)
        
        buffer_write(bout,buffer_u8,get_list_size-1)
        
        for (var i = 0;i < get_list_size;i += 1)
            {
            var get_socket = ds_list_find_value(socket_list,i)
            show("list socket is: " + string(get_socket))
            
            if get_socket != get_update_socket
                {
                socket_write_to_buffer(get_socket)
                }
            }
        
        packet_send(get_update_socket)
        break
        }
    //----------------//
    case "client read":
        {
        
        var get_socket_list_size = buffer_read(bin,buffer_u8)
        show("socket list is: " + string(get_socket_list_size))
        repeat get_socket_list_size
            {
            
            var get_key_list_size = buffer_read(bin,buffer_u8)
            show("key list is: " + string(get_key_list_size))
            var get_map = create_socket()
            
            repeat get_key_list_size
                {
                var get_key = buffer_read(bin,buffer_string)
                show("key is [" + get_key + "]")
                var get_buffer_type = key_to_buffer_type(get_key)
                var get_value = buffer_read(bin,get_buffer_type)
                show("value is [" + string(get_value) + "]")
                socket_add_new_key(get_map,get_key,get_value)
                }
            var get_socket = get_map[? "socket"]
            ds_map_add(socket_map,get_socket,get_map)
            show("mapped socket[" + string(get_socket) + "] to map[" + string(get_map) + "]")
            ds_list_add(socket_list,get_socket)
            }
        break
        }
    //----------------//
    case "client write":
        {
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
        console_add("Error, no packet defined");break
        }
    //----------------//
    }
