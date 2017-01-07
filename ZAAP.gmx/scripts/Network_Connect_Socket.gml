//add the new socket to the server

var get_socket = ds_map_find_value(async_load,"socket")
//add to socket list

ds_list_add(socket_list,get_socket)
//create/load a map and store it
var get_socket_map = ds_create(ds_type_map)
//add data
ds_map_add(get_socket_map,"ping",9999)

ds_map_add(socket_map,get_socket,get_socket_map)

console_add("Client " + string(get_socket) + " connected")
console_add("Client has map of: " + string(get_socket_map))


packet_write(packet.update_sockets,get_socket)
packet_write(packet.add_socket,get_socket)
packet_write(packet.inform_sss,get_socket)
packet_write(packet.update_entities,get_socket)
