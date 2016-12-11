//create a server and return the result
//less than 0 means socket failed
if game_server >= 0
or game_client >= 0
    {
    console_add("Game already has a socket")
    return false
    }

var network_result = network_create_server(network_socket_tcp,5678,10)

if network_result < 0
    {
    console_add("Server failed to bind");
    return false
    }

if network_result >= 0
    {
    console_add("Server succesfully bound")
    socket_list = ds_list_create()
    game_server = network_result
    return true
    }
