///element_add(x,y,focus,name)
//add an element to be displayed
var get_x = argument0
var get_y = argument1
var get_focus = argument2
var get_name = argument3
var get_type = argument4

var elements = ds_get(registry,"elements")

var new_element = ds_create(data.dynamic,ds_type_map)

show("creating new element focused on: " + string(get_focus))
show("with name of: " + string(get_name))
show("as the type: " + string(get_type))

ds_set(new_element,"x1",get_x)
ds_set(new_element,"y1",get_y)
ds_set(new_element,"focus",get_focus)
ds_set(new_element,"name",get_name)
ds_set(new_element,"type",get_type)

ds_set(elements,new_element,new_element)
