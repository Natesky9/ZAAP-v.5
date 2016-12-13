//sends a packet

//reset the packet array
get_packet_array = 0
//get the mode from the current socket type
get_mode = packet_mode("write");
//write this as value 0
get_packet_array[0] = get_mode

//fill in the remaining packet arguments
//starting with the packet type
for (var i = 0;i < argument_count;i += 1)
    {
    get_packet_array[i+1] = argument[i]
    }
//send this to the main network script
Network_Data(get_packet_array)

