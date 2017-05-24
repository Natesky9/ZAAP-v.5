///entity_list_entity_from_mouse()

var get_list = ds_get(envar,"selected entity type")

//this returns the uuid of the thing clicked
var m_x = window_mouse_get_x()
var m_y = window_mouse_get_y()

if m_x <= entity_specific_list_x1
or m_x >= entity_specific_list_x2
or m_y <= entity_specific_list_y1
or m_y >= entity_specific_list_y2
return false

//do the stuff here
var get_pos = ceil((m_y-entity_specific_list_y1) / 16)

//get the id of the list
var get_list_index = ds_get(envar,get_list)

var get_entity = ds_list_find_value(get_list_index,get_pos-1)
console_add(string(get_entity))

return get_entity
