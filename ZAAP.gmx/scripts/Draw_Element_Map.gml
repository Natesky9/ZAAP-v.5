///Draw_Element_Map(element)
//draws the supplied element as a key:value
var get_element = argument0
var get_element_focus = ds_get(get_element,"focus")
var get_element_name = ds_get(get_element,"name")

var key_list = ds_get(get_element_focus,"key list")
var key_list_size = ds_list_size(key_list)

var x1 = ds_get(get_element,"x1")
var x2 = x1 + 300
var y1 = ds_get(get_element,"y1")
var y2 = y1 + key_list_size*16

if not ds_exists(get_element_focus,ds_type_map)
return false

draw_element_border(x1,y1,x2,y2,get_element_name,true)
/*
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
*/


//show("there are keys: " + string(key_list_size))
for (var k = 0;k < key_list_size;k++)
    {
    var get_key = ds_list_find_value(key_list,k)
    var get_value = ds_get(get_element_focus,get_key)
    
    var key_type = get_key_type(get_key)
    
    
    var key_y1 = y1 + 16*k
    var key_y2 = y1 + 16*k+16
    draw_set_color(c_gray)
    draw_rectangle(x1,key_y1,x2,key_y2,false)
    
    font_align(7)
    draw_set_color(c_black)
    if key_type = ds_type_map
    draw_set_color(c_blue)
    if key_type = ds_type_list
    draw_set_color(c_green)
    
    draw_text(x1,key_y1,get_key)
    
    
    font_align(9)
    if key_type = ds_type_map
        {
        //draw key as map
        draw_set_color(c_blue)
        draw_text(x2,key_y1,"\#")
        }
    else
        {
        //draw key as value
        draw_set_color(c_white)
        draw_text(x2,key_y1,string(get_value))
        }
    }
//we're done here
