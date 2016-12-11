//add the new socket to the server

var network_socket = ds_map_find_value(async_load,"socket")
ds_list_add(socket_list,network_socket)
console_add("Client " + string(network_socket) + " connected")

//update all the clients on the sockets
var sockets = ds_list_size(socket_list)

//socket update packet
buffer_seek(bout,buffer_seek_start,0)
buffer_write(bout,buffer_u8,packet.update_sockets)
buffer_write(bout,buffer_u8,sockets)
for (var i = 0;i < sockets;i += 1)
    {
    var get_socket = ds_list_find_value(socket_list,i)
    buffer_write(bout,buffer_u8,get_socket)
    }

for (var i = 0;i < sockets;i += 1)
    {
    var get_socket = ds_list_find_value(socket_list,i)
    var data_sent = network_send_packet(get_socket,bout,buffer_tell(bout))
    if !data_sent
    console_add("Packet failed to send")
    if data_sent
    console_add("Packet of size")
    console_add("[" + string(data_sent) + "] sent")
    }

