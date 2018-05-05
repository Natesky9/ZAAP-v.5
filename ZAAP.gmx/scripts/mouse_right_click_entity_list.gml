///mouse_right_click_entity_list()
//###//
//double check that this works

var get_entity_type = get("selected type")
if is_zero(get_entity_type)
return false

var get_entity_list = get(get_entity_type)
var get_uuid = registry_uuid_from_mouse()
if is_zero(get_uuid)
return false


show("entity is: " + string(get_uuid))

//packet_entity_destroy
packet_write(packet.entity_destroy,get_uuid)
entity_destroy_basic(get_uuid)
show("marked for deletion " + string(get_uuid))

//if we're done, return true
return true
