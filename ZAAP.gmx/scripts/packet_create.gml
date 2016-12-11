//sends a packet

packet_array = 0

for (var i = 0;i < argument_count;i += 1)
    {
    packet_array[i+1] = argument[i]
    }

show("Packet: " + string(packet_array))
Network_Data("write",packet_array)

