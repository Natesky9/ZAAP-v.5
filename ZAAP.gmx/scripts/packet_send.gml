///packet_send(socket)

var get_socket = argument0;
//sends the packet to a specific socket
packets_out++
packet_bytes_out += network_send_packet(get_socket,bout,buffer_tell(bout))

//show("Sending packet to [" + string(get_socket) + "]")
