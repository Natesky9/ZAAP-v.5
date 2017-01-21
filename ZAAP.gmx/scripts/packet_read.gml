//reads a packet

//reset the packet array
get_packet_array = 0

//get the mode from the current socket type
get_mode = packet_mode("read");
//write this as value mode
get_packet_array[data.mode] = get_mode

//add packet size and a packet to the client's data
var get_socket = ds_map_find_value(async_load,"id")
var get_size = ds_map_find_value(async_load,"size")
var get_map = ds_map_find_value(socket_map,get_socket)
if get_map != undefined
    {
    var packets_in = ds_map_find_value(get_map,"packets in");
    ds_map_replace(get_map,"packets in",packets_in++);
    var packet_bytes_in = ds_map_find_value(get_map,"packet bytes in");
    ds_map_replace(get_map,"packet bytes in",packet_bytes_in + get_size)
    //reset the ping timeout
    get_map[? "ping timeout"] = ping_timeout
    }

//send this to the main network script
Network_Data(get_packet_array)



//code by Natesky9
//"It's high noon"
