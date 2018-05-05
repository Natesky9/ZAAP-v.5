///server_create()

//create a server and return the result
//less than 0 means socket failed
if am_server()
or am_client()
    {
    console_add("Game already has a socket")
    return false
    }

var network_result = network_create_server(network_socket_tcp,5678,10)+1
//set the server to the network result
set("server",network_result)

if not network_result
    {
    console_add("Server failed to bind");
    return false
    }

if network_result
    {
    console_add("Server succesfully bound")
    show("creating server data")
    
    //create the network
    network_instance_create()
    //done create the network
    
    show("done creating server data")
    http_request_ip = http_get("http://ipv4bot.whatismyipaddress.com/")
    
    keyboard_string = ""
    keyboard_focus = "game"
    return true
    }
