///vertex_buffer_draw_hex_tile()
var get_vertex_buffer = argument0
var w = argument1
var h = argument2

var get_x = rock_grid_size * w * 1.5
var get_y = rock_grid_size * h * sqrt(3) + w mod 2 * rock_grid_size * sqrt(3)/2

var lx_prev = lengthdir_x(rock_grid_size,0)
var ly_prev = lengthdir_y(rock_grid_size,0)
for (i = 1;i <= 6;i += 1)
    {
    var lx = lengthdir_x(rock_grid_size,i*60)
    var ly = lengthdir_y(rock_grid_size,i*60)
    
    vertex_position(get_vertex_buffer,get_x,get_y)
    vertex_colour(get_vertex_buffer,c_black,1)
    
    vertex_position(get_vertex_buffer,get_x + lx, get_y + ly)
    vertex_colour(get_vertex_buffer,c_blue,1)
    
    vertex_position(get_vertex_buffer,get_x + lx_prev, get_y + ly_prev)
    vertex_colour(get_vertex_buffer,c_aqua,1)
    
    lx_prev = lx
    ly_prev = ly
    }
