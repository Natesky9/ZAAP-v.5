for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_entity = ds_list_find_value(entity_list,i)
    
    var get_x = ds_map_find_value(get_entity,"x")
    var get_y = ds_map_find_value(get_entity,"y")
    
    //draw the entity
    draw_set_colour(c_blue)
    draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,false)
    draw_set_colour(c_black)
    draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,true)
    
    }
