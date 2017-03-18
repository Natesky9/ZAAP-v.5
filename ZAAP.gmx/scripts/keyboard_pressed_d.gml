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
        var left = keyboard_check(ord('A'))
        if left
        entity_issue_command(get_ship,"steer",0)
        if not left
        entity_issue_command(get_ship,"steer",-1)
        }
    }
