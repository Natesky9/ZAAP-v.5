if not keyboard_check_released(ord('A'))
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        var right = keyboard_check(ord('D'))
        if right
        packet_write(packet.issue_command,"steer",-1)
        if not right
        packet_write(packet.issue_command,"steer",0)
        }
    }
