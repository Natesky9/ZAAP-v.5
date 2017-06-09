///Draw_Entity_Lists()

if not am_server()
and not am_client()
exit
//--------------------------------//
//draw the debug list
if show_debug_entity_list
    {
    var selected_entity_type = ds_get(envar,"selected entity type")
    var selected_entity = ds_get(envar,"selected entity")
    var selected_variable = ds_get(envar,"selected variable")
    
    var text_y
    font_align(7)
    
    entity_list_update_position()
    
    //entity types box
    var entity_list_x1 = ds_get(envar,"entity_list_x1")
    var entity_list_y1 = ds_get(envar,"entity_list_y1")
    var entity_list_x2 = ds_get(envar,"entity_list_x2")
    var entity_list_y2 = ds_get(envar,"entity_list_y2")
    //end entity types
    
    //entity specific box
    var entity_specific_list_x1 = ds_get(envar,"entity_specific_list_x1")
    var entity_specific_list_y1 = ds_get(envar,"entity_specific_list_y1")
    var entity_specific_list_x2 = ds_get(envar,"entity_specific_list_x2")
    var entity_specific_list_y2 = ds_get(envar,"entity_specific_list_y2")
    //end entity specific box
    
    //draw the general entity types
    for (var i = 1;i < entity.types;i += 1)
        {
        draw_set_color(c_white)
        if i == selected_entity_type
        draw_set_color(c_gray)
        draw_rectangle(entity_list_x1,entity_list_y1+i*32-32,entity_list_x2,entity_list_y1+i*32,false)
        draw_set_color(c_black)
        draw_text(entity_list_x1,entity_list_y1+i*32-32,string(i))
        var text = localized_entity_name[? i]
        draw_text(entity_list_x1 + 20,entity_list_y1+i*32-32,text)
        }
    //--------------------------------//
    //if there is a list selected
    if not is_zero(selected_entity_type)
        {
        var get_list = ds_get(envar,selected_entity_type)
        var entity_count = ds_list_size(get_list)
        
        //update positions of the list
        entity_specific_list_update_position(get_list,entity_count)
        
        //draw the general entity window
        draw_set_color(c_aqua)
        draw_rectangle(entity_specific_list_x1,entity_specific_list_y1,entity_specific_list_x2,entity_specific_list_y2,false)
        draw_set_color(c_black)
        draw_rectangle(entity_specific_list_x1,entity_specific_list_y1,entity_specific_list_x2,entity_specific_list_y2,true)
        
        draw_set_color(c_black)
        for (var i = 0;i < entity_count;i += 1)
            {
            var get_uuid = ds_list_find_value(get_list,i)
            if get_uuid == selected_entity
                {
                draw_set_color(c_blue)
                draw_rectangle(entity_specific_list_x1,entity_specific_list_y1+i*16,
                entity_specific_list_x2,entity_specific_list_y1+i*16+16,false)
                draw_set_color(c_black)
                draw_rectangle(entity_specific_list_x1,entity_specific_list_y1+i*16,
                entity_specific_list_x2,entity_specific_list_y1+i*16+16,true)
                }
            draw_text(entity_specific_list_x1,entity_specific_list_y1 + 16*i,string(get_uuid))
            }
        }
    //end entity window
    //--------------------------------//
    //draw the entity variables
    if not is_zero(selected_entity)
        {
        var get_entity = entity_from_uuid(selected_entity)
        //if the entity doesn't exist anymore, exit
        if is_zero(get_entity)
            {
            ds_set(envar,"selected entity",false)
            show("Selected entity destroyed, resetting selection")
            exit
            }
        
        var key_list = ds_get(get_entity,"key list")
        var key_list_size = ds_list_size(key_list)
        
        var key_list_x1 = entity_specific_list_x2
        var key_list_y1 = entity_specific_list_y1
        var key_list_x2 = key_list_x1 + 200
        var key_list_y2 = key_list_y1 + key_list_size*16
        
        //draw the general variable window
        draw_set_color(c_purple)
        draw_rectangle(key_list_x1,key_list_y1,key_list_x2,key_list_y2,false)
        draw_set_color(c_black)
        draw_rectangle(key_list_x1,key_list_y1,key_list_x2,key_list_y2,true)
        
        draw_set_color(c_black)
        var get_key,get_value,i,text
        for (i = 0;i < key_list_size;i += 1)
            {
            //start loop
            get_key = ds_list_find_value(key_list,i)
            switch get_key
                {
                //-----//
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
                    
                    //draw the grid window
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
                    //end drawing the grid window
                    break
                    }
                //-----//
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
                //-----//
                }
            //end loop
            }
        }
    //end variable window
    //--------------------------------//
    }
//end list window    
//--------------------------------//
