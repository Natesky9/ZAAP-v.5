///hex_neighbor(grid,x,y,dir)
//returns the value of the neigboring hex
var get_grid = argument0;
var get_width = argument1;
var get_height = argument2;
var get_grid_x = argument3;
var get_grid_y = argument4;
var get_dir = argument5;

var grid = hex_direction_to_grid(get_dir,get_grid_x,get_grid_y)
var get_dir_x = grid[0]
var get_dir_y = grid[1]

var get_x = get_grid_x + get_dir_x
var get_y = get_grid_y + get_dir_y

if not grid_in_bounds(get_grid,get_width,get_height,get_x,get_y)
return false

var get_value = ds_grid_get(get_grid,get_x,get_y)

//check if out of bounds
if is_undefined(get_value)
    {
    show("didn't account for this one")
    return false
    }

return get_value
