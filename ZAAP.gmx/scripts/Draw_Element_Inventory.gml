///Draw_Element_Inventory(element)
//draws the supplied element as an inventory gui
var get_element = argument0
var get_element_focus = ds_get(get_element,"focus")
var get_element_name = ds_get(get_element,"name")

if not ds_exists(get_element_focus,ds_type_map)
return false

var key_list = ds_get(get_element_focus,"key list")
var key_list_size = ds_list_size(key_list)

var x1 = ds_get(get_element,"x1")
var x2 = x1 + 300
var y1 = ds_get(get_element,"y1")
var y2 = y1 + key_list_size*16 + 16


//
draw_element_border(x1,y1,x2,y2,get_element_name,true)
if keyboard_check(vk_control)
exit
    
    //show("element is: " + string(get_element))

    
    //draw the title bar
    //draw_set_color(c_aqua)
    //draw_rectangle(x1,y1,x2,y2,false)
    //draw_set_color(c_black)
    //draw_rectangle(x1,y1,x2,y2,true)
    
    
    
    //font_align(7)
    //draw_text(x1,y1,get_element_name)
//
//if not ds_exists(get_element_focus,ds_type_map)
//continue


//show("there are keys: " + string(key_list_size))

var count = 0

for (var k = 0;k < key_list_size;k++)
    {
    var get_key = ds_list_find_value(key_list,k)
    var get_value = ds_get(get_element_focus,get_key);
    
    count += get_value
    
    var key_y1 = y1 + 16*k
    var key_y2 = y1 + 16*k + 16
    draw_set_color(c_gray)
    draw_rectangle(x1,key_y1,x2,key_y2,false)
    
    draw_set_color(c_black)
    font_align(7)
    draw_text(x1,key_y1,"Item: " + string(get_key))
    font_align(9)
    draw_text(x2,key_y1,"[" + string(get_value) + "]")
    }
var bar_y1 = y1 + key_list_size*16
var bar_y2 = bar_y1 + 16

draw_set_color(c_black)
draw_rectangle(x1,bar_y1,x2,bar_y2,true)

var draw_count = 0
for (var k = 0;k < key_list_size;k++)
    {
    var get_key = ds_list_find_value(key_list,k)
    var get_value = ds_get(get_element_focus,get_key);
    
    //
    var increment = k/key_list_size
    var hue = 255*increment
    //show("Hue is: " + string(hue))
    var color = make_colour_hsv(hue,255,255)
    draw_set_color(color)
    //
    
    var width = x2 - x1
    
    var bar_x1 = x1 + draw_count/count*width
    var bar_width = get_value/count
    var bar_x2 = bar_x1 + bar_width*width
    draw_rectangle(bar_x1,bar_y1,bar_x2,bar_y2,false)
    draw_count += get_value
    }
