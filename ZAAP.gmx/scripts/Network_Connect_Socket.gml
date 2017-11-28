///Network_Connect_Socket()

//add the new socket to the server

var get_socket = async_load[? "socket"]
show("///Connected socket is: " + string(get_socket) + "///")
var get_map = create_socket()
show("///get_map is: " + string(get_map) + "///")

//create/load a map and store it
ds_map_add(socket_map,get_socket,get_map)
ds_list_add(socket_list,get_socket)
show("mapped socket[" + string(get_socket) + "] to map[" + string(get_map) + "]")

//add data
socket_add_new_key(get_map,"socket",get_socket)
socket_add_new_key(get_map,"ping",9999)
socket_add_new_key(get_map,"packets in",0)
socket_add_new_key(get_map,"packet bytes in",0)
socket_add_new_key(get_map,"packets out",0)
socket_add_new_key(get_map,"packet bytes out",0)
socket_add_new_key(get_map,"ship",0)
ds_map_add(get_map,"ping timeout",ping_timeout)

console_add("Client " + string(get_socket) + " connected")
console_add("Client has map of: " + string(get_map))

//begin load-in//
//----------------//
//packet_login
packet_write(packet.login,get_socket,data.request)
//packet_add_socket
packet_write(packet.add_socket,get_socket)
//packet_inform_sss
packet_write(packet.inform_sss,get_socket)
//packet_update_sockets
packet_write(packet.update_sockets,get_socket)
//packet_update_entities
packet_write(packet.update_entities,get_socket)
//----------------//
//end load-in//

//code by Natesky9
//"Hi there"
