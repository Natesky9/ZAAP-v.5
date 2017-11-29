///client_create()

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
    //initialize client variables
    set("client",network_result)
    set("SSS",-1)
    Ship = 0
    
    network_instance_create()
    
    var autopilot_controller_list = ds_create(ds_type_list)
    set("autopilot controller list",autopilot_controller_list)
    
    return true
    }


