///Draw_Ship_Grid(get_grid)
var get_grid = argument0
var get_width, get_height
var x_start, y_start
var w, h
var x1, y1, x2, y2

get_width = ds_grid_width(get_grid)
get_height = ds_grid_height(get_grid)


for (h = 0;h < get_height;h += 1)
    {
    for (w = 0;w < get_width;w += 1)
        {
        get_grid_cell = get_grid[# w, h]
        x1 = w * ship_grid_size
        y1 = h * ship_grid_size
        x2 = x1 + ship_grid_size
        y2 = y1 + ship_grid_size
        
        //get color from value later
        draw_set_color(c_black)
        font_align(7)
        draw_text(x1,y1,string(w) + ":" + string(h))
        //draw_rectangle(x1,y1,x2,y2,not get_grid_cell)
        }
    }
