///Draw_Entity_Item(entity)

var get_entity = argument0

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_heading = ds_get(get_entity,"heading")
var get_id = ds_get(get_entity,"id")

if is_between(get_id,item.rockred,item.rockblue)
    {
    draw_entity_item_rock(get_entity,get_x,get_y,get_heading,get_id)
    exit
    }
if is_between(get_id,item.orered,item.gemblue)
    {
    draw_entity_item_ore(get_entity,get_x,get_y,get_heading,get_id)
    //draw_circle(get_x,get_y,16,false)
    exit
    }
/*
switch get_id
    {
    case item.redrock:
        {
        draw_set_color(c_red)
        draw_circle(get_x,get_y,8,false)
        break
        }
    //
    case item.greenrock:
        {
        draw_set_color(c_green)
        draw_circle(get_x,get_y,8,false)
        break
        }
    //
    case item.bluerock:
        {

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
*/
