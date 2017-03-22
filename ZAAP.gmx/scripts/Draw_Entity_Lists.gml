///Draw_Entity_Lists()

if not am_server()
and not am_client()
exit

if not draw_debug_entity_list
exit

var text_y
font_align(7)

var entity_count = ds_list_size(entity_list);
if not entity_count
exit

entity_list_x1 = 100
entity_list_y1 = 100
entity_list_x2 = entity_list_x1 + 400
entity_list_y2 = entity_list_y1 + entity_count * 16

mouse_in_list = false


//get the mouse position
var mouse_pos = entity_list_index_from_mouse()
if not is_zero(mouse_pos)
mouse_in_list = true
mouse_pos -= 1
//

//draw the box
if mouse_in_list
draw_set_colour(c_gray)
if not mouse_in_list
draw_set_color(c_aqua)
draw_rectangle(entity_list_x1,entity_list_y1,entity_list_x2,entity_list_y2,false)
draw_set_color(c_black)
draw_rectangle(entity_list_x1,entity_list_y1,entity_list_x2,entity_list_y2,true)


for (var i = 0;i < entity_count;i += 1)
    {
    var get_uuid = ds_list_find_value(entity_list,i)
    
    text_y = entity_list_y1 + i * 16
    
    if i == mouse_pos
        {
        draw_set_color(c_blue)
        draw_rectangle(entity_list_x1,text_y,entity_list_x2,text_y+16,false)
        }
    draw_set_color(c_black)
    draw_text(entity_list_x1 + (i==mouse_pos)*4,text_y,"[" + string(get_uuid) + "]")
    }
//
//we're done drawing the list
//


//draw the selected entity

if not is_zero(entity_focus)
    {
    var get_entity = entity_from_uuid(entity_focus)
    var key_list = ds_get(get_entity,"key list")
    var entity_list_size = ds_list_size(key_list)
    
    var key_list_x1 = entity_list_x2
    var key_list_y1 = entity_list_y1
    var key_list_x2 = key_list_x1 + 200
    var key_list_y2 = key_list_y1 + entity_list_size*16
    
    draw_set_color(c_aqua)
    draw_rectangle(key_list_x1,key_list_y1,key_list_x2,key_list_y2,false)
    
    draw_set_color(c_black)
    var get_key,get_value,i,text
    for (i = 0;i < entity_list_size;i += 1)
        {
        get_key = ds_list_find_value(key_list,i)
        switch get_key
            {
            case "grid":
                {
                //draw the grid
                var get_grid = ds_get(get_entity,"grid")
                var grid_width = ds_grid_width(get_grid)
                var grid_height = ds_grid_height(get_grid)
                draw_set_color(c_black)      
                font_align(7)
                draw_text(key_list_x1,key_list_y1 + 16*i,get_key)
                font_align(9)
                draw_text(key_list_x2,key_list_y1 + 16*i,"->")
                
                var key_list_grid_x1 = key_list_x2
                var key_list_grid_y1 = key_list_y1
                var key_list_grid_x2 = key_list_grid_x1 + grid_width*ship_grid_size
                var key_list_grid_y2 = key_list_grid_y1 + grid_height*ship_grid_size
                draw_set_color(c_gray)
                draw_rectangle(key_list_grid_x1,key_list_grid_y1,key_list_grid_x2,key_list_grid_y2,false)
                draw_set_color(c_black)
                draw_rectangle(key_list_grid_x1,key_list_grid_y1,key_list_grid_x2,key_list_grid_y2,true)
                font_align(7)
                for (var w = 0;w < grid_width;w += 1)
                    {
                    for (var h = 0;h < grid_height;h += 1)
                        {
                        var get_grid_value = ds_grid_get(get_grid,w,h)
                        var g_x1 = key_list_grid_x1 + w * ship_grid_size
                        var g_y1 = key_list_grid_y1 + h * ship_grid_size
                        var g_x2 = g_x1 + ship_grid_size
                        var g_y2 = g_y1 + ship_grid_size
                        var grid_color = grid_value_to_color(get_grid_value)
                        if not is_zero(grid_color)
                            {
                            draw_set_color(grid_color)
                            draw_rectangle(g_x1,g_y1,g_x2,g_y2,false)
                            }
                        draw_set_color(c_black)
                        draw_text(g_x1,g_y1,string(get_grid_value))
                        }
                    }
                break
                }
            default:
                {
                get_value = ds_get(get_entity,get_key)
                
                font_align(7)
                draw_text(key_list_x1,key_list_y1 + 16*i,get_key)
                font_align(9)
                
                text = get_value
                if is_real(get_value)
                text = string(get_value)
                
                
                draw_text(key_list_x2,key_list_y1 + 16*i,text)
                }
            }
        }
    }
