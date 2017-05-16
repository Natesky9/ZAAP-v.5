///vertex_buffer_draw_rectangle(vertex_buffer,x1,y1,x2,y2,color)

var get_vertex_buffer = argument0

var get_x1 = argument1
var get_y1 = argument2
var get_x2 = argument3
var get_y2 = argument4
var get_grid_color = argument5

vertex_position(get_vertex_buffer,get_x1,get_y1)
vertex_colour(get_vertex_buffer,get_grid_color,1)
vertex_position(get_vertex_buffer,get_x2,get_y1)
vertex_colour(get_vertex_buffer,get_grid_color,1)
vertex_position(get_vertex_buffer,get_x1,get_y2)
vertex_colour(get_vertex_buffer,get_grid_color,1)

vertex_position(get_vertex_buffer,get_x2,get_y2)
vertex_colour(get_vertex_buffer,get_grid_color,1)
vertex_position(get_vertex_buffer,get_x1,get_y2)
vertex_colour(get_vertex_buffer,get_grid_color,1)
vertex_position(get_vertex_buffer,get_x2,get_y1)
vertex_colour(get_vertex_buffer,get_grid_color,1)
