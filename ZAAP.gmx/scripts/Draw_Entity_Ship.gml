var get_entity = argument0

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_speed = ds_get(get_entity,"speed")
var get_direction = ds_get(get_entity,"direction")
var get_heading = ds_get(get_entity,"heading")

var vertex_buffer = ds_get(get_entity,"grid vertex buffer")
var get_grid = ds_get(get_entity,"grid")
var get_pilot = ds_get(get_entity,"pilot")

//get ready to draw
transform_set_ship_orientation(get_x,get_y,get_heading,get_grid)

//ready to draw

if is_zero(get_grid)
    {
    draw_set_colour(c_blue)
    draw_rectangle(0,0,64,64,false)
    draw_set_colour(c_black)
    draw_rectangle(0,0,64,64,true)
    draw_text(0,0,"no grid")
    }
if not is_zero(get_grid)
    {
    //if not is_zero(vertex_buffer)
    Draw_Ship_Grid_Vertex_Buffer(get_entity)
    //draw the grid
    if debug_draw
        {
        Draw_Ship_Grid(get_grid)
        }
    

    //draw the grid
    }
    
//draw the pilot
if get_pilot != 0
    {
    //draw_set_color(c_green)
    //draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,true)
    draw_set_color(c_black)
    font_align(5)
    draw_text(40,16,"[" + string(get_pilot) + "]")
    }

//finished drawing
d3d_transform_set_identity()
//end drawing the entity

//debug draw
var autopilot_status = ds_get(get_entity,"autopilot")
if not is_zero(autopilot_status)
    {
    var get_autopilot_list = ds_get(get_entity,"autopilot list")
    var get_node,get_dest_x,get_dest_y
    for (var i = 0;i < ds_list_size(get_autopilot_list);i += 1)
        {
        get_node = ds_list_find_value(get_autopilot_list,i)
        
        get_dest_x = ds_get(get_node,"dest x")
        get_dest_y = ds_get(get_node,"dest y")
        
        draw_line(get_x,get_y,get_dest_x,get_dest_y)
        }
    draw_set_color(c_red)
    draw_text(get_x,get_y+40,"Autopilot")
    
    }
