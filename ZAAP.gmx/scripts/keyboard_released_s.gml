///keyboard_released_s()

if not keyboard_check_released(ord('S'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        var right = keyboard_check(ord('F'))
        if right
        entity_issue_command(get_ship,"steer",-1)
        if not right
        entity_issue_command(get_ship,"steer",0)
        }
    }
