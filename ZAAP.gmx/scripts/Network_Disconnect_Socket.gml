///Network_Disconnect_Socket()

var get_socket = ds_get(async_load,"socket")
var get_map = map_from_socket(get_socket)
show("//--------//")
show("Client Disconnecting")
show("//--------//")
//clear the ship's pilot
var get_uuid = ds_get(get_map,"ship")
var get_entity = entity_from_uuid(get_uuid)
if get_entity != 0
    {
    //reset the ship that was controlled by the disconnecting socket
    //packet_entity_command
    packet_write(packet.entity_command,0,get_uuid)
    ds_map_replace(get_entity,"pilot",0)
    }

//unmap the ds map
ds_delete(sockets,get_socket)
ds_destroy(ds_type_map,get_map)

console_add("Client " + string(get_socket) + " disconnected")
show("Client " + string(get_socket) + " disconnected")

//packet_remove_socket
packet_write(packet.remove_socket,get_socket)

//code by Natesky9
//"DIE, DIE, DIE!"
