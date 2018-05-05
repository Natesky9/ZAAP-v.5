///Draw_Element_List(element)
//draws the supplied element as a list of values
var get_element = argument0
var get_element_focus = ds_get(get_element,"focus")
var get_element_name = ds_get(get_element,"name")

var x1 = ds_get(get_element,"x1")
var x2 = x1 + 300
var y1 = ds_get(get_element,"y1")
var y2 = y1 + 16

if not ds_exists(get_element_focus,ds_type_list)
return false

//
    
    //show("element is: " + string(get_element))

    
    //draw the title bar
    draw_set_color(c_aqua)
    draw_rectangle(x1,y1,x2,y2,false)
    draw_set_color(c_black)
    draw_rectangle(x1,y1,x2,y2,true)
    
    var c_x1 = x2 - 16
    var c_y1 = y1
    var c_x2 = x2
    var c_y2 = y1 + 16
    draw_set_color(c_red)
    draw_rectangle(c_x1,c_y1,c_x2,c_y2,false)
    draw_set_color(c_white)
    draw_line(c_x1,c_y2,c_x2,c_y1)
    draw_line(c_x1,c_y1,c_x2,c_y2)
    draw_set_color(c_black)
    draw_line(c_x1,c_y1,c_x1,c_y2)
    
    font_align(7)
    draw_text(x1,y1,get_element_name)
//

var key_list = get_element_focus
var key_list_size = ds_list_size(key_list)
//show("there are keys: " + string(key_list_size))
font_align(7)
for (var k = 0;k < key_list_size;k++)
    {
    var get_value = ds_list_find_value(key_list,k)
                    
    var key_y1 = y1 + 16*k
    var key_y2 = y1 + 16*k+16
    draw_set_color(c_gray)
    draw_rectangle(x1,key_y1,x2,key_y2,false)
    
    draw_set_color(c_black)
    
    draw_text(x1,key_y1,get_value)
    }
