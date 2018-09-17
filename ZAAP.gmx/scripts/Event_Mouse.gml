///Event_Mouse()



var done
//--------------------------------//

if mouse_check_button_released(mb_left)
    {
    //clear the selected element/entity
    ds_set(envar,"selected",false,key.value)
    }
if mouse_check_button(mb_left)
    {
    //get the element
    var get_target = ds_get(envar,"selected")
    show("get target is: " + string(get_target))
    if get_target
        {
        //if something is selected
        var click_x = ds_get(envar,"click x")
        var click_y = ds_get(envar,"click y")
        var drag_x = window_mouse_get_x() - click_x
        var drag_y = window_mouse_get_y() - click_y
        
        var target_x = ds_get(get_target,"x1")
        var target_y = ds_get(get_target,"y1")
        
        ds_set(get_target,"x1",target_x + drag_x,key.value)
        ds_set(get_target,"y1",target_y + drag_y,key.value)
        
        ds_set(envar,"click x",window_mouse_get_x(),key.value)
        ds_set(envar,"click y",window_mouse_get_y(),key.value)
        }
    }


if mouse_check_button_pressed(mb_left)
    {
    done = mouse_left_click_element()
    if done exit
    //
    //server only
    if am_server()
        {
        //do done checks
        done = mouse_left_click_entity_registry()
        if done exit
        //
        done = mouse_left_click_entity_server()
        if done exit
        //
        done = mouse_create()
        if done exit
        //
        effect_create_above(ef_firework,mouse_x,mouse_y,0,c_red)
        exit
        }
    //client only
    if am_client()
        {
        done = mouse_left_click_entity_registry()
        if done exit
        //
        done = mouse_left_click_ship_grid()
        if done exit
        }
    }

//--------------------------------//

if mouse_check_button_pressed(mb_right)
    {
    if am_server()
        {
        //
        done = mouse_right_click_delete_entity()
        if done exit
        //
        effect_create_above(ef_explosion,mouse_x,mouse_y,0,c_white)
        exit
        //
        }
    }
    
//--------------------------------//
