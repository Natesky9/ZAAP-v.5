//sends the packet to a specific socket
packets_out++
packet_bytes_out += network_send_packet(argument0,bout,buffer_tell(bout))

//show("Sending packet to [" + string(get_socket) + "]")
