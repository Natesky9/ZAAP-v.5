if am_client()
    {
    //
    var get_map = socket_map[? SSS]
    if get_map == 0
    or get_map == undefined
    exit
    var get_ship_uuid = get_map[? "ship"]
    if get_ship_uuid == 0
    exit
    
        {
        var get_entity = entity_map[? get_ship_uuid]
        var get_x = get_entity[? "x"]
        var get_y = get_entity[? "y"]
        view_center(get_x,get_y)
        }
    //
    }



if keyboard_check(vk_space)
view_reset()
