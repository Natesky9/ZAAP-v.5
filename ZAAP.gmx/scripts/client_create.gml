//create a client socket and returns the result
//less than 0 means failed to connect

if game_client >= 0
    {
    dialog_add("Game already has a socket!")
    return false
    }

var network_result = network_create_socket(network_socket_tcp)
dialog_add("Network result: " + string(network_result))
if network_result >= 0
    {
    dialog_add("Client successfully created")
    game_client = network_result
    return true
    }
if network_result < 0
    {
    dialog_add("Client failed to create")
    return false
    }

