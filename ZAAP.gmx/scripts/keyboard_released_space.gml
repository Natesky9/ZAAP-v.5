///keyboard_released_space()

if not keyboard_check_released(vk_space)
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        entity_issue_command(get_ship,"trigger",false)
        }
    }