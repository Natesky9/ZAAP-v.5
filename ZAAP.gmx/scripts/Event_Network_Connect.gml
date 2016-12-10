var network_socket = ds_map_find_value(async_load,"socket")
ds_list_add(socket_list,network_socket)


dialog_add("Client " + string(network_socket) + " connected")
