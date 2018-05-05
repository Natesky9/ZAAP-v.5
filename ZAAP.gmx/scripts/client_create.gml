///client_create()

//create a client socket and returns the result

if am_server()
or am_client()
    {
    //socket is already created, exit
    console_add("Game already has a socket!")
    return false
    }

var network_result = network_create_socket(network_socket_tcp)+1
if not network_result
    {
    //error in creating socket
    console_add("Client failed to create")
    return false
    }
show("Network result: " + string(network_result))
if network_result
    {
    //socket created successfully
    console_add("Client successfully created")
    //initialize client variables
    set("client",network_result)
    set("SSS",0)
    Ship = 0
    
    network_instance_create()
    
    
    return true
    }


