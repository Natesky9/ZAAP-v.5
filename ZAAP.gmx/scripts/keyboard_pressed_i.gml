///keyboard_pressed_i()

if not keyboard_check_pressed(ord('i'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = my_ship()
    if is_zero(get_ship) exit
    
    entity_issue_command(get_ship,"trigger",true)
    }

if am_server()
    {

    }
