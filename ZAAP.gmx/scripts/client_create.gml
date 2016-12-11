//create a client socket and returns the result
//less than 0 means failed to connect

if game_client >= 0
or game_server >= 0
    {
    console_add("Game already has a socket!")
    return false
    }

var network_result = network_create_socket(network_socket_tcp)
if network_result < 0
    {
    console_add("Client failed to create")
    return false
    }
console_add("Network result: " + string(network_result))
if network_result >= 0
    {
    console_add("Client successfully created")
    game_client = network_result
    return true
    }


