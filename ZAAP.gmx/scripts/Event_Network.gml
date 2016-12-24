show("Received network data")

//retrieve the info
var get_network_id = ds_map_find_value(async_load,"id")
var get_network_type = ds_map_find_value(async_load,"type")
var get_network_ip = ds_map_find_value(async_load,"ip")
var get_network_port = ds_map_find_value(async_load,"port")



switch get_network_type
    {
    //----------------//
    case network_type_connect:
        {
        console_add("Client attempting to connect")
        show("Client attempting to connect")
        show("[" + string(get_network_ip) + ":" + string(get_network_port) + "]")
        Network_Connect_Socket(get_network_id,get_network_type,get_network_ip)
        break
        }
    //----------------//
    case network_type_disconnect:
        {
        console_add("Client disconnected")
        console_add("[" + string(get_network_ip) + ":" + string(get_network_port) + "]")
        var get_network_socket = ds_map_find_value(async_load,"socket")
        var get_network_succeeded = ds_map_find_value(async_load,"succeeded")
        //remember to update script name as well
        Network_Disconnect_Socket(get_network_id,get_network_type,get_network_ip)
        break
        }
    //----------------//
    case network_type_data:
        {
        var get_network_size = ds_map_find_value(async_load,"size")
        show("Recieved packet, [" + string(get_network_size) + "] bytes")
        //remember to update packet_read to accept these values
        packet_read(get_network_id,get_network_type,get_network_ip)
        break
        }
    //----------------//
    }
show("End Network")
