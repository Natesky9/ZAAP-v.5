///entity_list_index_from_mouse()

//this returns the index + 1 of the entity list
var m_x = window_mouse_get_x()
var m_y = window_mouse_get_y()

var entity_list_x1 = get("entity_list_x1")
var entity_list_y1 = get("entity_list_y1")
var entity_list_x2 = get("entity_list_x2")
var entity_list_y2 = get("entity_list_y2")

if m_x <= entity_list_x1
or m_x >= entity_list_x2
or m_y <= entity_list_y1
or m_y >= entity_list_y2
return false

//do the stuff here
var get_pos = ceil((m_y-entity_list_y1) / 32)

return get_pos
