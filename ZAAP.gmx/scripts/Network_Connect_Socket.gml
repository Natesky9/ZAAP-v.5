//add the new socket to the server

var network_socket = ds_map_find_value(async_load,"socket")
ds_list_add(socket_list,network_socket)
console_add("Client " + string(network_socket) + " connected")

packet_write(packet.update_sockets,network_socket)


