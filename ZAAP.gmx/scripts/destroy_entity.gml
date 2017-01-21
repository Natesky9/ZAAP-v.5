var get_uuid = argument0

var get_entity = entity_from_uuid(get_uuid)

var get_key_list = get_entity[? "key list"]
ds_delete(ds_type_list,get_key_list)

var get_pilot = get_entity[? "pilot"]
if get_pilot != undefined
    {
    //if the entity has a pilot
    var get_pilot = get_entity[? "pilot"]
    var get_socket_map = socket_map[? get_pilot];
    console_add("object deleted, clearing socket association")
    get_socket_map[? "ship"] = undefined
    //this line of code is redundant
    //packet_write(packet.entity_command,-1,get_uuid)
    }

//clear it from the list
var pos = ds_list_find_index(entity_list,get_uuid)
ds_list_delete(entity_list,pos)

//clear it from the entity map
ds_map_delete(entity_map,get_uuid)

ds_delete(ds_type_map,get_entity)
