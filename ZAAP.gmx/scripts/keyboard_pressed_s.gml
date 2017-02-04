if not keyboard_check_pressed(ord('S'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        packet_write(packet.issue_command,"brake",-1)
        }
    }
