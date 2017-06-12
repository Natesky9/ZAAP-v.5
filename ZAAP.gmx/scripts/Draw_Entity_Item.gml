///Draw_Entity_Item(entity)

var get_entity = argument0

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_id = ds_get(get_entity,"id")

switch get_id
    {
    case item.triangle:
        {
        draw_set_color(c_red)
        draw_circle(get_x,get_y,8,false)
        break
        }
    //
    case item.circle:
        {
        draw_set_color(c_green)
        draw_circle(get_x,get_y,8,false)
        break
        }
    //
    case item.square:
        {
        var get_heading = ds_get(get_entity,"heading")
        d3d_transform_add_rotation_z(get_heading-90)
        d3d_transform_add_translation(get_x,get_y,0)
        draw_set_color(c_blue)
        draw_rectangle(-16,-16,16,16,false)
        d3d_transform_set_identity()
        break
        }
    //
    default:
        {
        var get_pickup_timer = ds_get(get_entity,"pickup timer")
        
        draw_set_alpha(cos(get_pickup_timer))
        draw_set_color(c_black)
        draw_rectangle(get_x-8,get_y-8,get_x+8,get_y+8,true)
        draw_set_alpha(1)
        
        font_align(5)
        draw_text(get_x,get_y,"item")
        }
    //
    }
