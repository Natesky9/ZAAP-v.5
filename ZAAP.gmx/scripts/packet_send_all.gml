///packet_send_all()

var bytes = 0
for (var i = 0;i < ds_list_size(socket_list);i += 1)
    {
    var get_socket = ds_list_find_value(socket_list,i);
    bytes += packet_send(get_socket)
    }
