///packet_remove_socket(packet_array)
//###//
//see packet_add_socket
var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.remove_socket)
        var get_socket = get_packet_array[data.arg_0]
        
        write(get_socket)
        
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_socket = read()
        var pos = ds_list_find_index(socket_list,get_socket)
        
        if !is_undefined(pos)
            {
            ds_list_delete(socket_list,pos)
            var get_map = map_from_socket(get_socket)
            if get_map != 0
                {
                //delete the map client side
                ds_destroy(ds_type_map,get_map)
                }
            }
        
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.remove_socket)
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        var get_socket = async_load[? "id"]
        console_add("Client leaving")
        break
        }
    //----------------//
    default:
        {
        show("Error, no mode defined!")
        show("in packet_template")
        break
        }
    //----------------//
    }
