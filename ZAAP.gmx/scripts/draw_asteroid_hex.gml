var get_entity = argument0
var get_x = argument1
var get_y = argument2

var angle = 0
var prev_x = get_x + lengthdir_x(16,angle)
var prev_y = get_y + lengthdir_y(16,angle)
repeat 5
    {
    angle++
    var curr_x = get_x + lengthdir_x(16,angle)
    var curr_y = get_y + lengthdir_y(16,angle)
    
    draw_set_color(c_black)
    draw_line(prev_x,prev_y,get_x,get_y)
    draw_line(get_x,get_y,curr_x,curr_y)
    draw_line(curr_x,curr_y,prev_x,prev_y)
    
    prev_x = curr_x
    prev_y = curr_y
    }
