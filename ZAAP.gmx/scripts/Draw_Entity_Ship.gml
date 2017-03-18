///Draw_Entity_Ship(entity)

var get_entity = argument0
var get_uuid = uuid_from_entity(get_entity)

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

var drawn = false
//ready to draw

drawn = Draw_Ship_Grid_Vertex_Buffer(get_entity)

if not drawn 
    {
    drawn = Draw_Ship_Grid(get_grid);
    if not drawn
        {
        console_add("Ship has no grid!")
        if am_server()
            {
            entity_destroy_basic(get_uuid)
            packet_write(packet.entity_destroy)
            }
        }
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
    if is_zero(get_autopilot_list)
    exit
    var prev_x = get_x
    var prev_y = get_y
    var get_node,get_type,get_dest_x,get_dest_y
    for (var i = 0;i < ds_list_size(get_autopilot_list);i += 1)
        {
        get_node = ds_list_find_value(get_autopilot_list,i)
        
        get_type = ds_get(get_node,"type")
        get_dest_x = ds_get(get_node,"x")
        get_dest_y = ds_get(get_node,"y")
        
        if get_type == "checkpoint"
            {
            draw_rectangle(get_dest_x-16,get_dest_y-16,get_dest_x+16,get_dest_y+16,true)
            }
        if get_type == "waypoint"
            {
            draw_circle(get_dest_x,get_dest_y,8,true)
            }
        
        draw_line(prev_x,prev_y,get_dest_x,get_dest_y)
        prev_x = get_dest_x
        prev_y = get_dest_y
        }
    draw_set_color(c_red)
    draw_text(get_x,get_y+40,"Autopilot")
    
    }
