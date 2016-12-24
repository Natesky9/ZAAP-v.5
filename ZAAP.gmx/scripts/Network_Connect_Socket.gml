//add the new socket to the server

var network_socket = ds_map_find_value(async_load,"socket")
ds_list_add(socket_list,network_socket)
show("Socket list is this long: " + string(ds_list_size(socket_list)))
console_add("Client " + string(network_socket) + " connected")

packet_write(packet.update_sockets,network_socket)


