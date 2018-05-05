///keyboard_released_e()

if not keyboard_check_released(ord('E'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = my_ship()
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        entity_issue_command(get_ship,"thrust",false)
        }
    }
