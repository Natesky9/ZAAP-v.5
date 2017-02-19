if not keyboard_check_pressed(ord('W'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship)
        {
        console_add("You don't have a ship! Press Control to make one")
        exit
        }
    var brake = keyboard_check(ord('S'))
    if brake
    entity_issue_command(get_ship,"brake",false)
    
    entity_issue_command(get_ship,"thrust",true)
    }
