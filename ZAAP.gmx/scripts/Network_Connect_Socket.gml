//add the new socket to the server

var get_socket = async_load[? "socket"]
//add to socket list

ds_list_add(socket_list,get_socket)
//create/load a map and store it
var get_socket_map = ds_create(ds_type_map)
ds_map_add(socket_map,get_socket,get_socket_map)
//add data
get_socket_map[? "ping"] = 9999
get_socket_map[? "packets in"] = 0
get_socket_map[? "packet bytes in"] = 0
get_socket_map[? "packets out"] = 0
get_socket_map[? "packet bytes out"] = 0
get_socket_map[? "ping timeout"] = ping_timeout

console_add("Client " + string(get_socket) + " connected")
console_add("Client has map of: " + string(get_socket_map))


packet_write(packet.update_sockets,get_socket)
packet_write(packet.add_socket,get_socket)
packet_write(packet.inform_sss,get_socket)
packet_write(packet.update_entities,get_socket)

//code by Natesky9
//"Molten core!"
