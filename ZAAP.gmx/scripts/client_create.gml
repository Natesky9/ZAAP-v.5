//create a client socket and returns the result
//less than 0 means failed to connect

var network_result = network_create_socket(network_socket_tcp)
if network_result >= 0
show_debug_message("Client successfully created")
if network_result < 0
show_debug_message("Client failed to create")

game_client = network_result

return network_result
