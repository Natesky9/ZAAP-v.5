///Draw_Nearby_Entities()

if not am_client()
exit

var view_center_x = view_wview[0]/2
var view_center_y = view_hview[0]/2
var range

var current_ship = get_ship_from_socket(get("SSS"))//get("ship")

if is_zero(current_ship)
return false

show("ran #Draw_Nearby_Entities")

range = 100
color = c_black
draw_set_alpha(1)

//draw nearby entities
for (i = entity.types-1;i > 0;i -= 1)
    {
    switch i
        {
        case entity.item:
            {
            range = 1000
            color = c_blue
            break
            }
        case entity.bullet:
            {
            continue
            }
        case entity.asteroid:
            {
            range = 10000
            color = c_dkgray
            break
            }
        case entity.ship:
            {
            range = 10000
            color = c_green
            break
            }
        case entity.shipyard:
            {
            range = 100000
            color = c_purple
            break
            }
        default:
            {
            continue
            }
        }
    
    
    
    var get_list = entity_list(i)
    if is_zero(get_list)
        {
        console_add("error, no entity list")
        return false
        }
    
    for (var ii = 0;ii < ds_list_size(get_list);ii += 1)
        {
        var get_uuid = ds_list_find_value(get_list,ii)
        var get_entity = entity_from_uuid(get_uuid)
        var get_type = ds_get(get_entity,"type")
        
        
        var get_x = ds_get(get_entity,"x")
        var get_y = ds_get(get_entity,"y")
        
        var x_on_screen = get_x - view_xview[0]
        var y_on_screen = get_y - view_yview[0]
        
        var is_in_view =
            ((x_on_screen > 0) and (x_on_screen < view_wview[0])
        and (y_on_screen > 0) and (y_on_screen < view_hview[0]))
        
        var is_in_range =
            ((x_on_screen > -range) and (x_on_screen < view_wview[0] +range)
        and (y_on_screen > -range) and (y_on_screen < view_hview[0] +range))
        
        if is_in_view
            {
            //nothing yet
            continue
            }
        if not is_in_view
        and is_in_range
            {
            //draw a pointer
            var get_direction = point_direction(view_center_x,view_center_y,
                                                x_on_screen,y_on_screen)
            var get_distance = point_distance(view_center_x,view_center_y,
                                                x_on_screen,y_on_screen)
            var line_start_x = view_center_x + lengthdir_x(256,get_direction)
            var line_start_y = view_center_y + lengthdir_y(256,get_direction)
            //var line_start_x = view_center_x + lengthdir_x(256,get_direction)
            //var line_start_y = view_center_y + lengthdir_y(256,get_direction)
            
            draw_set_color(color)
            draw_text(line_start_x,line_start_y,string(get_distance))
            
            //draw_set_alpha(1-(get_distance)/range + .1)
            draw_line_width(line_start_x,line_start_y,x_on_screen,y_on_screen,4)
            //draw_set_alpha(1)
            //end drawing pointer
            }
        }
    }
