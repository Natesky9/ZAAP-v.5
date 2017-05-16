///buffer_read_to_grid()

var get_grid_cell
var get_width = buffer_read(bin,buffer_u8)
var get_height = buffer_read(bin,buffer_u8)

var new_grid = ds_grid_create(get_width,get_height)

for (var h = 0;h < get_height;h += 1)
    {
    for (var w = 0;w < get_width;w += 1)
        {
        show("reading cell")
        //read the cell at the current position
        get_grid_cell = buffer_read(bin,buffer_u8)
        //set the cell from what was read
        ds_grid_set(new_grid,w,h,get_grid_cell)
        }
    }
return new_grid
