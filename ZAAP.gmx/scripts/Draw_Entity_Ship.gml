var get_entity = argument0

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_speed = ds_get(get_entity,"speed")
var get_direction = ds_get(get_entity,"direction")
var get_heading = ds_get(get_entity,"heading")

var get_grid = ds_get(get_entity,"grid")

var get_pilot = ds_get(get_entity,"pilot")

//get ready to draw
//d3d_transform_add_translation(-get_x,-get_y,0)
d3d_transform_add_rotation_z(get_heading-90)
d3d_transform_add_translation(get_x,get_y,0)
//ready to draw

if is_zero(get_grid)
    {
    draw_set_colour(c_blue)
    draw_rectangle(-32,-32,32,32,false)
    draw_set_colour(c_black)
    draw_rectangle(-32,-32,32,32,true)
    draw_text(0,0,"no grid")
    }
if not is_zero(get_grid)
    {
    //draw the grid
    Draw_Ship_Grid(get_grid)
    //draw the grid
    }
    
//draw the pilot
if get_pilot != 0
    {
    //draw_set_color(c_green)
    //draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,true)
    draw_set_color(c_black)
    font_align(5)
    draw_text(0,16,"[" + string(get_pilot) + "]")
    }

//finished drawing
d3d_transform_set_identity()
//end drawing the entity
