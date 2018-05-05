///mouse_left_click_registry()


var elements = get("registry")

var click_x = window_mouse_get_x()
var click_y = window_mouse_get_y()
set("click x",click_x)
set("click y",click_y)
//get the element/entity clicked on
var elements = ds_get(registry,"elements")
if is_zero(elements) return false

var get_list = ds_get(elements,"key list")
var get_size = ds_list_size(get_list)

var selected = false
for (var i = get_size-1;i >= 0;i--)
    {
    var get_element = ds_list_find_value(get_list,i)
    var element_x1 = ds_get(get_element,"x1")
    var element_y1 = ds_get(get_element,"y1")
    
    if click_x > element_x1
    and click_y > element_y1
    and click_x < (element_x1 + 300)
    and click_y < (element_y1 + 16)
        {
        if click_x > element_x1 + 300 - 16
            {
            //clicked on the close button
            element_delete(get_element)
            return true
            }
        
        //push this to the top of the stack
        ds_list_delete(get_list,i)
        ds_list_add(get_list,get_element)
        
        selected = get_element
        show("set selected to: " + string(selected))
        set("selected",selected)
        //we're done here
        return true
        }
    var get_focus = ds_get(get_element,"focus")
    var key_list = ds_get(get_focus,"key list")
    var keys = ds_list_size(key_list)
    
    var element_x2 = element_x1 + 300
    var element_y2 = element_y1 + 16 + keys * 16
    
    if click_x > element_x1
    and click_y > element_y1
    and click_x < element_x2
    and click_y < element_y2
        {
        var relative_y = click_y - element_y1 - 16
        var pos = relative_y div 16
        var get_key = ds_list_find_value(key_list,pos)
        show("key clicked on is: " + string(get_key))
        var get_value = ds_get(get_focus,get_key)
        show("value of key is: " + string(get_value))
        
        var type = get_key_type(get_key)
        if type == ds_type_map
            {
            if get_value == "map"
            element_add(click_x,click_y,element.map,"map: " + string(get_key),get_key)
            else
            element_add(click_x,click_y,element.map,get_key,get_value)
            }
        if type == ds_type_list
            {
            element_add(click_x,click_y,element.list,get_key,get_value)
            }
        return true
        }
    }

return false
