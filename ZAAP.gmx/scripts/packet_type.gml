var get_function = argument0
var get_packet_array = argument1
switch get_function
    {
    case "read":
        {
        bin = ds_map_find_value(async_load,"buffer")
        var get_packet = buffer_read(bin,buffer_u8)
        break
        }
    case "write":
        {
        show(string(get_packet_array))
        var get_packet = get_packet_array[1]
        break
        }
    default:
        {
        console_add("Error, no packet type defined!")
        return -1
        }
    }
    
return get_packet
