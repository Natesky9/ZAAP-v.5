///y_to_grid_y(x,y,get_entity)
var get_target_x = argument0
var get_target_y = argument1
var get_entity = argument2

var get_grid = ds_get(get_entity,"grid")
var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_heading = ds_get(get_entity,"heading")
var grid_height = ds_grid_height(get_grid)

var grid_offset = grid_height*ship_grid_size/2
//normalize the mouse position to face up

var get_distance = point_distance(get_x,get_y,get_target_x,get_target_y)
var get_direction = point_direction(get_x,get_y,get_target_x,get_target_y)

var new_direction = get_direction - get_heading + 90

var new_target_x = get_x + lengthdir_x(get_distance,new_direction)
var new_target_y = get_y + lengthdir_y(get_distance,new_direction)


var grid_corner = get_y-grid_offset

var y_result = new_target_y - grid_corner
console_add("y result: " + string(y_result))
var y_div = y_result div ship_grid_size

if y_div < 0
or y_div >= grid_height
return -1

return y_div
