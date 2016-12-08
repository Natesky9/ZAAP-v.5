//create a server and return the result
//less than 0 means socket failed

var network_result = network_create_server(network_socket_tcp,5678,10)
if network_result >= 0
show_debug_message("Server succesfully bound to port");
if network_result < 0
show_debug_message("Server failed to bind to port");

game_server = network_result

return network_result
