///Draw_Element_Shipyard(element)
//draws the supplied element as the shipyard interface
var get_element = argument0
var get_element_focus = ds_get(get_element,"focus")
var get_element_name = ds_get(get_element,"name")

var key_list = keys(get_element_focus)
var key_list_size = ds_list_size(key_list)

var x1 = ds_get(get_element,"x1")
var x2 = x1 + 300
var y1 = ds_get(get_element,"y1")
var y2 = y1 + key_list_size*16 + 16

if not ds_exists(get_element_focus,ds_type_map)
return false
//
draw_element_border(x1,y1,x2,y2,get_element_name,true)
