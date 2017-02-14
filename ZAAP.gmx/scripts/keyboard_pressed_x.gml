if not keyboard_check_pressed(ord('X'))
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship)
    exit
    var get_uuid = uuid_from_entity(get_ship)
    
    var get_x = ds_get(get_ship,"x")
    var get_y = ds_get(get_ship,"y")
    
    var nearest_shipyard = entity_find_nearest(entity.shipyard,get_x,get_y,get_uuid)
    if is_zero(nearest_shipyard)
    exit
    
    var get_shipyard_x = ds_get(nearest_shipyard,"x")
    var get_shipyard_y = ds_get(nearest_shipyard,"y")
    
    autopilot_start(get_uuid,get_shipyard_x,get_shipyard_y)
    
    }
