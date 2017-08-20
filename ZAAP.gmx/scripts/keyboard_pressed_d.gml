///keyboard_pressed_d()

if not keyboard_check_pressed(ord('D'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        entity_issue_command(get_ship,"brake",1)
        }
    }
if am_server()
    {
    var get_uuid = entity_create_server(mouse_x,mouse_y,entity.item)
    var get_entity = entity_from_uuid(get_uuid)
    ds_set(get_entity,"speed",irandom(4))
    ds_set(get_entity,"direction",irandom(360))
    ds_set(get_entity,"heading",irandom(360))
    //packet_entity_create
    packet_write(packet.entity_create,get_uuid,mouse_x,mouse_y)
    }
