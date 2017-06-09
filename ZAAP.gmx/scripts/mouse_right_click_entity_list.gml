///mouse_right_click_entity_list()
//###//
//double check that this works

var get_entity_type = ds_get(envar,"selected entity type")
if is_zero(get_entity_type)
exit

var get_entity_list = ds_get(envar,get_entity_type)
var get_entity = entity_index_from_mouse()
if is_zero(get_entity)
exit

/*


//get the name, for debug purposes
show("mouse clicked on position: " + string(get_pos))
var get_name = entity_type_to_name(get_pos)
show("mouse clicked on entity type: " + get_name)

var get_list = ds_get(envar,get_pos)

var get_uuid = ds_list_find_value(get_list,get_pos)
if is_zero(get_uuid)
exit
console_add("mouse clicked on [" + string(get_uuid) + "]")

var get_entity = entity_from_uuid(get_uuid)
if is_zero(get_entity)
exit
*/
show("entity is: " + string(get_entity))

//packet_entity_destroy
packet_write(packet.entity_destroy,get_entity)
entity_destroy_basic(get_entity)
show("marked for deletion " + string(get_entity))

//if we're done, return true
return true
