///entity_list_index_from_mouse()

//this returns the index + 1 of the entity list
var m_x = window_mouse_get_x()
var m_y = window_mouse_get_y()

if m_x <= entity_list_x1
or m_x >= entity_list_x2
or m_y <= entity_list_y1
or m_y >= entity_list_y2
return false

//do the stuff here
var get_pos = ceil((m_y-entity_list_y1) / 16)

return get_pos
