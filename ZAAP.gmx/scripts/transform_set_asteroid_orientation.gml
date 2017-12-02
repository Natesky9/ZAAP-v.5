///transform_set_asteroid_orientation(x,y,heading,grid)
//
var get_x = argument0
var get_y = argument1
var get_heading = argument2
var get_grid = argument3

get_width = ds_grid_width(get_grid)
get_height = ds_grid_height(get_grid)

var get_x = rock_grid_size * h * 1.5
var get_y = rock_grid_size * w * sqrt(3) + h mod 2 * rock_grid_size * sqrt(3)/2

//get the starting position of the grid
x_start = -(get_width*ship_grid_size)/2
y_start = -(get_height*ship_grid_size)/2

d3d_transform_add_translation(x_start,y_start,0)
d3d_transform_add_rotation_z(get_heading-90)
d3d_transform_add_translation(get_x,get_y,0)
