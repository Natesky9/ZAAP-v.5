if not keyboard_check_released(ord('D'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        var left = keyboard_check(ord('A'))
        if left
        packet_write(packet.issue_command,"steer",+1)
        if not left
        packet_write(packet.issue_command,"steer",0)
        }
    }
