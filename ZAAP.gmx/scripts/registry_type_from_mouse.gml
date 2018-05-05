///registry_type_from_mouse()
//this returns the index + 1 of the entity list
//show("testing registry click")
var m_x = window_mouse_get_x()
var m_y = window_mouse_get_y()

var type_x1 = get("entity_registry_type_x1")
var type_y1 = get("entity_registry_type_y1")
var type_x2 = get("entity_registry_type_x2")
var type_y2 = get("entity_registry_type_y2")

if m_x <= type_x1
or m_x >= type_x2
or m_y <= type_y1
or m_y >= type_y2
return false

//do the stuff here
var get_pos = ceil((m_y-type_y1) / 32)

return get_pos
