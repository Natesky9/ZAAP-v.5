///Draw_Entity_Ship(entity)

var get_entity = argument0
var get_uuid = uuid_from_entity(get_entity)

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_speed = ds_get(get_entity,"speed")
var get_direction = ds_get(get_entity,"direction")
var get_heading = ds_get(get_entity,"heading")

var get_grid = ds_get(get_entity,"grid")
var vertex_buffer = ds_get(get_entity,"vertex buffer")
var get_grid = grid_from_entity(get_entity)
var get_pilot = ds_get(get_entity,"pilot")

//get ready to draw
transform_set_ship_orientation(get_x,get_y,get_heading,get_grid)

var drawn = false
//ready to draw

drawn = Draw_Ship_Grid_Vertex_Buffer(get_entity)

if not drawn 
drawn = Draw_Ship_Grid(get_grid);

if not drawn
    {
    console_add("Ship has no grid!")
    if am_server()
        {
        entity_destroy_basic(get_uuid)
        exit
        }
    }

//draw the grid around the cell the mouse is on
var mouse_grid_x = x_to_grid_x(mouse_x,mouse_y,get_entity)
var mouse_grid_y = y_to_grid_y(mouse_x,mouse_y,get_entity)

if mouse_grid_x != -1
and mouse_grid_y != -1
    {
    
    var g_x1 = mouse_grid_x * ship_grid_size
    var g_y1 = mouse_grid_y * ship_grid_size
    
    var g_x2 = g_x1 + ship_grid_size
    var g_y2 = g_y1 + ship_grid_size
    draw_set_color(c_blue)
    draw_rectangle(g_x1,g_y1,g_x2,g_y2,true)
    }

    
//draw the pilot
if get_pilot != 0
    {
    //draw_set_color(c_green)
    //draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,true)
    draw_set_color(c_black)
    font_align(5)
    draw_text(40,16,"[" + string(get_pilot) + "]")
    var get_player = map_from_socket(get_pilot)
    var get_name = ds_get(get_player,"username")
    draw_text(80,16,get_name)
    }

//finished drawing
d3d_transform_set_identity()
//end drawing the entity

//debug draw

var get_target = ds_get(get_entity,"target")
if not is_zero(get_target)
    {
    var get_target_entity = entity_from_uuid(get_target)
    var get_target_x = ds_get(get_target_entity,"x")
    var get_target_y = ds_get(get_target_entity,"y")
    draw_set_color(c_blue)
    draw_line(get_x,get_y,get_target_x,get_target_y)
    }

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
        switch get_type
            {
            case "dock":
                {
                var shipyard_uuid = ds_get(get_node,"dock")
                var get_shipyard = entity_from_uuid(shipyard_uuid)
                
                get_dest_x = ds_get(get_shipyard,"x")
                get_dest_y = ds_get(get_shipyard,"y")
                
                draw_circle(get_dest_x,get_dest_y,4,false)
                break
                }
            case "target":
                {
                var get_target_uuid = ds_get(get_node,"target")
                var get_target_entity = entity_from_uuid(get_target_uuid)
                get_dest_x = ds_get(get_target_entity,"x")
                get_dest_y = ds_get(get_target_entity,"y")
                draw_set_color(c_red)
                draw_circle(get_dest_x,get_dest_y,64,true)
                break
                }
            case "checkpoint":
                {
                get_dest_x = ds_get(get_node,"x")
                get_dest_y = ds_get(get_node,"y")
                draw_rectangle(get_dest_x-16,get_dest_y-16,get_dest_x+16,get_dest_y+16,true)
                break
                }
            case "waypoint":
                {
                get_dest_x = ds_get(get_node,"x")
                get_dest_y = ds_get(get_node,"y")
                draw_circle(get_dest_x,get_dest_y,8,true)
                break
                }
            }
        

        //draw the line connecting the points
        draw_line(prev_x,prev_y,get_dest_x,get_dest_y)
        prev_x = get_dest_x
        prev_y = get_dest_y
        }
    draw_set_color(c_red)
    draw_text(get_x,get_y+40,"Autopilot")
    
    }
