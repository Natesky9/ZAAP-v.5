///Event_View()
if am_client()
    {
    //get the ship
    var get_entity = my_ship()
    if is_zero(get_entity)
        {
        console_add("no ship to view")
        //no ship controlled
        exit
        }
    
    var get_x = ds_get(get_entity,"x");
    var get_y = ds_get(get_entity,"y");
    view_center(get_x,get_y);
    
    if ds_get(envar,"locked camera")
        {
        var get_heading = ds_get(get_entity,"heading");
        view_angle[0] = -get_heading+90;
        }
    else
        {
        view_angle[0] = 0
        }
    
    //
    }

if am_server()
    {
    if keyboard_check(vk_f2)
        {//reset the focus if F2 is pressed
        ds_set(envar,"entity focus",false,key.value)
        view_reset()
        }
    var entity_focus = ds_get(envar,"entity focus")
    if entity_focus
        {//focus on this entity
        var get_entity = entity_from_uuid(entity_focus)
        if is_zero(get_entity)
            {
            ds_set(envar,"entity focus",0,key.value)
            exit
            }
        
        var get_x = ds_get(get_entity,"x")
        var get_y = ds_get(get_entity,"y")
        view_center(get_x,get_y)
        }
    }


