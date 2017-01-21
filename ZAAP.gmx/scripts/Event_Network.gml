show("Received network data")

//retrieve the info
var get_network_id = async_load[? "id"]
var get_network_type = async_load[? "type"]
var get_network_ip = async_load[? "ip"]
var get_network_port = async_load[? "port"]



switch get_network_type
    {
    //----------------//
    case network_type_connect:
        {
        console_add("Client attempting to connect")
        show("Client attempting to connect")
        show("[" + string(get_network_ip) + ":" + string(get_network_port) + "]")
        Network_Connect_Socket()
        break
        }
    //----------------//
    case network_type_disconnect:
        {
        console_add("Client disconnected")
        console_add("[" + string(get_network_ip) + ":" + string(get_network_port) + "]")
        //remember to update script name as well
        Network_Disconnect_Socket()
        break
        }
    //----------------//
    case network_type_data:
        {
        var get_network_size = async_load[? "size"]
        show("Recieved packet, [" + string(get_network_size) + "] bytes")
        packet_read()
        break
        }
    //----------------//
    }
show("End Network")

//code by Natesky9
//"No one can hide from my sight"
