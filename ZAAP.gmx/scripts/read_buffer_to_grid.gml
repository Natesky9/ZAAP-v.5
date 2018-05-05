///read_buffer_to_grid(grid)

var get_grid = argument0

//read the size of the grid
var get_width = buffer_read(bin,buffer_u8)
var get_height = buffer_read(bin,buffer_u8)

ds_grid_resize(get_grid,get_width,get_height)

for (var h = 0;h < get_height;h += 1)
    {
    for (var w = 0;w < get_width;w += 1)
        {
        //assume 0-255
        //fix when grid values
        //change from this assumption
        var get_grid_cell = buffer_read(bin,buffer_u8);
        ds_grid_set(get_grid,w,h,get_grid_cell)
        //get_grid[# w,h] = get_grid_cell
        }
    }
