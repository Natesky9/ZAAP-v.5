var get_packet_array = argument0

switch get_packet_array[0]
    {
    case "server write":
        {
        
        }
    case "client read":
        {
        var sockets = buffer_read(bin,buffer_u8)
        
        ds_list_clear(socket_list)
        
        for (var i = 0;i < sockets;i += 1)
            {
            var get_socket = buffer_read(bin,buffer_u8)
            ds_list_add(socket_list,get_socket)
            }
        break
        }
    case "client write":
        {
        break
        }
    case "server read":
        {
        break
        }
    }
