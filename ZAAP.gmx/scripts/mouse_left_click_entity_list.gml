if not draw_debug_entity_list
return false//early exit if the list isn't being drawn

var get_pos = entity_list_index_from_mouse()
if is_zero(get_pos) return false
get_pos -= 1

show("mouse clicked on position: " + string(get_pos))

var get_uuid = ds_list_find_value(entity_list,get_pos)
console_add("mouse clicked on [" + string(get_uuid) + "]")

var get_entity = entity_from_uuid(get_uuid)

show("entity is: " + string(get_entity))


entity_focus = get_uuid

//if we're done, return true
return true
