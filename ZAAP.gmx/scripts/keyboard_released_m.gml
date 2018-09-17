///keyboard_released_m()

if not keyboard_check_released(ord('M'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = my_ship()
    if is_zero(get_ship) exit
    
    entity_issue_command(get_ship,"mining laser",true)
    }
if am_server()
    {
    exit
    }
