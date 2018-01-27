///hex_cell_to_point(entity,grid_x,grid_y)
//returns an array of the x and y
//from a hex cell
var get_entity = argument0
var grid_x = argument1
var grid_y = argument2

var get_x = ds_get(get_entity,"x");
var get_y = ds_get(get_entity,"y");
var get_heading = ds_get(get_entity,"heading");
var get_grid = ds_get(get_entity,"grid");
var get_width = ds_grid_width(get_grid);
var get_height = ds_grid_height(get_grid);

var abs_x = rock_grid_size * grid_x * 1.5
var abs_y =  rock_grid_size * grid_y * sqrt(3) + (grid_x mod 2) * rock_grid_size * sqrt(3)/2

var x_start = -((get_width-1)*rock_grid_size * 1.5)/2
var y_start = -((get_height-1)*rock_grid_size * sqrt(3))/2

var point_x = get_x + abs_x + x_start
var point_y = get_y + abs_y + y_start

var get_distance = point_distance(get_x,get_y,point_x,point_y)
var get_direction = point_direction(get_x,get_y,point_x,point_y)

var final_x = get_x + lengthdir_x(get_distance,get_direction+get_heading)
var final_y = get_y + lengthdir_y(get_distance,get_direction+get_heading)

effect_create_above(ef_spark,final_x,final_y,0,c_blue)

var array;

array[0] = final_x
array[1] = final_y

return array
