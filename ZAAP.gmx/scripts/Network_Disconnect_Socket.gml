var get_socket = ds_map_find_value(async_load,"socket")
var pos = ds_list_find_index(socket_list,get_socket)

//clear the ship's pilot
var get_map = ds_map_find_value(socket_map,get_socket)
var get_entity = ds_map_find_value(get_map,"ship")
if get_entity != undefined
    {
    packet_write(packet.entity_command,-1,get_entity)
    ds_map_replace(get_entity,"pilot",undefined)
    }

//store/delete the map
ds_map_delete(socket_map,get_socket)
//remove from list
ds_list_delete(socket_list,pos)

console_add("Client " + string(get_socket) + " disconnected")
show("Client " + string(get_socket) + " disconnected")

packet_write(packet.remove_socket,get_socket)
//packet_write(packet.update_sockets)
