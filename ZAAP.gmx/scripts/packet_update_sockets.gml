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
        var socket_count = ds_size(sockets)
        
        write(socket_count-1)
        
        for (var i = 0;i < socket_count;i += 1)
            {
            var get_socket = ds_index(sockets,i)
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
        
        var socket_count = read()
        show("socket list has: " + string(socket_count))
        repeat socket_count
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
