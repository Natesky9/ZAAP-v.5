///draw_element_border(x1,y1,x2,y2,name,"x")
//draws the decorative border around an element
var x1 = argument0
var y1 = argument1
var x2 = argument2
var y2 = argument3
var name = argument4
var close = argument5

if keyboard_check(vk_control)
    {
    draw_set_color(c_green)
    draw_rectangle(x1-16,y1-16,x2+16,y2+16,true)
    }

//surrounding border
draw_set_color(c_red)
draw_rectangle(x1-8,y1-8,x2+8,y2+8,false)
draw_set_color(c_fuchsia)
//up left
draw_rectangle(x1-16,y1-16,x1+32,y1+32,false)
//draw_rectangle(x1-16,y1-16,x1+32,y1   ,false)
//draw_rectangle(x1-16,y1-16,x1   ,y1+32,false)
//up right
draw_rectangle(x2-32,y1-16,x2+16,y1+32,false)
//draw_rectangle(x2-32,y1-16,x2 ,y1   ,false)
//draw_rectangle(x2   ,y1-16,x2+16,y1+32,false)
//down left
draw_rectangle(x1-16,y2-32,x1+32,y2+16,false)
//draw_rectangle(x1-16,y2-32,x1  ,y2+16,false)
//draw_rectangle(x1-16,y2   ,x1+32,y2+16,false)
//down right
draw_rectangle(x2-32,y2-32,x2+16,y2+16,false)
//draw_rectangle(x2-32,y2  ,x2+16,y2+16,false)
//draw_rectangle(x2   ,y2-32,x2+16,y2+16,false)
//end surrounding border

//draw the title
var text_center = mean(x1,x2)
var text_width = string_width(string(name))

var text_x1 = text_center - text_width/2 - 16
var text_y1 = y1-16
var text_x2 = text_center + text_width/2 + 16
var text_y2 = y1
var mouse_in_title = mouse_x > x1+32 and mouse_x < x2-32
                    and mouse_y < y1 and mouse_y > y1-16
                    
draw_set_color(c_orange)
if mouse_in_title
    {
    draw_rectangle(x1+32,text_y1,x2-32,text_y2,false)
    show("Mouse in title!")
    }
else
    {
    draw_rectangle(text_x1,text_y1,text_x2,text_y2,false)
    draw_triangle(text_x1,text_y1,text_x1,text_y2,text_x1-32,text_y2,false)
    draw_triangle(text_x2,text_y1,text_x2,text_y2,text_x2+32,text_y2,false)
    }

var text_middle = mean(text_y1,text_y2)

font_align(5)
draw_set_color(c_black)
draw_text(text_center,text_middle,name)
//end title



if close
    {
    var c_x1 = x2
    var c_y1 = y1 - 16
    var c_x2 = x2 + 16
    var c_y2 = y1
    var mouse_in_close = mouse_x > c_x1 and mouse_x < c_x2
                    and mouse_y > c_y1 and mouse_y < c_y2
    
    draw_set_color(c_black)
    draw_rectangle(c_x1,c_y1,c_x2,c_y2,true)
    
    if mouse_in_close
    draw_set_color(c_black)
    else
    draw_set_color(c_white)
    
    draw_line(c_x1+2,c_y2-2,c_x2-2,c_y1+2)
    draw_line(c_x1+2,c_y1+2,c_x2-2,c_y2-2)
    }

