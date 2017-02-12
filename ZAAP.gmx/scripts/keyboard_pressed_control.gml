if not keyboard_check_pressed(vk_control)
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if not is_zero(get_ship)
    exit
    
    var view_center_x = view_xview[0] + view_wview[0]/2
    var view_center_y = view_yview[0] + view_hview[0]/2
    packet_write(packet.entity_create,view_center_x,view_center_y)
    exit
    }
