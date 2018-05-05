///Draw_Entity_Lists()

if not am_server()
and not am_client()
exit
//--------------------------------//
//draw the debug list
if show_entity_registry
    {
    var selected_entity_type = get("selected type")
    var selected_entity = get("selected entity")
    var selected_variable = get("selected variable")
    
    var text_y
    font_align(7)
    
    entity_registry_update()
    
    //entity types box
    var type_x1 = get("entity_registry_type_x1")
    var type_y1 = get("entity_registry_type_y1")
    var type_x2 = get("entity_registry_type_x2")
    var type_y2 = get("entity_registry_type_y2")
    //end entity types
    
    //entity specific box
    var entity_x1 = get("entity_registry_entity_x1")
    var entity_y1 = get("entity_registry_entity_y1")
    var entity_x2 = get("entity_registry_entity_x2")
    var entity_y2 = get("entity_registry_entity_y2")
    //end entity specific box
    
    //draw the general entity types
    for (var i = 1;i <= entity.types;i += 1)
        {
        draw_set_color(c_white)
        if i == selected_entity_type
        draw_set_color(c_gray)
        draw_rectangle(type_x1,type_y1+i*32-32,type_x2,type_y1+i*32,false)
        draw_set_color(c_black)
        draw_text(type_x1,type_y1+i*32-32,string(i))
        //get the name of the entity type
        var text = name_from_type(i)
        draw_text(type_x1 + 20,type_y1+i*32-32,text)
        }
    //--------------------------------//
    //if there is a list selected
    if not is_zero(selected_entity_type)
        {
        var get_list = entity_list(selected_entity_type)
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
    //--------------------------------//
    //draw the entity variables
    if not is_zero(selected_entity)
        {
        var get_entity = entity_from_uuid(selected_entity)
        //if the entity doesn't exist anymore, exit
        if is_zero(get_entity)
            {
            set("selected entity",false)
            //show("Selected entity destroyed, resetting selection")
            exit
            }
        
        var key_list = ds_get(get_entity,"key list")
        var key_list_size = ds_list_size(key_list)
        
        var key_list_x1 = entity_x2
        var key_list_y1 = entity_y1
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
            //--------------------------------//
            get_key = ds_list_find_value(key_list,i)
            if get_key == selected_variable
                {
                font_align(9)
                draw_text(key_list_x2,key_list_y1 + 16*i,"->")
                }
            //draw the variable
                            
            draw_set_color(c_black)      
            font_align(7)
            draw_text(key_list_x1,key_list_y1 + 16*i,get_key)
            //end loop
            //--------------------------------//
            }
        }
    
    if not is_zero(selected_variable)
        {
        
        switch selected_variable
            {
            //-----//
            case "inventory":
                {
                var get_inventory = ds_get(get_entity,"inventory")
                if is_zero(get_inventory)
                    {
                    show("no inventory!")
                    break
                    }
                var get_inventory_size = ds_list_size(get_inventory)
                
                var key_list_inventory_x1 = key_list_x2
                var key_list_inventory_y1 = key_list_y1
                var key_list_inventory_x2 = key_list_inventory_x1 + 100
                var key_list_inventory_y2 = key_list_inventory_y1 + get_inventory_size*16
                draw_set_color(c_aqua)
                draw_rectangle(key_list_inventory_x1,key_list_inventory_y1,
                    key_list_inventory_x2,key_list_inventory_y2,false)
                draw_set_color(c_black)
                draw_rectangle(key_list_inventory_x1,key_list_inventory_y1,
                    key_list_inventory_x2,key_list_inventory_y2,true)
                
                font_align(7)
                var j,get_value,text_y
                for (j = 0;j < get_inventory_size;j += 1)
                    {
                    show("j is: " + string(j))
                    get_value = ds_list_find_value(get_inventory,j)
                    text_y = key_list_inventory_y1 + j*16
                    draw_text(key_list_inventory_x1,text_y,string(get_value))
                    }
                break
                }
            //-----//
            case "grid":
                {
                //draw the grid
                var get_grid = grid_from_entity(get_entity)
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
        }
    //end variable window
    //--------------------------------//
    }
//end list window    
//--------------------------------//
