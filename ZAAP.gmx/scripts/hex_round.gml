///hex_round(x,y,z)

var hex_x = argument0
var hex_y = argument1
var hex_z = argument2

var rx = round(hex_x)
var ry = round(hex_y)
var rz = round(hex_z)

var x_diff = abs(rx - hex_x)
var y_diff = abs(ry - hex_y);
var z_diff = abs(rz - hex_z);

if x_diff > y_diff and x_diff > z_diff
    rx = -ry-rz
else if y_diff > z_diff
    ry = -rx-rz
else
    rz = -rx-ry

cube[0] = rx
cube[1] = ry
cube[2] = rz

return cube
