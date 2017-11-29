///randomize_grid
var get_grid = argument0

var width = ds_grid_width(get_grid)
var height = ds_grid_height(get_grid)

for (h = 0;h < height;h += 1)
    {
    for (w = 0;w < width;w += 1)
        {
        var value = irandom(part.types)
        ds_grid_set(get_grid,w,h,value)
        }
    }

