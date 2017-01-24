if not am_server()
and not am_client()

exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_uuid = ds_list_find_value(entity_list,i)
    
    var get_entity = entity_from_uuid(get_uuid)
    
    //run if not undefined
    if get_entity != 0
        {
        
        var get_x = get_entity[? "x"]
        var get_y = get_entity[? "y"]
        var get_speed = get_entity[? "speed"]
        var get_direction = get_entity[? "direction"]
        
        var get_pilot = get_entity[? "pilot"]
        
        //draw the entity
        d3d_transform_add_translation(-get_x,-get_y,0)
        d3d_transform_add_rotation_z(get_direction-90)
        d3d_transform_add_translation(get_x,get_y,0)
        //ready to draw
        draw_set_colour(c_blue)
        draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,false)
        draw_set_colour(c_black)
        draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,true)
        
                //draw the pilot
        if get_pilot != 0
            {
            draw_set_color(c_green)
            draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,true)
            draw_set_color(c_black)
            draw_text(get_x,get_y+16,"[" + string(get_pilot) + "]")
            }
        
        //draw the id
        font_align(5)
        draw_set_color(c_black)
        draw_text(get_x,get_y,get_uuid)
        //end drawing the id
        
        //finished drawing
        d3d_transform_set_identity()
        //end drawing the entity
        

        

/*
        //draw thrust
        var get_thrust = get_entity[? "thrust"]
        draw_set_color(c_red)
        if get_thrust
        draw_set_color(c_green)
        draw_text(get_x,get_y+32,"[" + string(get_thrust) + "]")
        //end draw thrust
        
        //draw direction
        draw_set_color(c_aqua)
        var text = "(" + string(get_direction) + ")"
        draw_text(get_x,get_y+48,text)
*/
        }
    //end run if not undefined
    }
