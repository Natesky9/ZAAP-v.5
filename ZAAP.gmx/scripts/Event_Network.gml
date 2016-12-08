show_debug_message("Received network data")
switch async_load
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
