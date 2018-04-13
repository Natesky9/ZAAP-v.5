///keyboard_released_space()

if not keyboard_check_released(vk_space)
or keyboard_focus == "console"
exit

if am_client()
    {
    //trigger
    var get_ship = my_ship()
    if is_zero(get_ship)
        {
        console_add("You don't have a ship! Press Control to make one")
        exit
        }
    
    if entity_is_docked(get_ship)
        {
        show("docked entity pressed left up")
        exit
        }
    entity_issue_command(get_ship,"trigger",false)
    }

if am_server()
    {
    
    }
