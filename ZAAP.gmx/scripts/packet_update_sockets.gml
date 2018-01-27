///packet_update_sockets(packet_array)
//###
//see packet_add_socket

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.update_sockets)
        var get_update_socket = get_packet_array[data.arg_0]
        //update all the clients on the sockets
        var get_list_size = ds_list_size(socket_list)
        
        write(get_list_size-1)
        
        for (var i = 0;i < get_list_size;i += 1)
            {
            var get_socket = ds_list_find_value(socket_list,i)
            show("list socket is: " + string(get_socket))
            
            if get_socket != get_update_socket
                {
                write_socket_to_buffer(get_socket)
                }
            else
                {
                show("this is the update socket!")
                }
            }
        
        packet_send(get_update_socket)
        break
        }
    //----------------//
    case "client read":
        {
        
        var get_socket_list_size = read()
        show("socket list has: " + string(get_socket_list_size))
        repeat get_socket_list_size
            {
            read_buffer_to_socket()
            }
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.null)
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
