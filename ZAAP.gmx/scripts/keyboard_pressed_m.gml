///keyboard_pressed_m()

if not keyboard_check_pressed(ord('M'))
exit
//add in case for console and game
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
