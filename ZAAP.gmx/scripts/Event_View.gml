///Event_View()
if am_client()
    {
    //
    var get_map = map_from_socket(SSS)
    if is_zero(get_map) exit
    var get_ship_uuid = ds_get(get_map,"ship")
    if is_zero(get_ship_uuid) exit
    
        {
        var get_entity = entity_from_uuid(get_ship_uuid)
        if is_zero(get_entity) exit
        var get_x = ds_get(get_entity,"x")
        var get_y = ds_get(get_entity,"y")
        view_center(get_x,get_y)
        }
    //
    }

if am_server()
    {
    if keyboard_check(vk_f2)
        {//reset the focus if F2 is pressed
        entity_focus = 0
        view_reset()
        }
    if entity_focus
        {//focus on this entity
        var get_entity = entity_from_uuid(entity_focus)
        if is_zero(get_entity)
            {
            entity_focus = 0
            exit
            }
        
        var get_x = ds_get(get_entity,"x")
        var get_y = ds_get(get_entity,"y")
        view_center(get_x,get_y)
        }
    }


