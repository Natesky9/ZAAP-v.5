///packet_read()
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
var get_map = map_from_socket(get_socket)


if am_client()
    {
    packets_in++
    packet_bytes_in += get_size
    //reset the ping timeout
    //change this to use variables instead
    //of piggybacking off of the entity map
    if not is_zero(get_map)
    set("ping timeout",0)
    }

if am_server()
    {
    packets_in++
    packet_bytes_in += get_size
    if not is_zero(get_map)
        {
        get_map[? "packets in"]++
        get_map[? "packet bytes in"] += get_size
        //reset the ping timeout
        get_map[? "ping timeout"] = 0
        }
    if is_zero(get_map)
        {
        console_add("Error, map does not exist! @packet_read")
        }
    }

//send this to the main network script
Network_Data(get_packet_array)

//code by Natesky9
//"It's high noon"
