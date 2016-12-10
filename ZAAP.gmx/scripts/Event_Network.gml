dialog_add("Received network data")

var network_id = ds_map_find_value(async_load,"id")
var network_type = ds_map_find_value(async_load,"type")
var network_ip = ds_map_find_value(async_load,"ip")

if network_id == game_server
    {
    switch network_type
        {
        case network_type_connect:
            {
            Event_Network_Connect()
            break
            }
        case network_type_disconnect:
            {
            Event_Network_Disconnect()
            break
            }
        case network_type_data:
            {
            Event_Network_Data()
            break
            }
        }
    }
