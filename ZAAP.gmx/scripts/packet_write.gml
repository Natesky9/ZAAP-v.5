///packet_write(packet.id,arg0,arg1,...)
//sends a packet

//reset the packet array
get_packet_array = 0
//get the mode from the current socket type
get_mode = packet_mode("write");
//write this as value mode
get_packet_array[data.mode] = get_mode


//fill in the remaining packet arguments
//starting with the packet type
for (var i = 0;i < argument_count;i += 1)
    {
    get_packet_array[i+data.type] = argument[i]
    }
//send this to the main network script
Network_Data(get_packet_array)

//code by Natesky9
//"Justice rains from above!"
