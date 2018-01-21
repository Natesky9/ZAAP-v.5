///grid_in_bounds(width,height,x,y)
//returns whether a grid value
//is in bounds or not
var get_width = argument0
var get_height = argument1
var get_x = argument2
var get_y = argument3

//var get_width = ds_grid_width(get_grid)
//var get_height = ds_grid_height(get_grid)

if get_x < 0
or get_y < 0
or get_x >= get_width
or get_y >= get_height
return false

return true
