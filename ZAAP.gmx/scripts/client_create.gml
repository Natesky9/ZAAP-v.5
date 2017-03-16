//create a client socket and returns the result

if am_server()
or am_client()
    {
    //socket is already created, exit
    console_add("Game already has a socket!")
    return false
    }

var network_result = network_create_socket(network_socket_tcp)
if network_result < 0
    {
    //error in creating socket
    console_add("Client failed to create")
    return false
    }
show("Network result: " + string(network_result))
if network_result >= 0
    {
    //socket created successfully
    console_add("Client successfully created")
    game_client = network_result
    //initialize client variables
    SSS = -1
    Ship = 0
    
    socket_list = ds_create(ds_type_list)
    socket_map = ds_create(ds_type_map)
    
    entity_list = ds_create(ds_type_list)
    entity_map = ds_create(ds_type_map)
    
    autopilot_controller_list = ds_create(ds_type_list)
    
    return true
    }


