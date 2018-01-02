///mouse_to_hex_grid_x(entity,grid)

var get_entity = argument0
var get_grid = argument1

var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)

var x_start = -((get_width-1)*rock_grid_size * 1.5)/2
var y_start = -((get_height-1)*rock_grid_size * sqrt(3))/2


var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

var relative_x = mouse_x - get_x - x_start
var relative_y = mouse_y - get_y - y_start

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



show("grid is: " + string(q) + ":" + string(r))

