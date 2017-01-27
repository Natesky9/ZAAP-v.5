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



if keyboard_check(vk_f2)
view_reset()
