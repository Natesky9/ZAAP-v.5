if show_debug_data_structures
    {
    
    var view_width = view_wview[0]
    var view_height = view_hview[0]
    if SSS != -1
        {
        
        draw_set_color(c_black)
        draw_set_alpha(1)
        font_align(6)
        var get_map = ds_get(socket_map,SSS)
        if is_zero(get_map) exit
        var get_ping_timeout = ds_get(get_map,"ping timeout")
        var get_text = "until timeout: " + string(get_ping_timeout)
        draw_text(view_width-20,200,get_text)
        }
    
    
    font_align(1)
    draw_set_color(c_ltgray)
    draw_rectangle(view_width,view_height,view_width-200,view_height-16*6,false)
    draw_set_color(c_dkgray)
    draw_rectangle(view_width,view_height,view_width-200,view_height-16*6,true)
    
    draw_set_color(c_blue)
    draw_text(view_width-200,view_height-0,"grid[" + string(data_structure_grid_amount) + "]")
    draw_set_color(c_blue)
    draw_text(view_width-200,view_height-16,"list[" + string(data_structure_list_amount) + "]")
    draw_set_color(c_blue)
    draw_text(view_width-200,view_height-32,"map[" + string(data_structure_map_amount) + "]")
    draw_set_color(c_blue)
    draw_text(view_width-200,view_height-48,"priority[" + string(data_structure_priority_amount) + "]")
    draw_set_color(c_blue)
    draw_text(view_width-200,view_height-64,"queue[" + string(data_structure_queue_amount) + "]")
    draw_set_color(c_blue)
    draw_text(view_width-200,view_height-80,"stack[" + string(data_structure_stack_amount) + "]")
    }
