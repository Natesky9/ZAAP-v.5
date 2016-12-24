var bytes = 0
for (var i = 0;i < ds_list_size(socket_list);i += 1)
    {
    var get_socket = ds_list_find_value(socket_list,i);
    bytes += network_send_packet(get_socket,bout,buffer_tell(bout))
    }

show(string(bytes) + " bytes sent")
