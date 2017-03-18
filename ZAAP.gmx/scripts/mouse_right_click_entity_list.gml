///mouse_right_click_entity_list()

var get_pos = entity_list_index_from_mouse()
if is_zero(get_pos) exit
get_pos -= 1

show("mouse clicked on position: " + string(get_pos))

var get_uuid = ds_list_find_value(entity_list,get_pos)
console_add("mouse clicked on [" + string(get_uuid) + "]")

var get_entity = entity_from_uuid(get_uuid)

show("entity is: " + string(get_entity))

packet_write(packet.entity_destroy,get_uuid)
entity_destroy_basic(get_uuid)
console_add("destroyed " + string(get_uuid))

//if we're done, return true
return true
