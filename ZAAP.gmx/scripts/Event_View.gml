///Event_View()
if am_client()
    {
    //get the ship
    var get_ship_uuid = get("ship")
    if is_zero(get_ship_uuid)
        {
        //no ship controlled
        exit
        }
    
    var get_entity = entity_from_uuid(get_ship_uuid);
    if is_zero(get_entity) exit;
    var get_x = ds_get(get_entity,"x");
    var get_y = ds_get(get_entity,"y");
    view_center(get_x,get_y);
    
    if get("locked camera")
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
        set("entity focus",false)
        view_reset()
        }
    var entity_focus = get("entity focus")
    if entity_focus
        {//focus on this entity
        var get_entity = entity_from_uuid(entity_focus)
        if is_zero(get_entity)
            {
            set("entity focus",0)
            exit
            }
        
        var get_x = ds_get(get_entity,"x")
        var get_y = ds_get(get_entity,"y")
        view_center(get_x,get_y)
        }
    }


