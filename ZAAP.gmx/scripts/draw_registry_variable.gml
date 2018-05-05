///draw_registry_variable(x1,y1,x2,y2,entity,variable)
//draw the registry variable list
var variable_x1 = argument0
var variable_y1 = argument1
var variable_x2 = argument2
var variable_y2 = argument3
var selected_uuid = argument4
var selected_variable = argument5

//draw the entity variables
if not is_zero(selected_uuid)
    {
    var get_entity = entity_from_uuid(selected_uuid)
    //if the entity doesn't exist anymore, exit
    if is_zero(get_entity)
        {
        set("selected entity",false)
        //show("Selected entity destroyed, resetting selection")
        exit
        }
    
    var key_list = ds_get(get_entity,"key list")
    var key_list_size = ds_list_size(key_list)

    
    //draw the general variable window
    draw_set_color(c_purple)
    draw_rectangle(variable_x1,variable_y1,variable_x2,variable_y2,false)
    draw_set_color(c_black)
    draw_rectangle(variable_x1,variable_y1,variable_x2,variable_y2,true)
    
    draw_set_color(c_black)
    var get_key,get_value,i,text
    for (i = 0;i < key_list_size;i += 1)
        {
        //start loop
        //--------------------------------//
        get_key = ds_list_find_value(key_list,i)
        //draw the variable
        
        if i == selected_variable-1
            {
            show("true")
            draw_set_color(c_blue)
            draw_rectangle(variable_x1,variable_y1+16*i,variable_x2,variable_y1+16*i+16,false)
            draw_set_color(c_black)
            draw_rectangle(variable_x1,variable_y1+16*i,variable_x2,variable_y1+16*i+16,true)
            }
                        
        draw_set_color(c_black)
        font_align(7)
        draw_text(variable_x1,variable_y1 + 16*i,get_key)
        
        font_align(9)
        
        switch get_key
            {
            case "inventory":
                {
                if i == selected_variable-1
                    {
                    draw_text(variable_x2,variable_y1 + 16*i,"->")
                    }
                else
                draw_text(variable_x2,variable_y1 + 16*i,"[|]")
                break
                }
            case "grid":
                {
                if i == selected_variable-1
                    {
                    draw_text(variable_x2,variable_y1 + 16*i,"->")
                    }
                else
                draw_text(variable_x2,variable_y1 + 16*i,"[\#]")
                break
                }
            case "vertex buffer":
                {
                draw_text(variable_x2,variable_y1 + 16*i,"x")
                break
                }
            default:
                {
                get_value = ds_get(get_entity,get_key)
                draw_text(variable_x2,variable_y1 + 16*i,string(get_value))
                }
            }
        
        
        //end loop
        //--------------------------------//
        }
    }

