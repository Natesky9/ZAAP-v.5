//reads a packet

//reset the packet array
get_packet_array = 0

//get the mode from the current socket type
get_mode = packet_mode("read");
//write this as value mode
get_packet_array[data.mode] = get_mode

//send this to the main network script
Network_Data(get_packet_array)
