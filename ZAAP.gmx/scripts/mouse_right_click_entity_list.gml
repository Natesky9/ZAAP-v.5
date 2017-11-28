///mouse_right_click_entity_list()
//###//
//double check that this works

var get_entity_type = get("selected entity type")
if is_zero(get_entity_type)
return false

var get_entity_list = get(get_entity_type)
var get_entity = entity_index_from_mouse()
if is_zero(get_entity)
return false


show("entity is: " + string(get_entity))

//packet_entity_destroy
packet_write(packet.entity_destroy,get_entity)
entity_destroy_basic(get_entity)
show("marked for deletion " + string(get_entity))

//if we're done, return true
return true
