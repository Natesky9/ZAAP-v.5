///x_to_grid_x(x,y,get_entity)
var get_target_x = argument0
var get_target_y = argument1
var get_entity = argument2

var get_grid = grid_from_entity(get_entity)
var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_heading = ds_get(get_entity,"heading")
var grid_width = ds_grid_width(get_grid)

var grid_offset = grid_width*ship_grid_size/2
//normalize the mouse position to face up

var get_distance = point_distance(get_x,get_y,get_target_x,get_target_y)
var get_direction = point_direction(get_x,get_y,get_target_x,get_target_y)

var new_direction = get_direction - get_heading + 90

var new_target_x = get_x + lengthdir_x(get_distance,new_direction)
var new_target_y = get_y + lengthdir_y(get_distance,new_direction)


var grid_corner = get_x-grid_offset

var x_result = new_target_x - grid_corner
var x_div = x_result div ship_grid_size

if x_div < 0
or x_div >= grid_width
return -1

return x_div
