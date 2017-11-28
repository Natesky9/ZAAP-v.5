///Draw_Nearby_Entities()

if not am_client()
exit

var range = 10000

var view_center_x = view_wview[0]/2
var view_center_y = view_hview[0]/2

var current_ship = get("ship")

if is_zero(current_ship)
return false

//draw nearby ships

var get_list = get(entity.ship)
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
        draw_text(line_start_x,line_start_y,string(get_distance))
        
        draw_set_alpha(1-(get_distance)/range + .1)
        draw_line_width(line_start_x,line_start_y,x_on_screen,y_on_screen,4)
        draw_set_alpha(1)
        //end drawing pointer
        }
    }
