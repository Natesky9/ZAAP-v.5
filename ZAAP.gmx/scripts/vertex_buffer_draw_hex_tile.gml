///vertex_buffer_draw_hex_tile()
var get_grid = argument0
var get_vertex_buffer = argument1
var w = argument2
var h = argument3
var get_value = argument4

var get_x = rock_grid_size * w * 1.5
var get_y = rock_grid_size * h * sqrt(3) + w mod 2 * rock_grid_size * sqrt(3)/2

var color
var neighbor1
var neighbor2
var color1
var color2

var lx_prev = lengthdir_x(rock_grid_size,0)
var ly_prev = lengthdir_y(rock_grid_size,0)
for (i = 1;i <= 6;i += 1)
    {
    //center vertex
    var base_color = grid_value_to_color(get_value)
    var lx = lengthdir_x(rock_grid_size,i*60)
    var ly = lengthdir_y(rock_grid_size,i*60)
    
    vertex_position(get_vertex_buffer,get_x,get_y)
    vertex_colour(get_vertex_buffer,base_color,1)
    
    //vertex left
    neighbor1 = hex_neighbor(get_grid,w,h,(i-1+6) mod 6 + 1)
    neighbor2 = hex_neighbor(get_grid,w,h,(i-2+6) mod 6 + 1)
    color = base_color
    
    color1 = grid_value_to_color(neighbor1)
    color2 = grid_value_to_color(neighbor2)
    
    if not neighbor1 or not neighbor2
    color = hex_blend_colors(color1,color2,base_color)
    
    vertex_position(get_vertex_buffer,get_x + lx, get_y + ly)
    vertex_colour(get_vertex_buffer,color,1)
    
    //vertex right
    neighbor1 = hex_neighbor(get_grid,w,h,(i-2+6) mod 6 + 1)
    neighbor2 = hex_neighbor(get_grid,w,h,(i-3+6) mod 6 + 1)
    color = base_color
    
    color1 = grid_value_to_color(neighbor1)
    color2 = grid_value_to_color(neighbor2)
    
    
    if not neighbor1 or not neighbor2
    color = hex_blend_colors(color1,color2,base_color)
    
    vertex_position(get_vertex_buffer,get_x + lx_prev, get_y + ly_prev)
    vertex_colour(get_vertex_buffer,color,1)
    
    //prev
    lx_prev = lx
    ly_prev = ly
    }
