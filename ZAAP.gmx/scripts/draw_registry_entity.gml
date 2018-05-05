///draw_registry_entity(x1,y1,x2,y2,type,entity)
//draw the registry entity list
//if there is a list selected
var entity_x1 = argument0
var entity_y1 = argument1
var entity_x2 = argument2
var entity_y2 = argument3
var selected_type = argument4
var selected_entity = argument5

if not is_zero(selected_type)
    {
    var get_list = entity_list(selected_type)
    var entity_count = ds_list_size(get_list)
    
    //update positions of the list
    entity_registry_entity_update(get_list,entity_count)
    
    //draw the general entity window
    draw_set_color(c_aqua)
    draw_rectangle(entity_x1,entity_y1,entity_x2,entity_y2,false)
    draw_set_color(c_black)
    draw_rectangle(entity_x1,entity_y1,entity_x2,entity_y2,true)
    
    draw_set_color(c_black)
    for (var i = 0;i < entity_count;i += 1)
        {
        var get_uuid = ds_list_find_value(get_list,i)
        if get_uuid == selected_entity
            {
            draw_set_color(c_blue)
            draw_rectangle(entity_x1,entity_y1+i*16,
            entity_x2,entity_y1+i*16+16,false)
            draw_set_color(c_black)
            draw_rectangle(entity_x1,entity_y1+i*16,
            entity_x2,entity_y1+i*16+16,true)
            }
        draw_text(entity_x1,entity_y1 + 16*i,string(get_uuid))
        }
    }
//end entity window

