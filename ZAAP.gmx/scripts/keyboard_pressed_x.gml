///keyboard_pressed_x()

if not keyboard_check_pressed(ord('X'))
exit

if am_client()
    {
    //console_add("Started Autopilot")
    var get_ship = my_ship()
    var get_uuid = uuid_from_entity(get_ship)
    if is_zero(get_ship)
        {
        console_add("no ship, autopilot canceled")
        exit
        }
    
    var docked = entity_is_docked(get_ship)
    
    if docked
        {
        //packet_entity_undock
        packet_write(packet.entity_undock,get_uuid,docked)
        exit
        }
    var get_x = ds_get(get_ship,"x")
    var get_y = ds_get(get_ship,"y")
    var nearest = entity_find_nearest(entity.shipyard,get_x,get_y,false)
    var other_uuid = uuid_from_entity(nearest)
    
    if not nearest
        {
        show("no shipyard nearby to pair to! #keyboard_pressed_x")
        exit
        }
    var distance = entity_distance(get_ship,nearest)
    console_add("distance to shipyard: " + string(distance))
    
    if distance < 128
        {
        //packet_entity_dock
        packet_write(packet.entity_dock,get_uuid,other_uuid)
        }
    }
