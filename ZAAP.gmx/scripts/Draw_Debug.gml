if show_debug_data_structures
    {
    font_align(1)
    draw_set_color(c_ltgray)
    draw_rectangle(room_width,room_height,room_width-200,room_height-16*6,false)
    draw_set_color(c_dkgray)
    draw_rectangle(room_width,room_height,room_width-200,room_height-16*6,true)
    
    draw_set_color(c_blue)
    draw_text(room_width-200,room_height-0,"grid[" + string(data_structure_grid_amount) + "]")
    draw_set_color(c_blue)
    draw_text(room_width-200,room_height-16,"list[" + string(data_structure_list_amount) + "]")
    draw_set_color(c_blue)
    draw_text(room_width-200,room_height-32,"map[" + string(data_structure_map_amount) + "]")
    draw_set_color(c_blue)
    draw_text(room_width-200,room_height-48,"priority[" + string(data_structure_priority_amount) + "]")
    draw_set_color(c_blue)
    draw_text(room_width-200,room_height-64,"queue[" + string(data_structure_queue_amount) + "]")
    draw_set_color(c_blue)
    draw_text(room_width-200,room_height-80,"stack[" + string(data_structure_stack_amount) + "]")
    }
