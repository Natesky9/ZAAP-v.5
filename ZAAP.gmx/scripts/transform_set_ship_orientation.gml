var get_x = argument0
var get_y = argument1
var get_heading = argument2
var get_grid = argument3

get_width = ds_grid_width(get_grid)
get_height = ds_grid_height(get_grid)

//get the starting position of the grid
x_start = -(get_width*ship_grid_size)/2
y_start = -(get_height*ship_grid_size)/2

d3d_transform_add_translation(x_start,y_start,0)
d3d_transform_add_rotation_z(get_heading-90)
d3d_transform_add_translation(get_x,get_y,0)
