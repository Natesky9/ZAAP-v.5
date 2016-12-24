var network_socket = ds_map_find_value(async_load,"socket")
var pos = ds_list_find_index(socket_list,network_socket)
ds_list_delete(socket_list,pos)

console_add("Client " + string(network_socket) + " disconnected")
show("Client " + string(network_socket) + " disconnected")
