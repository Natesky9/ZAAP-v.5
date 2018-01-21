///draw_asteroid_hex
//draws a hexagon at point
var get_x = argument0
var get_y = argument1
var get_heading = argument2

var angle = 0
var prev_x = get_x + lengthdir_x(rock_grid_size,angle)
var prev_y = get_y + lengthdir_y(rock_grid_size,angle)

repeat 6
    {
    angle += 60
    var curr_x = get_x + lengthdir_x(rock_grid_size,angle)
    var curr_y = get_y + lengthdir_y(rock_grid_size,angle)
    
    draw_set_color(c_black)
    //draw_line(prev_x,prev_y,get_x,get_y)
    //draw_line(get_x,get_y,curr_x,curr_y)
    draw_line(curr_x,curr_y,prev_x,prev_y)
    
    prev_x = curr_x
    prev_y = curr_y
    }

return true
