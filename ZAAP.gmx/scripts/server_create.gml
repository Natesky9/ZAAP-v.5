//create a server and return the result
//less than 0 means socket failed
if am_server()
or am_client()
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
    show("creating server data")
    socket_list = ds_create(ds_type_list)
    socket_map = ds_create(ds_type_map)
    entity_list = ds_create(ds_type_list)
    show("done creating server data")
    //entity_map = ds_map_create()
    //server does not need to
    //map entity to server entity
    
    game_server = network_result
    return true
    }
