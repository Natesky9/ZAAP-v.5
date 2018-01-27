///point_to_hex_grid(entity,x,y)

//start timer
//var timer = get_timer()

var get_entity = argument0
var get_input_x = argument1
var get_input_y = argument2

var get_grid = ds_get(get_entity,"grid")
var get_heading = ds_get(get_entity,"heading")

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)

//find the center of the hex grid
var x_start = -((get_width-1)*rock_grid_size * 1.5)/2
var y_start = -((get_height-1)*rock_grid_size * sqrt(3))/2

//effect_create_above(ef_spark,get_x + x_start,get_y + y_start,1,c_red)



var length = point_distance(get_x,get_y,get_input_x,get_input_y);
var angle = point_direction(get_x,get_y,get_input_x,get_input_y);

angle -= get_heading

var rotated_x = lengthdir_x(length,angle)
var rotated_y = lengthdir_y(length,angle)

//effect_create_above(ef_spark,get_x - rotated_x,get_y - rotated_y,1,c_blue)

var relative_x = rotated_x - x_start
var relative_y = rotated_y - y_start

var cube,get_x,get_y,get_z,offset,q,r

q = relative_x * 2/3 / rock_grid_size
r = (-relative_x / 3 + sqrt(3)/3 * relative_y) / rock_grid_size + q div 2

cube = hex_offset_to_cube(q,r)
get_x = cube[0]
get_y = cube[1]
get_z = cube[2]

cube = hex_round(get_x,get_y,get_z)
get_x = cube[0]
get_y = cube[1]
get_z = cube[2]

offset = hex_cube_to_offset(get_x,get_y,get_z)
q = offset[0]
r = offset[1]

//show("grid is: " + string(q) + ":" + string(r))

//timer
//var execute_time = get_timer() - timer
//show("time to execute point_to_hex_grid: " + string(execute_time))

return offset
