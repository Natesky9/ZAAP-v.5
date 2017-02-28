if not keyboard_check_pressed(ord('A'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        var right = keyboard_check(ord('D'))
        if right
        entity_issue_command(get_ship,"steer",0)
        if not right
        entity_issue_command(get_ship,"steer",+1)
        }
    }
//
if am_server()
    {
    //create an asteroid
    var get_uuid = entity_create_advanced(mouse_x,mouse_y,entity.asteroid)
    var get_entity = entity_from_uuid(get_uuid)
    ds_set(get_entity,"speed",irandom(6))
    ds_set(get_entity,"direction",irandom(360))
    packet_write(packet.entity_create,get_uuid,mouse_x,mouse_y)
    //create an asteroid
    }
