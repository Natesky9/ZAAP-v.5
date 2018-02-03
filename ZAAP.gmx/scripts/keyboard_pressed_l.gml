///keyboard_pressed_l()

if not keyboard_check_pressed(ord('L'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var myship = get("ship")
    if is_zero(myship)
        {
        show("error, no ship")
        exit
        }
    var get_entity = entity_from_uuid(myship)
    var get_x = ds_get(get_entity,"x")
    var get_y = ds_get(get_entity,"y")
    var nearest_entity = entity_find_nearest(entity.item,get_x,get_y,false)
    
    
    if not nearest_entity
        {
        show("no entities nearby")
        exit
        }
    
    var nearest_x = ds_get(nearest_entity,"x")
    var nearest_y = ds_get(nearest_entity,"y")
    
    var distance = point_distance(get_x,get_y,nearest_x,nearest_y)
    
    if distance > 1000
        {
        show("no entities nearby")
        exit
        }
    
    effect_create_above(ef_ring,nearest_x,nearest_y,0,c_black)
    
    var nearest_uuid = uuid_from_entity(nearest_entity)
    show("tractoring uuid: " + string(nearest_uuid))
    
    //packet_collect_item
    packet_write(packet.collect_item,myship,nearest_uuid)
    }

if am_server()
    {

    }
