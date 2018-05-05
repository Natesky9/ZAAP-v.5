///element_add(x,y,element.type,name,[focus,focus])
//add an element to be displayed
var get_x = argument[0]
var get_y = argument[1]
var get_type = argument[2]
var get_name = argument[3]
var get_focus = argument[4]

var elements = ds_get(registry,"elements")

var new_element = ds_create(data.dynamic,ds_type_map)

if get_type == element.shipyard
    {
    get_other_focus = argument[5]
    ds_set(new_element,"shipyard",get_other_focus)
    }

show("creating new element focused on: " + string(get_focus))
show("with name of: " + string(get_name))
show("as the type: " + string(get_type))

ds_set(new_element,"x1",get_x)
ds_set(new_element,"y1",get_y)
ds_set(new_element,"focus",get_focus)
ds_set(new_element,"name",get_name)
ds_set(new_element,"type",get_type)

if get_type == element.shipyard
    {
    ds_set(new_element,"shipyard",get_other_focus)
    }

ds_set(elements,new_element,new_element)
//we're done here
