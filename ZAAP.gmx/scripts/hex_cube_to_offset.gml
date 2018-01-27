///hex_cube_to_offset
//converts cube coordinates to offset
var get_x = argument0
var get_y = argument1
var get_z = argument2

q = get_x
r = get_z + (get_x - (get_x mod 2)) / 2

var offset;
offset[0] = q
offset[1] = r
return offset
