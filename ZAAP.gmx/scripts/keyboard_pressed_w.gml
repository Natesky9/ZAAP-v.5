if not keyboard_check_pressed(ord('W'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship) exit
    
    packet_write(packet.issue_command,"thrust",true)
    }
