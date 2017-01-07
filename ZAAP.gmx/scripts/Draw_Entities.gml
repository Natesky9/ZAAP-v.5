if not am_server()
and not am_client()

exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_entity = ds_list_find_value(entity_list,i)
    
    var get_x = ds_map_find_value(get_entity,"x")
    var get_y = ds_map_find_value(get_entity,"y")
    
    var get_name
    if am_client()
    get_name = ds_map_find_value(get_entity,"ssn")
    if am_server()
    get_name = get_entity
    
    //draw the entity
    draw_set_colour(c_blue)
    draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,false)
    draw_set_colour(c_black)
    draw_rectangle(get_x-16,get_y-16,get_x+16,get_y+16,true)
    
    //draw the id
    font_align(5)
    draw_set_color(c_black)
    draw_text(get_x,get_y,get_name)
    
    //draw the pilot
    draw_set_color(c_green)
    var get_pilot = ds_map_find_value(get_entity,"pilot")
    if get_pilot != undefined
        {
        draw_text(get_x,get_y+16,"[" + string(get_pilot) + "]")
        }
    }
