///registry_variable_from_mouse
//do stuff
show("test!")
//this returns the uuid of the thing clicked
var m_x = window_mouse_get_x()
var m_y = window_mouse_get_y()

var variable_x1 = get("entity_registry_variable_x1")
var variable_y1 = get("entity_registry_variable_y1")
var variable_x2 = get("entity_registry_variable_x2")
var variable_y2 = get("entity_registry_variable_y2")

if m_x <= variable_x1
or m_x >= variable_x2
or m_y <= variable_y1
or m_y >= variable_y2
return false

//do the stuff here
var get_pos = ceil((m_y-variable_y1) / 16)

return get_pos
