console_add("Received network data")

//retrieve the info
var get_network_id = ds_map_find_value(async_load,"id")
var get_network_type = ds_map_find_value(async_load,"type")
var get_network_ip = ds_map_find_value(async_load,"ip")



switch get_network_type
    {
    //----------------//
    case network_type_connect:
        {
        Network_Connect_Socket(get_network_id,get_network_type,get_network_ip)
        break
        }
    //----------------//
    case network_type_disconnect:
        {
        Network_Disconnect(get_network_id,get_network_type,get_network_ip)
        break
        }
    //----------------//
    case network_type_data:
        {
        Network_Data("read",0)
        break
        }
    //----------------//
    }
