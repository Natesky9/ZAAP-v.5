//write_grid_to_buffer(grid)

///write_grid_to_buffer
var get_grid = argument0

if is_zero(get_grid)
exit

//write the size of the grid
var grid_width = ds_grid_width(get_grid)
var grid_height = ds_grid_height(get_grid)

buffer_write(bout,buffer_u8,grid_width)
buffer_write(bout,buffer_u8,grid_height)
//write(grid_width)
//write(grid_height)

for (var h = 0;h < grid_height;h += 1)
    {
    for (var w = 0;w < grid_width;w += 1)
        {
        var get_grid_cell = ds_grid_get(get_grid,w,h)
        //assume 0-255
        //fix when grid values
        //change from this assumption
        buffer_write(bout,buffer_u8,get_grid_cell)
        }
    }
