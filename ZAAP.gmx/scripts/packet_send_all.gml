///packet_send_all()

var bytes = 0
var socket_count = ds_size(sockets)
for (var i = 0;i < socket_count;i += 1)
    {
    var get_socket = ds_index(sockets,i);
    bytes += packet_send(get_socket)
    }
return bytes
