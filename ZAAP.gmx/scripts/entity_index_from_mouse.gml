///entity_list_entity_from_mouse()

var get_list = get("selected type")

//this returns the uuid of the thing clicked
var m_x = window_mouse_get_x()
var m_y = window_mouse_get_y()

var entity_x1 = get("entity_registry_entity_x1")
var entity_y1 = get("entity_registry_entity_y1")
var entity_x2 = get("entity_registry_entity_x2")
var entity_y2 = get("entity_registry_entity_y2")

if m_x <= entity_x1
or m_x >= entity_x2
or m_y <= entity_y1
or m_y >= entity_y2
return false

//do the stuff here
var get_pos = ceil((m_y-entity_y1) / 16)

//get the id of the list
var get_list_index = entity_list(get_list)

var get_entity = ds_list_find_value(get_list_index,get_pos-1)
console_add(string(get_entity))

return get_entity
