///draw_registry_structure_grid(grid,x1,y1,x2,y2)
//draws the grid for the registry
var get_grid = argument0
var structure_x1 = argument1
var structure_y1 = argument2

if is_zero(get_grid)
    {
    show("Error, grid is null! #draw_registry_structure_grid")
    return false
    }

var grid_width = ds_grid_width(get_grid)
var grid_height = ds_grid_height(get_grid)

var structure_width = grid_width * 16
var structure_height = grid_height * 16
structure_x2 = structure_x1 + structure_width
structure_y2 = structure_y1 + structure_height

draw_set_color(c_white)
draw_rectangle(structure_x1,structure_y1,structure_x2,structure_y2,false)
draw_set_color(c_black)
draw_rectangle(structure_x1,structure_y1,structure_x2,structure_y2,true)

font_align(7)
var line_x1,line_y1,line_x2,line_y2
for (var w = 0;w < grid_width;w += 1)
    {
    line_x1 = structure_x1 + w*16
    line_y1 = structure_y1
    line_y2 = line_y1 + structure_width
    draw_set_color(c_blue)
    draw_line(line_x1,line_y1,line_x1,line_y2)
    for (var h = 0;h < grid_height;h += 1)
        {
        if w == 1
            {
            line_x1 = structure_x1
            line_x2 = line_x1 + structure_height
            line_y1 = structure_y1 + h*16
            draw_set_color(c_blue)
            draw_line(line_x1,line_y1,line_x2,line_y1)
            }
        
        var get_value = ds_grid_get(get_grid,w,h)
        draw_text(structure_x1 + w*16,structure_y1 + h*16,string(get_value))
        }
    }
