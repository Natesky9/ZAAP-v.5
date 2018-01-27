///draw_entity_asteroid_grid(grid)
//draws the grid and coordinates of a hex grid
var get_entity = argument0
var get_grid = argument1
var get_heading = argument2

var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)

var grid_position = point_to_hex_grid(get_entity,mouse_x,mouse_y)
var mouse_grid_x = grid_position[0]
var mouse_grid_y = grid_position[1]


font_align(5)

for (h = 0;h < get_height;h += 1)
    {
    for (w = 0;w < get_width;w += 1)
        {
        var text = string(w) + ":" + string(h)
        var get_x = rock_grid_size * w * 1.5
        var get_y = rock_grid_size * h * sqrt(3) + w mod 2 * rock_grid_size * sqrt(3)/2
        
        draw_set_color(c_white)
        draw_text(get_x,get_y,text)
        
        var get_hex = ds_grid_get(get_grid,w,h)
        if h == mouse_grid_y
        and w = mouse_grid_x
        and get_hex
            {
            draw_set_color(c_black)
            draw_asteroid_hex(get_x,get_y,get_heading)
            }
        }
    }
