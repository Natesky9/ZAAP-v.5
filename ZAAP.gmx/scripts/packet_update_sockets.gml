//client read
        var sockets = buffer_read(bin,buffer_u8)
        
        ds_list_clear(socket_list)
        
        for (var i = 0;i < sockets;i += 1)
            {
            var get_socket = buffer_read(bin,buffer_u8)
            ds_list_add(socket_list,get_socket)
            }
