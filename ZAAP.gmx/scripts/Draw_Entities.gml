if not am_server()
and not am_client()

exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_uuid = ds_list_find_value(entity_list,i)
    
    var get_entity = entity_from_uuid(get_uuid)
    
    //run if not undefined
    if !is_undefined(get_entity)
        {
        
        var get_x = ds_map_find_value(get_entity,"x")
        var get_y = ds_map_find_value(get_entity,"y")
        
        //draw the entity
        draw_set_colour(c_blue)
        draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,false)
        draw_set_colour(c_black)
        draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,true)
        
        //draw the id
        font_align(5)
        draw_set_color(c_black)
        draw_text(get_x,get_y,get_uuid)
        
        //draw the pilot
        draw_set_color(c_green)
        var get_pilot = ds_map_find_value(get_entity,"pilot")
        if get_pilot != undefined
            {
            draw_text(get_x,get_y+16,"[" + string(get_pilot) + "]")
            }
        }
    //end run if not undefined
    }
