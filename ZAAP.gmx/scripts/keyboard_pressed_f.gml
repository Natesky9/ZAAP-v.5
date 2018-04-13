///keyboard_pressed_f()

if not keyboard_check_pressed(ord('F'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = my_ship()
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        var left = keyboard_check(ord('S'))
        if left
        entity_issue_command(get_ship,"steer",0)
        if not left
        entity_issue_command(get_ship,"steer",-1)
        }
    }
