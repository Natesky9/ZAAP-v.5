///hex_offset_to_cube
//converts offset coordinates to cube coordinates

var get_q = argument0
var get_r = argument1

var get_x = get_q
var get_z = get_r - (get_q - (get_q mod 2)) / 2
var get_y = -get_x-get_z;

var cube;
cube[0] = get_x
cube[1] = get_y
cube[2] = get_z

return cube
