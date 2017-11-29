///Draw_Debug()

if show_debug_data_structures
    {
    //draw the ping timeout
    Draw_Debug_Network()

    //draw the debug time    
    Draw_Debug_Step_Time()
        
    //draw the data structure amounts
    if not keyboard_check(vk_shift)
    Draw_Debug_DS_Amount()
    
    if keyboard_check(vk_shift)
        {
        //new debug draw
        //this one uses the envar
        //(environment variable) map
        //--------//    
        var key_list = get("key list")
        var envar_debug_size = ds_list_size(key_list)
        
        var envar_debug_x2 = window_get_width()
        var envar_debug_y2 = window_get_height()
        var envar_debug_x1 = envar_debug_x2-300
        var envar_debug_y1 = envar_debug_y2 - envar_debug_size*16
        
        //draw the general variable window
        draw_set_color(c_purple)
        draw_rectangle(envar_debug_x1,envar_debug_y1,envar_debug_x2,envar_debug_y2,false)
        draw_set_color(c_black)
        draw_rectangle(envar_debug_x1,envar_debug_y1,envar_debug_x2,envar_debug_y2,true)
        
        draw_set_color(c_black)
        var get_key,get_value,i,text
        for (i = 0;i < envar_debug_size;i += 1)
            {
            //start loop
            get_key = ds_list_find_value(key_list,i)
            switch get_key
                {
                //-----//
                default:
                    {
                    get_value = get(get_key)
                    
                    font_align(7)
                    draw_text(envar_debug_x1,envar_debug_y1 + 16*i,get_key)
                    font_align(9)
                    
                    text = get_value
                    if is_real(get_value)
                    text = string(get_value)
                    draw_text(envar_debug_x2,envar_debug_y1 + 16*i,text)
                    }
                //-----//
                }
            }
        }
    }
