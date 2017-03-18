///vertex_buffer_draw_square_tile(vertex_buffer,x1,y1,x2,y2,color)

var get_vertex_buffer = argument0

var get_x1 = argument1
var get_y1 = argument2
var get_x2 = argument3
var get_y2 = argument4
var mean_x = mean(get_x1,get_x2)
var mean_y = mean(get_y1,get_y2)
var get_grid_color = argument5
var get_alt_color = c_black

//x1 y1
vertex_position(get_vertex_buffer,get_x1,get_y1)
vertex_colour(get_vertex_buffer,get_grid_color,1)
//x2 y1
vertex_position(get_vertex_buffer,get_x2,get_y1)
vertex_colour(get_vertex_buffer,get_grid_color,1)
//xm ym
vertex_position(get_vertex_buffer,mean_x,mean_y)
vertex_colour(get_vertex_buffer,get_alt_color,1)

//x1 y1
vertex_position(get_vertex_buffer,get_x2,get_y1)
vertex_colour(get_vertex_buffer,get_grid_color,1)
//x2 y1
vertex_position(get_vertex_buffer,get_x2,get_y2)
vertex_colour(get_vertex_buffer,get_grid_color,1)
//xm ym
vertex_position(get_vertex_buffer,mean_x,mean_y)
vertex_colour(get_vertex_buffer,get_alt_color,1)

//x1 y1
vertex_position(get_vertex_buffer,get_x2,get_y2)
vertex_colour(get_vertex_buffer,get_grid_color,1)
//x2 y1
vertex_position(get_vertex_buffer,get_x1,get_y2)
vertex_colour(get_vertex_buffer,get_grid_color,1)
//xm ym
vertex_position(get_vertex_buffer,mean_x,mean_y)
vertex_colour(get_vertex_buffer,get_alt_color,1)

//x1 y1
vertex_position(get_vertex_buffer,get_x1,get_y2)
vertex_colour(get_vertex_buffer,get_grid_color,1)
//x2 y1
vertex_position(get_vertex_buffer,get_x1,get_y1)
vertex_colour(get_vertex_buffer,get_grid_color,1)
//xm ym
vertex_position(get_vertex_buffer,mean_x,mean_y)
vertex_colour(get_vertex_buffer,get_alt_color,1)


