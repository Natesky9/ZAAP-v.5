///keyboard_released_f()

if not keyboard_check_released(ord('F'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(get("SSS"))
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        var left = keyboard_check(ord('S'))
        if left
        entity_issue_command(get_ship,"steer",+1)
        if not left
        entity_issue_command(get_ship,"steer",0)
        }
    }
