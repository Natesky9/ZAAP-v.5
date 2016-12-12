//sends a packet

packet_array = 0

for (var i = 0;i < argument_count;i += 1)
    {
    packet_array[i+1] = argument[i]
    }

get_mode = packet_mode("write");
get_packet_array[0] = get_mode
    
show("Packet: " + string(packet_array))
Network_Data(packet_array)

